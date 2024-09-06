<template>
    <aside class="w-64 bg-red-700 text-white h-screen">
      <div class="px-6 py-4">
        <h1 class="text-xl font-bold">Katering</h1>
      </div>
      <nav class="mt-6">
        <ul>
          <li>
            <a href="/dashboard" class="block px-6 py-2 text-white hover:bg-red-600x">Dashboard</a>
          </li>
          <div v-if="user === 'merchant'">
            <li>
              <a href="/menu" class="block px-6 py-2 text-white hover:bg-red-600x">Product Menu</a>
            </li>
            <li>
              <a href="/order" class="block px-6 py-2 text-white hover:bg-red-600x">Order</a>
            </li>
          </div>
          <div v-else>
            <li>
              <a href="/katalog-list" class="block px-6 py-2 text-white hover:bg-red-600x">Katalog Katering</a>
            </li>
            <li>
              <a href="/invoice-list" class="block px-6 py-2 text-white hover:bg-red-600x">Daftar Invoice</a>
            </li>
          </div>
        </ul>
      </nav>
    </aside>
</template>

<script>
import { ref } from 'vue';

export default {
    name: 'Sidebar',
    setup() {
      const user = ref(null)

      const userData = localStorage.getItem('userRole')
      if (userData) {
        user.value = userData
      }
      
      return {
        user
      }
    }
}
</script>

<style scoped>
aside {
  background-color: #336bee;
}

ul li {
  border-bottom: 1px solid rgba(255, 255, 255, 0.3); /* Garis pemisah */
}

ul li:last-child {
  border-bottom: none; /* Hilangkan garis pada elemen terakhir */
}

a {
  text-decoration: none;
  display: block;
}

a:hover {
  background-color: rgba(255, 255, 255, 0.1); /* Efek hover */
}
</style>