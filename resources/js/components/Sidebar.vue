<template>
    <aside class="w-64 bg-red-700 text-white h-screen">
      <div class="px-6 py-4">
        <h1 class="text-xl font-bold">Katering</h1>
      </div>
      <nav class="mt-6">
        <ul>
          <li>
            <a href="#" class="block px-6 py-2 text-white hover:bg-red-600x">Menu 1</a>
          </li>
          <li>
            <a href="#" class="block px-6 py-2 text-white hover:bg-red-600x">Menu 2</a>
          </li>
          <li>
            <a href="#" class="block px-6 py-2 text-white hover:bg-red-600x">Menu 3</a>
          </li>
        </ul>
      </nav>
    </aside>
</template>

<script>
export default {
    name: 'Sidebar'
}
</script>

<style scoped>
/* Warna sidebar yang profesional untuk restoran */
aside {
  background-color: #c0392b; /* Warna merah khas restoran */
}

/* Perbaiki efek hover agar lebih halus */
a {
  transition: background-color 0.3s ease, color 0.3s ease;
}
</style>