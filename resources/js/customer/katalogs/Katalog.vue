<template>
    <div class="p-6">
      <!-- Search Bar -->
      <div class="mb-6">
        <input 
          v-model="searchQuery" 
          type="text" 
          placeholder="Search menu name or categories or locations..." 
          class="w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
        />
      </div>
  
      <!-- Card Grid -->
      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
        <div 
          v-for="(item, index) in filteredCards" 
          :key="index" 
          class="bg-white rounded-lg shadow-md p-4"
        >
          <img v-if="item.image" :src="`/storage/${item.image}`" alt="Menu Image" class="w-full h-64 object-cover"/>
          <span v-else>No Image</span>
          <h3 class="text-lg font-semibold mb-2">{{ item.name }}</h3>
          <small class="text-gray-600">{{ item.category.category_name }}</small>
          <br/><small class="text-dark-200">{{ item.location.location_name }}</small>
          <p class="text-gray-600 my-2">{{ item.description }}</p>
          <a href="#" class="text-blue-800" @click.prevent="detailKatalog(item.id)">More...</a>
        </div>
      </div>
    </div>
</template>
  
<script>
  import axios from 'axios';
import { ref, computed, onMounted } from 'vue';
import router from '../../router';
  
  export default {
    name: 'CardList',
    setup() {
      const searchQuery = ref('');
      const menus = ref([]);

      const fetchMenus = async() => {
        try {
            const token = localStorage.getItem('authToken');

            const response = await axios.get('/api/menus/', {
                Authorization: `Bearer ${token}`
            });
            menus.value = response.data.data;
            console.log(response.data.data);
        } catch(error) {
            console.error(error);
        }
      }
  
      const filteredCards = computed(() => {
        if (searchQuery.value.trim() === '') {
          return menus.value;
        }
        return menus.value.filter(menu =>
          menu.name.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
          menu.category.category_name.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
          menu.location.location_name.toLowerCase().includes(searchQuery.value.toLowerCase())
        );
      });

      const detailKatalog = async (id) => {
        router.push({ name: 'KatalogDetail', params: { id } })
      }

      onMounted(fetchMenus)
  
      return {
        searchQuery,
        menus,
        filteredCards,
        detailKatalog
      };
    }
  };
</script>
  