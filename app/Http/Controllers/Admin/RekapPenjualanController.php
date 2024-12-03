<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Barang;
use App\Models\PenjualanBarang;
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

                // $data = PenjualanBarang::all([
                //     'id_barang',
                //     'nama_barang',
                //     'tgl_pembelian',
                //     'harga_barang',
                //     'quantity',
                // ])->whereBetween('tgl_pembelian', [$startdate, $request->end_date]);
                $query = "
                SELECT id_barang, nama_barang, SUM(quantity) AS total_quantity, SUM(quantity * harga_barang) AS total_harga 
                FROM penjualan_barang_details WHERE tgl_pembelian BETWEEN '$startdate' AND '$enddate' GROUP BY id_barang, nama_barang;
                ";
                $data = DB::select($query);
            } else if ($request->filled('start_date')) {
                // $data = PenjualanBarang::all([
                //     'id_barang',
                //     'nama_barang',
                //     'tgl_pembelian',
                //     'harga_barang',
                //     'quantity',
                // ])->where('tgl_pembelian', "$request->start_date");
                $query = "
                SELECT id_barang, nama_barang, SUM(quantity) AS total_quantity, SUM(quantity * harga_barang) AS total_harga 
                FROM penjualan_barang_details WHERE tgl_pembelian = '$request->start_date' GROUP BY id_barang, nama_barang;
                ";
                $data = DB::select($query);
            } else {
                // $query = '
                // SELECT nama_barang, SUM(quantity) as quantity, tgl_pembelian,harga_barang, SUM(quantity*harga_barang) as total FROM `penjualan_barangs` 
                // WHERE tgl_pembelian = "' . date('Y-m-d') . '" GROUP BY nama_barang,harga_barang
                // ';
                // $data = PenjualanBarang::all([
                //     'id_barang',
                //     'nama_barang',
                //     'tgl_pembelian',
                //     'harga_barang',
                //     'quantity',
                // ]);
                $query = "
                SELECT id_barang, nama_barang, SUM(quantity) AS total_quantity, SUM(quantity * harga_barang) AS total_harga 
                FROM penjualan_barang_details WHERE tgl_pembelian = '" . date('Y-m-d') . "' GROUP BY id_barang, nama_barang;
                ";
                $data = DB::select($query);
                // $query = '
                // SELECT nama_barang, SUM(quantity) as quantity, harga_barang, SUM(quantity*harga_barang) as total FROM `penjualan_barangs` GROUP BY nama_barang,harga_barang;
                // ';
                // $data = DB::select($query);
            }
            // SELECT nama_barang, SUM(quantity) as item_terjual, harga_barang, tgl_pembelian, SUM(quantity*harga_barang) as total_penjualan FROM `penjualan_barangs` WHERE MONTH(tgl_pembelian) = 8 AND YEAR(tgl_pembelian) = 2024 GROUP BY nama_barang,harga_barang,tgl_pembelian;
            $total_harga_item = 0;
            $total_harga_penjualan = 0;
            foreach ($data as $key => $value) {
                // $total_harga_item += $value['harga_barang'];
                $total_harga_item += $value->total_harga;
                // $total_harga_penjualan += $value['harga_barang'] * $value['quantity'];
                $total_harga_penjualan += $value->total_harga * $value->total_quantity;
            }

            return DataTables::of($data)
                ->addIndexColumn()
                // ->addColumn('total_penjualan', function ($object) {
                //     return $object->harga_barang * $object->quantity;
                // })
                ->addColumn('total_harga_item', function ($object) use ($total_harga_item) {
                    return $total_harga_item;
                })
                // ->addColumn('total_harga_penjualan', function ($object) use ($total_harga_penjualan) {
                //     return $total_harga_penjualan;
                // })
                ->make(true);
        }
        return view('pages.kasir.rekap-penjualan', compact('user'));
    }
}
