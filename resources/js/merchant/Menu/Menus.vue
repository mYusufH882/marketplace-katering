<template>
    <div class="container mx-auto py-6">
      <h1 class="text-3xl font-bold mb-6">Product Menu</h1>
  
      <button
        @click="addMenu"
        class="bg-blue-500 text-white font-bold py-2 px-4 rounded mb-4 hover:bg-blue-700"
      >
        Add Menu
      </button>
  
      <div class="overflow-x-auto">
        <table class="w-full bg-white border border-gray-300">
          <thead>
            <tr class="bg-gray-200">
              <th class="py-2 px-4 border-b">#</th>
              <th class="py-2 px-4 border-b">Menu Name</th>
              <th class="py-2 px-4 border-b">Description</th>
              <th class="py-2 px-4 border-b">Price</th>
              <th class="py-2 px-4 border-b">Action</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(menu, index) in menus" :key="menu.id" class="hover:bg-gray-100">
                <td class="py-2 px-4 border-b">{{ index + 1 }}</td>
                <td class="py-2 px-4 border-b">{{ menu.name }}</td>
                <td class="py-2 px-4 border-b">{{ menu.description }}</td>
                <td class="py-2 px-4 border-b">{{ menu.price }}</td>
                <td class="py-2 px-4 border-b">
                <button
                    @click="editMenu(menu.id)"
                    class="bg-green-500 text-white font-bold py-1 px-3 rounded hover:bg-green-700 mr-2"
                >
                    Edit
                </button>
                <button
                    @click="deleteMenu(menu.id)"
                    class="bg-red-500 text-white font-bold py-1 px-3 rounded hover:bg-red-700"
                >
                    Delete
                </button>
                </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </template>
  
  <script>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  import router from '../../router';
  
  export default {
    name: 'Menus',
    setup() {
      const menus = ref([]);
  
      const fetchMenus = async() => {
        const token = localStorage.getItem('authToken')
        try {
          const response = await axios
            .get('/api/menus', {
              headers: {
                Authorization: `Bearer ${token}`
              }
            });

            menus.value = response.data.data
        } catch(error) {
          console.error(error);
        }
      };
  
      const addMenu = () => {
        router.push('/form-menu')
      };
  
      const editMenu = (id) => {
        router.push({ name: 'EditMenu', params: { id } });
      };
  
      const deleteMenu = async (id) => {
        const isConfirmed = window.confirm('Are you sure you want to delete this menu?');
        if (isConfirmed) {
          try {
            const token = localStorage.getItem('authToken');
            await axios.delete(`/api/menus/${id}`, {
              headers: {
                Authorization: `Bearer ${token}`
              }
            }); 
  
            fetchMenus();
            alert('Menu deleted successfully');
          } catch(error) {
            console.error('Error deleting menu:', error);
          }
        }
      };
  
      onMounted(() => {
        fetchMenus();
      });
  
      return {
        menus,
        addMenu,
        editMenu,
        deleteMenu,
      };
    },
  };
  </script>

  