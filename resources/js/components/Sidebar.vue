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
          <li>
            <a href="/menu" class="block px-6 py-2 text-white hover:bg-red-600x">Product Menu</a>
          </li>
          <li>
            <a href="/order" class="block px-6 py-2 text-white hover:bg-red-600x">Order</a>
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
aside {
  background-color: #c0392b;
}
</style>