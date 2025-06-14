<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('penjualan_barangs', function (Blueprint $table) {
            $table->id();
            $table->string('invoice_number');
            $table->string('nama_pembeli');
            $table->string('alamat_pembeli');
            $table->string('telepon_pembeli');
            $table->string('status');
            $table->date('tgl_pembelian')->nullable();
            $table->date('tgl_pengiriman')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('penjualan_barangs');
    }
};
