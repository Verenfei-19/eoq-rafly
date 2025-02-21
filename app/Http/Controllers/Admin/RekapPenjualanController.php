<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class RekapPenjualanController extends Controller
{
    public function userAuth()
    {
        $user = Auth::guard('user')->user();
        return $user;
    }

    public function index(Request $request)
    {
        $user = $this->userAuth();
        if ($request->ajax()) {

            if ($request->filled('start_date') && $request->filled('end_date')) {
                $startdate = $request->start_date;
                $enddate = $request->end_date;

                $query = "
                SELECT id_barang, nama_barang, SUM(quantity) AS total_quantity, SUM(quantity * harga_barang) AS total_harga 
                FROM penjualan_barang_details WHERE tgl_pembelian BETWEEN '$startdate' AND '$enddate' GROUP BY id_barang, nama_barang;
                ";
                $data = DB::select($query);
            } else if ($request->filled('start_date')) {
                $query = "
                SELECT id_barang, nama_barang, SUM(quantity) AS total_quantity, SUM(quantity * harga_barang) AS total_harga 
                FROM penjualan_barang_details WHERE tgl_pembelian = '$request->start_date' GROUP BY id_barang, nama_barang;
                ";
                $data = DB::select($query);
            } else {
                $query = "
                SELECT id_barang, nama_barang, SUM(quantity) AS total_quantity, SUM(quantity * harga_barang) AS total_harga 
                FROM penjualan_barang_details WHERE tgl_pembelian = '" . date('Y-m-d') . "' GROUP BY id_barang, nama_barang;
                ";
                $data = DB::select($query);
            }
            $total_harga_item = 0;
            $total_harga_penjualan = 0;
            foreach ($data as $key => $value) {
                $total_harga_item += $value->total_harga;
                $total_harga_penjualan += $value->total_harga * $value->total_quantity;
            }

            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('total_harga_item', function ($object) use ($total_harga_item) {
                    return $total_harga_item;
                })
                ->make(true);
        }
        return view('pages.kasir.rekap-penjualan', compact('user'));
    }
}
