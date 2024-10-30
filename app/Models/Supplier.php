<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Supplier extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public static function generateSupplierId()
    {
        $supplier_id = DB::table('suppliers')->max('id');
        $addZero = '';
        $supplier_id = str_replace("S", "", $supplier_id);
        $supplier_id = (int) $supplier_id + 1;
        $incrementSupplierId = $supplier_id;

        if (strlen($supplier_id) == 1) {
            $addZero = "0000";
        } elseif (strlen($supplier_id) == 2) {
            $addZero = "000";
        } elseif (strlen($supplier_id) == 3) {
            $addZero = "00";
        } elseif (strlen($supplier_id) == 4) {
            $addZero = "0";
        }

        $newGudangId = "S" . $addZero . $incrementSupplierId;
        return $newGudangId;
    }
}
