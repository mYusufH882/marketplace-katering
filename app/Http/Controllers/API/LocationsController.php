<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Locations;
use Illuminate\Http\Request;

class LocationsController extends Controller
{
    public function index()
    {
        $locations = Locations::get();

        return response()->json([
            'message' => 'List Locations',
            'data' => $locations
        ], 200);
    }
}
