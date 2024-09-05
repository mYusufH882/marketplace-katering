<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class LocationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        \DB::table('locations')->insert([
            [
                'location_name' => 'Monas',
                'address' => 'Gambir, Jakarta Pusat, DKI Jakarta',
            ],
            [
                'location_name' => 'Borobudur',
                'address' => 'Borobudur, Magelang, Jawa Tengah',
            ],
            [
                'location_name' => 'Pantai Kuta',
                'address' => 'Kuta, Badung, Bali',
            ],
            [
                'location_name' => 'Gunung Bromo',
                'address' => 'Tengger, Probolinggo, Jawa Timur',
            ],
            [
                'location_name' => 'Danau Toba',
                'address' => 'Parapat, Sumatera Utara',
            ],
            [
                'location_name' => 'Taman Mini Indonesia Indah',
                'address' => 'Cipayung, Jakarta Timur, DKI Jakarta',
            ],
            [
                'location_name' => 'Gedung Sate',
                'address' => 'Citarum, Bandung Wetan, Kota Bandung, Jawa Barat',
            ],
            [
                'location_name' => 'Tangkuban Perahu',
                'address' => 'Lembang, Kabupaten Bandung Barat, Jawa Barat',
            ],
            [
                'location_name' => 'Kawah Putih',
                'address' => 'Ciwidey, Kabupaten Bandung, Jawa Barat',
            ],
            [
                'location_name' => 'Dago Dreampark',
                'address' => 'Pagerwangi, Lembang, Kabupaten Bandung Barat, Jawa Barat',
            ],
            [
                'location_name' => 'Trans Studio Bandung',
                'address' => 'Jl. Gatot Subroto No.289, Cibangkong, Kec. Batununggal, Kota Bandung, Jawa Barat',
            ],
        ]);
    }
}
