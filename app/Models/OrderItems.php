<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItems extends Model
{
    protected $fillable = [
        'order_id', 
        'menu_id', 
        'quantity', 
        'price'
    ];

    public function order()
    {
        return $this->belongsTo(Orders::class, 'order_id');
    }

    public function menu()
    {
        return $this->belongsTo(Menu::class);
    }
}
