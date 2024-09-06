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
                    <tr v-for="(item, index) in invoices" :key="item.id" class="hover:bg-gray-100">
                        <td class="py-2 px-4 border-b">{{ index + 1 }}</td>
                        <td class="py-2 px-4 border-b">{{ item.invoice_code }}</td>
                        <td class="py-2 px-4 border-b">{{ item.orders[index].items[index].menu.name }}</td>
                        <td class="py-2 px-4 border-b">{{ formatDate(item.orders[index].order_date) }}</td>
                        <td class="py-2 px-4 border-b">{{ formatDate(item.orders[index].delivery_date) }}</td>
                        <td class="py-2 px-4 border-b">{{ item.status }}</td>
                        <td class="py-2 px-4 border-b">{{ formatCurrency(item.total_amount) }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import { onMounted, ref } from 'vue';

export default {
    name: 'InvoiceList',
    setup() {
        const invoices = ref([])

        const fetchInvoices = async () => {
            try {
                const token = localStorage.getItem('authToken')
    
                const response = await axios.get('/api/orders', {
                    headers: {
                        Authorization: `Bearer ${token}`
                    }
                });

                invoices.value = response.data.data
                console.log(response.data.data);
            } catch(error) {
                console.error(error);
            }
        }

        const formatDate = (dateString) => {
            if (!dateString) return 'N/A';
            const date = new Date(dateString);
            return date.toLocaleDateString(); 
        }

        const formatCurrency = (amount) => {
            return new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR' }).format(amount);
        }

        onMounted(fetchInvoices)

        return {
            invoices,
            fetchInvoices,
            formatDate,
            formatCurrency,
        };
    }
}
</script>