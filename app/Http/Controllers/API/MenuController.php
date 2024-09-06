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
        $menus = Menu::with(['category', 'location'])->get();

        return response()->json([
            'message' => 'List Data Product Menu',
            'data' => $menus
        ], 200);
    }

    public function detail($id)
    {
        $menuId = Menu::with(['category', 'location'])->where('id', $id)->first();

        return response()->json([
            'message' => 'Detail Data Product Menu',
            'data' => $menuId
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

    public function edit(Request $request, $id) {
        $menu = Menu::findOrFail($id);
    
        $request->validate([
            'user_id' => 'required|integer',
            'category_id' => 'required|integer',
            'location_id' => 'required|integer',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048|string',
            'price' => 'required|numeric',
        ]);
    
        $menu->user_id = $request->input('user_id');
        $menu->category_id = $request->input('category_id');
        $menu->location_id = $request->input('location_id');
        $menu->name = $request->input('name');
        $menu->description = $request->input('description');
        $menu->price = $request->input('price');
    
        if ($request->hasFile('image')) {
            if ($menu->image) {
                Storage::delete($menu->image);
            }
            $menu->image = $request->file('image')->store('images', 'public');
        }
    
        $menu->save();
    
        return response()->json([
            'message' => 'Menu updated successfully',
            'data' => $menu
        ], 200);
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
