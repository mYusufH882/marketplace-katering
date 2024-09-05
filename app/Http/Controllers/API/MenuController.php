<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class MenuController extends Controller
{
    public function index() 
    {
        $menus = Menu::get();

        return response()->json([
            'message' => 'List Data Product Menu',
            'data' => $menus
        ], 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'category_id' => 'required|exists:categories,id',
            'location_id' => 'required|exists:locations,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|image|max:2048',
            'price' => 'required|numeric|between:0,9999999999.99',
        ]);

        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('images', 'public');
        }

        $menu = Menu::create([
            'user_id' => $request->user_id,
            'category_id' => $request->category_id,
            'location_id' => $request->location_id,
            'name' => $request->name,
            'description' => $request->description,
            'image' => $imagePath,
            'price' => $request->price,
        ]);

        return response()->json([
            'message' => 'Menu created successfully',
            'data' => $menu
        ], 201);
    }

    public function delete($id)
    {
        $menu = Menu::findOrFail($id);

        if ($menu->image) {
            Storage::delete($menu->image);
        }

        $menu->delete();

        return response()->json([
            'message' => 'Menu deleted successfully',
        ]);
    }
}
