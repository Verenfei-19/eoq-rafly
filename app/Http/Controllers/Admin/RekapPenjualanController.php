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

            // $data = PenjualanBarang::select([
            //     'nama_barang',
            //     'harga_barang',
            //     'tgl_pembelian',
            // ])
            //     ->selectRaw('SUM(quantity) as item_terjual,SUM(quantity*harga_barang) as total_penjualan
            //     WHERE MONTH(tgl_pembelian) = "' . date("m") . '" AND YEAR(tgl_pembelian) = "' . date("Y") . '"')
            //     ->groupBy(['nama_barang', 'harga_barang', 'tgl_pembelian']);

            $data =   PenjualanBarang::select(
                'nama_barang',
                DB::raw('SUM(quantity) as item_terjual'),
                'harga_barang',
                DB::raw('SUM(quantity * harga_barang) as total_penjualan')
            )
                ->whereMonth('tgl_pembelian', date('m'))  // Menyaring berdasarkan bulan
                ->whereYear('tgl_pembelian', date('Y'))  // Menyaring berdasarkan tahun
                ->groupBy('nama_barang', 'harga_barang')  // Mengelompokkan data
            ;
            // SELECT nama_barang, SUM(quantity) as item_terjual, harga_barang, tgl_pembelian, SUM(quantity*harga_barang) as total_penjualan FROM `penjualan_barangs` WHERE MONTH(tgl_pembelian) = 8 AND YEAR(tgl_pembelian) = 2024 GROUP BY nama_barang,harga_barang,tgl_pembelian;
            // $data = DB::select($query);
            $total_harga_item = 0;
            $total_harga_penjualan = 0;
            foreach ($data->get() as $key => $value) {
                $total_harga_item += $value['harga_barang'];
                $total_harga_penjualan += $value['total_penjualan'];
            }

            return DataTables::of($data)
                ->addIndexColumn()
                // ->addColumn('action', function ($object) {
                //     $html = '<a data-bs-toggle="modal" data-bs-target="#lihatdetail" class="btn btn-primary waves-effect waves-light btn-detail"><i class="bx bx-detail align-middle font-size-18"></i> Detail Invoice</a>';
                //     return $html;
                // })
                ->addColumn('total_harga_item', function ($object) use ($total_harga_item) {
                    return $total_harga_item;
                })
                ->addColumn('total_harga_penjualan', function ($object) use ($total_harga_penjualan) {
                    return $total_harga_penjualan;
                })
                // ->addColumn('links', function ($data) {
                //     return 'invoice-diterima/' .  $data->invoice_number;
                // })
                // ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.kasir.rekap-penjualan', compact('user'));
    }
}
