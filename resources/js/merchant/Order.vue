<template>
    <div class="container mx-auto py-6">
      <h1 class="text-3xl font-bold mb-6">Order</h1>
  
      <!-- Membungkus tabel dengan overflow-x-auto agar tabel dapat di-scroll pada layar kecil -->
      <div class="overflow-x-auto">
        <table class="w-full bg-white border border-gray-300">
          <thead>
            <tr class="bg-gray-200">
              <th class="py-2 px-4 border-b">#</th>
              <th class="py-2 px-4 border-b">User</th>
              <th class="py-2 px-4 border-b">Invoice</th>
              <th class="py-2 px-4 border-b">Order Date</th>
              <th class="py-2 px-4 border-b">Delivery Date</th>
              <th class="py-2 px-4 border-b">Status</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'Order'
  }
  </script>
  