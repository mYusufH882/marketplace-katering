<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(Request $request) 
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        if (Auth::attempt($request->only('email', 'password'))) {
            $user = Auth::user();
            $token = $user->createToken('LaravelApp')->plainTextToken;
    
            return response()->json([
                'token' => $token,
                'role' => $user->role,
                'message' => 'Login successful!'
            ], 200);
        }

        return response()->json([
            'message' => 'Invalid credentials',
        ], 401);
    }
}
