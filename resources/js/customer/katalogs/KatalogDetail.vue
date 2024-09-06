<template>
    <div class="flex justify-center py-10">
        <div class="max-w-md w-full bg-white shadow-lg rounded-lg overflow-hidden">
            <!-- Card Header -->
            <div class="bg-gray-800 text-white p-4">
                <h2 class="text-2xl font-semibold text-center">{{ menu.name }}</h2>
            </div>
            
            <!-- Card Body -->
            <div class="p-6">
                <img v-if="menu.image" :src="`/storage/${menu.image}`" alt="Menu Image" class="w-full h-64 object-center"/>
                <span v-else>No Image</span>

                <span class="text-sm text-gray-500">Description :</span>
                <p class="text-dark-700 mb-4">{{ menu.description }}</p>

                <div class="flex items-center justify-between mb-2">
                    <span class="text-sm text-gray-500">Category:</span>
                    <span class="font-medium text-gray-700">{{ menu.category?.category_name }}</span>
                </div>

                <div class="flex items-center justify-between mb-2">
                    <span class="text-sm text-gray-500">Location:</span>
                    <span class="font-medium text-gray-700">{{ menu.location?.location_name }}</span>
                </div>

                <div class="flex items-center justify-between">
                    <span class="text-sm text-gray-500">Price:</span>
                    <span class="font-medium text-green-600">{{ menu.price }}</span>
                </div>

                <div class="mt-4">
                    <label for="quantity" class="block text-sm text-gray-500">Quantity:</label>
                    <input type="number" v-model="quantity" id="quantity" min="1" class="w-full mt-1 p-2 border rounded-md">
                </div>
            </div>

            <!-- Card Footer -->
            <div class="bg-gray-100 p-4">
                <button @click="orderMenu" class="w-full bg-green-600 text-white py-2 rounded-md hover:bg-green-500 mb-2">
                    Order
                </button>

                <button @click="goBack" class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-500">
                    Back to Menu
                </button>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router';
import router from '../../router';

export default {
    name: 'KatalogDetail',
    setup() {
        const menu = ref({});
        const quantity = ref(1);
        const route = useRoute();

        const fetchDetailMenu = async () => {
            try {
                const token = localStorage.getItem('authToken');
                const response = await axios.get(`/api/menus/${route.params.id}`, {
                    Authorization: `Bearer ${token}`
                });
    
                menu.value = response.data.data;
                console.log(response.data.data);
            } catch(error) {
                console.error(error);
            }
        }

        const orderMenu = async () => {
            try {
                const token = localStorage.getItem('authToken')
                const orderData = {
                    items: [
                        {
                            menu_id: menu.value.id,
                            quantity: quantity.value
                        }
                    ],
                    delivery_date: new Date().toISOString().slice(0, 10)
                };

                const response = await axios.post(`/api/orders`, orderData, {
                    headers: {
                        Authorization: `Bearer ${token}`
                    } 
                });

                menu.value = response.data.data;
                console.log(menu);

                router.push('/katalog-list');
            } catch(error) {
                console.error(error);
            }
        }

        const goBack = () => {
            router.push('/katalog-list')
        }

        onMounted(fetchDetailMenu);

        return {
            menu,
            quantity,
            orderMenu,
            goBack,
        };
    }
}
</script>