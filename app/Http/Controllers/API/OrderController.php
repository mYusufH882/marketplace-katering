<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Invoices;
use App\Models\Menu;
use App\Models\OrderItems;
use App\Models\Orders;
use Carbon\Carbon;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Invoices::with(['orders', 'orders.items.menu', 'user'])->get();

        return response()->json([
            'message' => 'List Order & Invoices',
            'data' => $orders
        ], 200);
    }

    private function generateInvoiceCode($userId, $userName)
    {
        $currentDate = Carbon::now()->format('Ymd');
        $invoiceCode = $currentDate . '-'. $userId . '-'. $userName .'-IVC';

        return $invoiceCode;
    }

    public function orderMenu(Request $request)
    {
        $validated = $request->validate([
            'items' => 'required|array',
            'items.*.menu_id' => 'required|exists:menus,id',
            'items.*.quantity' => 'required|integer|min:1',
            'delivery_date' => 'required|date',
        ]);       
        
        $totalAmount = 0;

        foreach ($validated['items'] as $item) {
            $menu = Menu::find($item['menu_id']);
            $totalAmount += $menu->price * $item['quantity'];
        }

        $invoice = Invoices::create([
            'user_id' => auth()->user()->id,
            'total_amount' => $totalAmount,
            'issued_date' => now(),
            'due_date' => now()->addDays(7),
            'status' => 'pending',
            'invoice_code' => $this->generateInvoiceCode(auth()->user()->id, auth()->user()->name)
        ]);
    
        $order = Orders::create([
            'user_id' => auth()->user()->id,
            'invoice_id' => $invoice->id,
            'order_date' => now(),
            'delivery_date' => $validated['delivery_date'],
            'status' => 'pending',
            'total_amount' => $totalAmount,
        ]);

        foreach ($validated['items'] as $item) {
            $menu = Menu::find($item['menu_id']);
            OrderItems::create([
                'order_id' => $order->id,
                'menu_id' => $menu->id,
                'quantity' => $item['quantity'],
                'price' => $menu->price,
            ]);
        }

        return response()->json([
            'message' => 'Order created successfully',
            'order' => $order,
            'invoice' => $invoice
        ], 201);    
    }
}
