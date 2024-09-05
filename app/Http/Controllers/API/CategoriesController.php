<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Categories;
use Illuminate\Http\Request;

class CategoriesController extends Controller
{
    public function index()
    {
        $categories = Categories::get();

        return response()->json([
            'message' => 'List Categories',
            'data' => $categories
        ], 200);
    }
}
