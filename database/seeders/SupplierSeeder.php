<?php

namespace Database\Seeders;

use App\Models\Supplier;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SupplierSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            [
                'nama' => 'PT. SRITEX',
                'waktu' => 5,
                'id_barang' => 'B00001'
            ],
            [
                'nama' => 'PT. SRITEX',
                'waktu' => 4,
                'id_barang' => 'B00002'
            ],
            [
                'nama' => 'PT. SRITEX',
                'waktu' => 5,
                'id_barang' => 'B00003'
            ],
            [
                'nama' => 'CITRA TEXTILE',
                'waktu' => 5,
                'id_barang' => 'B00004'
            ],
            [
                'nama' => 'CITRA TEXTILE',
                'waktu' => 4,
                'id_barang' => 'B00005'
            ],
            [
                'nama' => 'CITRA TEXTILE',
                'waktu' => 4,
                'id_barang' => 'B00006'
            ],
            [
                'nama' => 'CITRA TEXTILE',
                'waktu' => 6,
                'id_barang' => 'B00007'
            ],
            [
                'nama' => 'CITRA TEXTILE',
                'waktu' => 2,
                'id_barang' => 'B00008'
            ],
            [
                'nama' => 'CITRA TEXTILE',
                'waktu' => 3,
                'id_barang' => 'B00009'
            ],
        ];

        foreach ($data as $key => $value) {
            Supplier::create([
                'nama' => $value['nama'],
                'telepon' => fake('id_ID')->phoneNumber(),
                'alamat' => fake('id_ID')->address(),
                'waktu' => $value['waktu'],
                'id_barang' => $value['id_barang']
            ]);
        }
    }
}
