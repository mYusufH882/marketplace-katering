<template>
    <div class="container mx-auto py-6">
        <h1 class="text-3xl font-bold mb-6">Add Menu</h1>

        <form @submit.prevent="submitForm" class="space-y-6 bg-white p-6 rounded-lg shadow-md max-w-xl mx-auto">
            <div class="grid grid-cols-1 gap-6">
                <!-- Category -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Category</label>
                    <select v-model="form.category_id" class="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                        <option value="" disabled>Select Category</option>
                        <option v-for="category in categories" :key="category.id" :value="category.id">
                            {{ category.category_name }}
                        </option>
                    </select>
                </div>

                <!-- Location -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Location</label>
                    <select v-model="form.location_id" class="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                        <option value="" disabled>Select Location</option>
                        <option v-for="location in locations" :key="location.id" :value="location.id">
                            {{ location.location_name }}
                        </option>
                    </select>
                </div>

                <!-- Name -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Name</label>
                    <input
                        v-model="form.name"
                        type="text"
                        class="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                        placeholder="Product Name"
                    />
                </div>

                <!-- Description -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Description</label>
                    <textarea
                        v-model="form.description"
                        class="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                        placeholder="Product Description"
                    ></textarea>
                </div>

                <!-- Image -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Image</label>
                    <input
                        type="file"
                        @change="handleImageUpload"
                        class="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                    />
                </div>

                <!-- Price -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Price</label>
                    <input
                        v-model="form.price"
                        type="number"
                        step="0.01"
                        class="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                        placeholder="Price"
                    />
                </div>

                <!-- Submit Button -->
                <div class="flex justify-end">
                    <button type="submit" class="bg-blue-600 text-white font-bold py-2 px-6 rounded-lg shadow-sm hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                        Submit
                    </button>
                </div>
            </div>
        </form>


    </div>
</template>
  
<script>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import router from '../../router';

export default {
    setup() {
        const form = ref({
            user_id: '', 
            category_id: '',
            location_id: '',
            name: '',
            description: '',
            image: null,
            price: '',
        });

        const categories = ref([]);
        const locations = ref([]);

        const fetchCategories = () => {
            axios.get('/api/categories').then((response) => {
                categories.value = response.data.data;
            });
        };

        const fetchLocations = () => {
            axios.get('/api/locations').then((response) => {
                locations.value = response.data.data;
            });
        };

        const fetchUser = async () => {
            try {
                const response = await axios.get('/api/user'); // Endpoint API untuk mendapatkan pengguna
                form.value.user_id = response.data.data.id;
            } catch (error) {
                console.error('Error fetching user data:', error);
            }
        };

        const handleImageUpload = (event) => {
                form.value.image = event.target.files[0];
        };

        const submitForm = () => {
            const formData = new FormData();

            formData.append('user_id', form.value.user_id);
            formData.append('category_id', form.value.category_id);
            formData.append('location_id', form.value.location_id);
            formData.append('name', form.value.name);
            formData.append('description', form.value.description);
            formData.append('image', form.value.image);
            formData.append('price', form.value.price);

            axios.post('/api/menus', formData).then((response) => {
                router.push('/menu')
            });
        };

        onMounted(() => {
            fetchCategories();
            fetchLocations();
            fetchUser();
        });

        return {
            form,
            categories,
            locations,
            handleImageUpload,
            submitForm,
        };
    },
};
</script>
    