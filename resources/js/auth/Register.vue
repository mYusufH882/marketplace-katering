<template>
    <div class="min-h-screen flex justify-center items-center bg-gray-100">
      <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg">
        <h2 class="text-2xl font-bold text-center mb-6">Register</h2>
        <form @submit.prevent="register">
          <div class="mb-4">
            <label class="block text-gray-700">Name</label>
            <input type="text" v-model="form.name" class="w-full p-2 border border-gray-300 rounded" required />
          </div>
          <div class="mb-4">
            <label class="block text-gray-700">Phone Number</label>
            <input type="text" v-model="form.phone_number" class="w-full p-2 border border-gray-300 rounded" required />
          </div>
          <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="role">Role</label>
            <select v-model="form.role" id="role" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
              <option value="customer">Customer</option>
              <option value="merchant">Merchant</option>
            </select>
          </div>
          <div class="mb-4">
            <label class="block text-gray-700">Email</label>
            <input type="email" v-model="form.email" class="w-full p-2 border border-gray-300 rounded" required />
          </div>
          <div class="mb-4">
            <label class="block text-gray-700">Password</label>
            <input type="password" v-model="form.password" class="w-full p-2 border border-gray-300 rounded" required />
          </div>
          <div class="mb-6">
            <label class="block text-gray-700">Confirm Password</label>
            <input type="password" v-model="form.password_confirmation" class="w-full p-2 border border-gray-300 rounded" required />
          </div>
          <div v-if="errorMessage" class="text-red-500 mb-4">{{ errorMessage }}</div>
          <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
            Register
          </button>
        </form>
        <p class="text-center mt-4">
          Already have an account? <router-link to="/login" class="text-blue-500">Login</router-link>
        </p>
      </div>
    </div>
</template>


<script>
import axios from 'axios';
import { ref } from 'vue';
import { useRouter } from 'vue-router';

export default {
  setup() {
    const form = ref({
      name: '',
      phone_number: '',
      role: 'customer',
      email: '',
      password: '',
      password_confirmation: '',
    })

    const errorMessage = ref('');
    const router = useRouter();

    const register = async () => {
      try {
        const response = await axios.post('/api/register', form.value);
        alert(response.data.message);
        router.push('/login');
      } catch (error) {
        if (error.response && error.response.data) {
          errorMessage.value = Object.values(error.response.data).join(', ');
        }
      }
    }

    return {
      form,
      errorMessage,
      register,
    };
  }
};
</script>