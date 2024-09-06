<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        \DB::table('categories')->insert([
            ['category_name' => 'Pernikahan'],
            ['category_name' => 'Ulang Tahun'],
            ['category_name' => 'Corporate Event'],
            ['category_name' => 'Keluarga'],
            ['category_name' => 'Paket Harian'],
            ['category_name' => 'Buffet'],
            ['category_name' => 'Coffee Break'],
            ['category_name' => 'Barbecue'],
            ['category_name' => 'Makanan Tradisional'],
            ['category_name' => 'Western Food'],
        ]);
    }
}
