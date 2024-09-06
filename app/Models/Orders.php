<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Orders extends Model
{
    protected $fillable = [
        'user_id', 
        'invoice_id', 
        'order_date', 
        'delivery_date', 
        'status', 
        'total_amount'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function invoice()
    {
        return $this->belongsTo(Invoices::class, 'invoice_id', 'id')->withDefault();
    }

    public function items()
    {
        return $this->hasMany(OrderItems::class, 'order_id');
    }
}
