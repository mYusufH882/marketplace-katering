<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Invoices extends Model
{
    protected $fillable = [
        'user_id', 
        'total_amount', 
        'issued_date', 
        'due_date', 
        'status',
        'invoice_code'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function orders()
    {
        return $this->hasMany(Orders::class, 'invoice_id');
    }
}
