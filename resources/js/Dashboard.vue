<template>
    <div class="flex min-h-screen bg-gray-100">
    <!-- Sidebar -->
    <Sidebar />

    <!-- Main Content -->
    <div class="flex-1 flex flex-col">
      <!-- Navbar -->
      <Navbar />

      <!-- Content -->
      <main class="p-6 flex-1">
        <h2 class="text-2xl font-bold">Welcome to the Dashboard</h2>
        <p class="mt-4">This is your main content area.</p>
      </main>
    </div>
  </div>
</template>

<script>
import Navbar from './components/Navbar.vue';
import Sidebar from './components/Sidebar.vue';

export default {
  name: 'Dashboard',
  components: {
    Sidebar,
    Navbar,
  },
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