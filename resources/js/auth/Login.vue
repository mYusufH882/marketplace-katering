<template>
    <div class="min-h-screen flex justify-center items-center bg-gray-100">
      <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg">
        <h2 class="text-2xl font-bold text-center mb-6">Login</h2>
        <form @submit.prevent="login">
          <div class="mb-4">
            <label class="block text-gray-700">Email</label>
            <input type="email" v-model="email" class="w-full p-2 border border-gray-300 rounded" required />
          </div>
          <div class="mb-6">
            <label class="block text-gray-700">Password</label>
            <input type="password" v-model="password" class="w-full p-2 border border-gray-300 rounded" required />
          </div>
          <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded">Login</button>
        </form>
        <p class="text-center mt-4">
          Don't have an account? <router-link to="/register" class="text-blue-500">Register</router-link>
        </p>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        email: '',
        password: '',
      };
    },
    methods: {
      async login() {
        // Lakukan validasi atau panggil API login di sini
        console.log({
          email: this.email,
          password: this.password,
        });
        // Lanjutkan dengan request HTTP menggunakan Axios atau Fetch
      },
    },
  };
  </script>
  