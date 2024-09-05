<template>
  <header class="bg-red-600 shadow-md">
    <div class="px-6 py-4 flex justify-between items-center">
      <div class="text-xl font-bold text-white">Katering Market</div>
      <!-- Profile Dropdown -->
      <div class="relative">
        <button @click="toggleDropdown" class="flex items-center text-white focus:outline-none">
          <span class="mr-2">John Doe</span>
          <img class="h-8 w-8 rounded-full" src="https://via.placeholder.com/150" alt="Profile">
        </button>

        <!-- Dropdown -->
        <div
          v-if="dropdownOpen"
          class="absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 z-50"
        >
          <a href="#" class="block px-4 py-2 text-gray-700 hover:bg-gray-100" @click.prevent="editProfile">Edit Profile</a>
          <a href="#" class="block px-4 py-2 text-gray-700 hover:bg-gray-100" @click.prevent="logout">Logout</a>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
import axios from 'axios';
import { ref } from 'vue';
import { useRouter } from 'vue-router';

export default {
  name: 'Navbar',
  setup() {
    const dropdownOpen = ref(false);
    const router = useRouter();

    const toggleDropdown = () => {
      dropdownOpen.value = !dropdownOpen.value;
    };

    const logout = async () => {
      try {
        await axios.post('/api/logout');
        localStorage.removeItem('authToken');
        localStorage.removeItem('userRole');
        router.push('/login');
      } catch (error) {
        console.error('Logout failed:', error);
      }
    };

    const editProfile = () => {
      router.push('/profile/edit');
    };

    return {
      dropdownOpen,
      toggleDropdown,
      logout,
      editProfile,
    };
  },
};
</script>
