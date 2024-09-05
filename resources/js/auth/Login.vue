<template>
  <div class="min-h-screen flex justify-center items-center bg-gray-100">
    <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg">
      <h2 class="text-2xl mb-6 text-center">Login Marketplace Katering</h2>
      <form @submit.prevent="login">
        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="email">Email</label>
          <input v-model="form.email" type="email" id="email" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
        </div>
        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="password">Password</label>
          <input v-model="form.password" type="password" id="password" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
        </div>
        <div v-if="errorMessage" class="text-red-500 mb-4">{{ errorMessage }}</div>
        <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
          Login
        </button>
        <p class="text-center mt-4">
          Doesn't have an account? <router-link to="/register" class="text-blue-500">Register</router-link>
        </p>
      </form>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';

export default {
  setup() {
    const form = ref({
      email: '',
      password: '',
    });
    const errorMessage = ref('');
    const router = useRouter();

    const login = async () => {
      try {
        const response = await axios.post('/api/login', form.value);
        localStorage.setItem('authToken', response.data.token);
        localStorage.setItem('userRole', response.data.role);
        
        router.push('/dashboard');
      } catch (error) {
        if (error.response && error.response.data) {
          errorMessage.value = error.response.data.message;
        }
      }
    };

    return {
      form,
      errorMessage,
      login,
    };
  },
};
</script>
