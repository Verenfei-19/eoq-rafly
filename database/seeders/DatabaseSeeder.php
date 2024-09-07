<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            BarangSeeder::class,
            UserSeeder::class,
            GudangSeeder::class,
            CounterSeeder::class,
            BarangGudangSeeder::class,
            BarangCounterSeeder::class,
            PenjualanSeeder::class,
        ]);
    }
}
