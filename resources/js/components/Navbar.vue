<template>
    <header class="bg-red-600 shadow-md">
      <div class="px-6 py-4 flex justify-between items-center">
        <div class="text-xl font-bold text-dark">Restaurant Dashboard</div>
        <!-- Profile Dropdown -->
        <div class="relative">
          <button @click="toggleDropdown" class="flex items-center text-dark focus:outline-none">
            <span class="mr-2">John Doe</span>
            <img class="h-8 w-8 rounded-full" src="https://via.placeholder.com/150" alt="Profile">
          </button>
  
          <!-- Dropdown -->
          <div
            v-if="dropdownOpen"
            class="absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 z-50"
          >
            <a href="#" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Edit Profile</a>
            <a href="#" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Logout</a>
          </div>
        </div>
      </div>
    </header>
  </template>
  
  <script>
  export default {
    name: 'Navbar',
    data() {
      return {
        dropdownOpen: false, // Tambahkan dropdownOpen di data
      };
    },
    methods: {
      toggleDropdown() {
        this.dropdownOpen = !this.dropdownOpen;
      },
    },
  };
  </script>
  