<?php

use App\Http\Controllers\API\CategoriesController;
use App\Http\Controllers\API\LocationsController;
use App\Http\Controllers\API\MenuController;
use App\Http\Controllers\API\OrderController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/login', [LoginController::class, 'login']);
Route::post('/register', [RegisterController::class, 'register']);

Route::middleware(['auth:sanctum', 'role:merchant'])->group(function() {
    Route::get('/user', [UserController::class, 'getUser']);

    Route::group(['prefix' => 'menus'], function() {
        Route::get('/', [MenuController::class, 'index']);
        Route::post('/', [MenuController::class, 'store']);
        Route::delete('/{id}', [MenuController::class, 'delete']);
        Route::put('/{id}', [MenuController::class, 'edit']);
    });

    Route::get('/orders', [OrderController::class, 'index']);
    Route::get('/locations', [LocationsController::class, 'index']);
    Route::get('/categories', [CategoriesController::class, 'index']);
    
    Route::post('/logout', function (Request $request) {
        $user = $request->user();
        $user->tokens()->delete();
    
        return response()->json(['message' => 'Successfully logged out']);
    });
});

