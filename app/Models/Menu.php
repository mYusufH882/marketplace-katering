<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'category_id',
        'location_id',
        'name',
        'description',
        'image',
        'price',
    ];
}
