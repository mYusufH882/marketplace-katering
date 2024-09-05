<template>
    <div class="min-h-screen flex justify-center items-center bg-gray-100">
    <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg">
      <h2 class="text-2xl font-bold text-center mb-6">Register</h2>
      <form @submit.prevent="register">
        <div class="mb-4">
          <label class="block text-gray-700">Name</label>
          <input type="text" v-model="name" class="w-full p-2 border border-gray-300 rounded" required />
        </div>
        <div class="mb-4">
          <label class="block text-gray-700">Email</label>
          <input type="email" v-model="email" class="w-full p-2 border border-gray-300 rounded" required />
        </div>
        <div class="mb-4">
          <label class="block text-gray-700">Password</label>
          <input type="password" v-model="password" class="w-full p-2 border border-gray-300 rounded" required />
        </div>
        <div class="mb-6">
          <label class="block text-gray-700">Confirm Password</label>
          <input type="password" v-model="password_confirmation" class="w-full p-2 border border-gray-300 rounded" required />
        </div>
        <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded">Register</button>
      </form>
      <p class="text-center mt-4">
        Already have an account? <router-link to="/login" class="text-blue-500">Login</router-link>
      </p>
    </div>
  </div>
</template>


<script>
export default {
  data() {
    return {
      name: '',
      email: '',
      password: '',
      password_confirmation: '',
    };
  },
  methods: {
    async register() {
      // Lakukan validasi atau panggil API registrasi di sini
      console.log({
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.password_confirmation,
      });
      // Lanjutkan dengan request HTTP menggunakan Axios atau Fetch
    },
  },
};
</script>