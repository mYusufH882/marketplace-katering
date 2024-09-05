<template>
    <div class="flex min-h-screen bg-gray-100">
    <!-- Sidebar -->
    <aside class="w-64 bg-white shadow-md">
      <div class="px-6 py-4">
        <h1 class="text-xl font-bold">Dashboard</h1>
      </div>
      <nav class="mt-6">
        <ul>
          <li>
            <a href="#" class="block px-6 py-2 text-gray-700 hover:bg-gray-200">Menu 1</a>
          </li>
          <li>
            <a href="#" class="block px-6 py-2 text-gray-700 hover:bg-gray-200">Menu 2</a>
          </li>
          <li>
            <a href="#" class="block px-6 py-2 text-gray-700 hover:bg-gray-200">Menu 3</a>
          </li>
        </ul>
      </nav>
    </aside>

    <!-- Main Content -->
    <div class="flex-1 flex flex-col">
      <!-- Navbar -->
      <header class="bg-white shadow-md">
        <div class="px-6 py-4 flex justify-between items-center">
          <div class="text-xl font-bold">Dashboard Title</div>
          <!-- Profile Dropdown -->
          <div class="relative" @click.away="open = false" @close.stop="open = !open">
            <button @click="toggleDropdown" class="flex items-center text-gray-700 focus:outline-none">
              <span class="mr-2">Profile Name</span>
              <img class="h-8 w-8 rounded-full" src="https://via.placeholder.com/150" alt="Profile">
            </button>

            <!-- Dropdown -->
            <div v-if="dropdownOpen" class="absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1">
              <a href="#" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Edit Profile</a>
              <a href="#" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Logout</a>
            </div>
          </div>
        </div>
      </header>

      <!-- Content -->
      <main class="p-6 flex-1">
        <h2 class="text-2xl font-bold">Welcome to the Dashboard</h2>
        <p class="mt-4">This is your main content area.</p>
      </main>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dropdownOpen: false,
    };
  },
  methods: {
    toggleDropdown() {
      this.dropdownOpen = !this.dropdownOpen;
    },
  },
};
</script>