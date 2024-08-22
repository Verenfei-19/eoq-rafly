<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
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

                $data = PenjualanBarang::all([
                    'nama_barang',
                    'tgl_pembelian',
                    'harga_barang',
                    'quantity',
                ])->whereBetween('tgl_pembelian', [$request->start_date, $request->end_date]);

                // $data =   PenjualanBarang::select(
                //     'nama_barang',
                //     DB::raw('SUM(quantity) as item_terjual'),
                //     'harga_barang',
                //     DB::raw('SUM(quantity * harga_barang) as total_penjualan')
                // )
                //     ->whereBetween('tgl_pembelian', [$request->start_date, $request->end_date])
                //     // ->whereMonth('tgl_pembelian', date('m'))->whereYear('tgl_pembelian', date('Y'))
                //     ->groupBy('nama_barang', 'harga_barang');

            } else {
                $data = PenjualanBarang::all([
                    'nama_barang',
                    'tgl_pembelian',
                    'harga_barang',
                    'quantity',
                ]);
                // $data =   PenjualanBarang::select(
                //     'nama_barang',
                //     DB::raw('SUM(quantity) as item_terjual'),
                //     'harga_barang',
                //     DB::raw('SUM(quantity * harga_barang) as total_penjualan')
                // )->whereMonth('tgl_pembelian', date('m'))->whereYear('tgl_pembelian', date('Y'))
                //     ->groupBy('nama_barang', 'harga_barang');
            }
            // SELECT nama_barang, SUM(quantity) as item_terjual, harga_barang, tgl_pembelian, SUM(quantity*harga_barang) as total_penjualan FROM `penjualan_barangs` WHERE MONTH(tgl_pembelian) = 8 AND YEAR(tgl_pembelian) = 2024 GROUP BY nama_barang,harga_barang,tgl_pembelian;
            $total_harga_item = 0;
            $total_harga_penjualan = 0;
            foreach ($data as $key => $value) {
                // $total_harga_penjualan = $value['harga_barang'] * $value['quantity'];
                $total_harga_item += $value['harga_barang'];
                $total_harga_penjualan += $value['harga_barang'] * $value['quantity'];
            }

            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('total_penjualan', function ($object) {
                    return $object->harga_barang * $object->quantity;
                })
                ->addColumn('total_harga_item', function ($object) use ($total_harga_item) {
                    return $total_harga_item;
                })
                ->addColumn('total_harga_penjualan', function ($object) use ($total_harga_penjualan) {
                    return $total_harga_penjualan;
                })
                ->make(true);
        }
        return view('pages.kasir.rekap-penjualan', compact('user'));
    }
}
