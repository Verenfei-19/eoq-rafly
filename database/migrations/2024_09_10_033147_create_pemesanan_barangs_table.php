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
        Schema::create('pemesanan_barangs', function (Blueprint $table) {
            $table->id();
            $table->string('invoice');
            $table->string('id_barang');
            $table->string('status_pemesanan');
            $table->integer('biaya_pemesanan');
            $table->integer('eoq');
            $table->integer('rop');
            $table->integer('jumlah_pemesanan');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pemesanan_barangs');
    }
};
