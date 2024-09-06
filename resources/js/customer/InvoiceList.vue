<template>
    <div class="container mx-auto py-6">
        <h1 class="text-3xl font-bold mb-6">List Invoice</h1>

        <div class="overflow-x-auto">
            <table class="w-full bg-white border border-gray-300">
                <thead>
                    <tr class="bg-gray-200">
                        <th class="py-2 px-4 border-b">#</th>
                        <th class="py-2 px-4 border-b">Invoice Code</th>
                        <th class="py-2 px-4 border-b">Item Name</th>
                        <th class="py-2 px-4 border-b">Order Date</th>
                        <th class="py-2 px-4 border-b">Delivery Date</th>
                        <th class="py-2 px-4 border-b">Status</th>
                        <th class="py-2 px-4 border-b">Total Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="hover:bg-gray-100">
                        <td class="py-2 px-4 border-b"></td>
                        <td class="py-2 px-4 border-b"></td>
                        <td class="py-2 px-4 border-b"></td>
                        <td class="py-2 px-4 border-b"></td>
                        <td class="py-2 px-4 border-b"></td>
                        <td class="py-2 px-4 border-b"></td>
                        <td class="py-2 px-4 border-b"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
export default {
    name: 'InvoiceList'
}
</script>