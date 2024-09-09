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
            // $table->foreign('id_barang')->references('barang_id')->on('barangs');
            $table->string('id_barang');
            $table->string('nama_barang');
            $table->string('invoice_number');
            $table->string('nama_pembeli');
            $table->string('alamat_pembeli');
            $table->string('telepon_pembeli');
            $table->integer('quantity');
            $table->integer('harga_barang');
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
