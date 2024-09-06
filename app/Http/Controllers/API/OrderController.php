<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Orders;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Orders::get();

        return response()->json([
            'message' => 'List Order & Invoices',
            'data' => $orders
        ], 200);
    }
}
