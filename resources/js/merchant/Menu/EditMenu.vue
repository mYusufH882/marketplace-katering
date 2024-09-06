<template>
    <div class="container mx-auto py-6">
      <h1 class="text-3xl font-bold mb-6">Edit Menu</h1>
  
      <form @submit.prevent="submitForm" class="space-y-4">
        <div>
          <label class="block text-sm font-medium text-gray-700">Category</label>
          <select
            v-model="form.category_id"
            class="block w-full mt-1 border-gray-300 rounded-md shadow-sm"
          >
            <option value="" disabled>Select Category</option>
            <option v-for="category in categories" :key="category.id" :value="category.id">
              {{ category.category_name }}
            </option>
          </select>
        </div>
  
        <div>
          <label class="block text-sm font-medium text-gray-700">Location</label>
          <select
            v-model="form.location_id"
            class="block w-full mt-1 border-gray-300 rounded-md shadow-sm"
          >
            <option value="" disabled>Select Location</option>
            <option v-for="location in locations" :key="location.id" :value="location.id">
              {{ location.location_name }}
            </option>
          </select>
        </div>
  
        <div>
          <label class="block text-sm font-medium text-gray-700">Name</label>
          <input
            v-model="form.name"
            type="text"
            class="block w-full mt-1 border-gray-300 rounded-md shadow-sm"
            placeholder="Product Name"
          />
        </div>
  
        <div>
          <label class="block text-sm font-medium text-gray-700">Description</label>
          <textarea
            v-model="form.description"
            class="block w-full mt-1 border-gray-300 rounded-md shadow-sm"
            placeholder="Product Description"
          ></textarea>
        </div>
  
        <div>
          <label class="block text-sm font-medium text-gray-700">Image</label>
          <input
            type="file"
            @change="handleImageUpload"
            class="block w-full mt-1 border-gray-300 rounded-md shadow-sm"
          />
          <!-- Preview Image -->
          <img v-if="imagePreviewUrl" :src="imagePreviewUrl" alt="Image Preview" class="mt-2 w-32 h-32 object-cover"/>
        </div>
  
        <div>
          <label class="block text-sm font-medium text-gray-700">Price</label>
          <input
            v-model.number="form.price"
            type="number"
            step="0.01"
            class="block w-full mt-1 border-gray-300 rounded-md shadow-sm"
            placeholder="Price"
          />
        </div>
  
        <button
          type="submit"
          class="bg-green-500 text-white font-bold py-2 px-4 rounded hover:bg-green-700 mr-2"
        >
          Update Menu
        </button>

        <a
          href="/menu"
          class="bg-blue-500 text-white font-bold py-2 px-4 rounded hover:bg-blue-700"
        >
          Back
        </a>
      </form>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import { ref, onMounted, computed } from 'vue';
import router from '../../router';
  
  export default {
    name: 'EditMenu',
    props: {
      id: {
        type: Number,
        required: true,
      },
    },
    setup(props) {
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
  
      const imagePreviewUrl = computed(() => {
        if (form.value.image) {
          return URL.createObjectURL(form.value.image);
        }
        return '';
      });
  
      const fetchCategories = async() => {
        try {
          const token = localStorage.getItem('authToken')
          const response = await axios.get('/api/categories', {
            headers: {
              Authorization: `Bearer ${token}`
            }
          });
  
          categories.value = response.data.data;
        } catch(error) {
          console.error(error);
        }
      };
  
      const fetchLocations = async() => {
        try {
          const token = localStorage.getItem('authToken')
          const response = await axios.get('/api/locations', {
            headers: {
              Authorization: `Bearer ${token}`
            }
          });

          locations.value = response.data.data;
        } catch(error) {
          console.error(error);
        }
      };
  
      const fetchMenu = async() => {
        try {
          const token = localStorage.getItem('authToken')
          const response = await axios.get(`/api/menus/${props.id}`, {
            headers: {
              Authorization: `Bearer ${token}`
            }
          });

          const menuData = response.data.data;
          const user = JSON.parse(localStorage.getItem('user'));

          form.value = {
            user_id: user.id,
            category_id: menuData.category_id,
            location_id: menuData.location_id,
            name: menuData.name,
            description: menuData.description,
            image: null,
            price: menuData.price,
          };          
        } catch(error) {
          console.error(error);
        }
      };
  
      const handleImageUpload = (event) => {
        form.value.image = event.target.files[0];
      };
  
      const submitForm = async() => {
        try {
          const token = localStorage.getItem('authToken')
          const formData = new FormData();
          const user = JSON.parse(localStorage.getItem('user'));

          if (!user || !user.id) {
            throw new Error('User is not logged in or user_id is missing.');
          }

          formData.append('user_id', user.id);
          formData.append('category_id', form.value.category_id);
          formData.append('location_id', form.value.location_id);
          formData.append('name', form.value.name);
          formData.append('description', form.value.description);
          if (form.value.image) {
            formData.append('image', form.value.image);
          }
          formData.append('price', form.value.price);

          await axios.put(`/api/menus/${props.id}`, formData, {
            headers: {
              Authorization: `Bearer ${token}`
            }
          });

          router.push('/menu');
        } catch(error) {
          console.error(error);
        }
      };
  
      onMounted(() => {
        fetchCategories();
        fetchLocations();
        fetchMenu();
      });
  
      return {
        form,
        categories,
        locations,
        handleImageUpload,
        submitForm,
        imagePreviewUrl,
      };
    },
  };
  </script>
  