<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PenjualanBarang;
use App\Models\PenjualanBarangDetail;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
use Spatie\LaravelIgnition\Recorders\DumpRecorder\Dump;
use Yajra\DataTables\DataTables;

class DashboardController extends Controller
{
    public function userAuth()
    {
        $user = Auth::guard('user')->user();
        return $user;
    }

    public function index(Request $request)
    {
        $user = $this->userAuth();

        $jumlah_jenis = DB::table('barangs')->count();

        $startOfMonth = Carbon::now()->startOfMonth()->translatedFormat('Y-m-d');
        $endOfMonth = Carbon::now()->endOfMonth()->translatedFormat('Y-m-d');
        $total_transaksi = PenjualanBarangDetail::whereBetween('tgl_pembelian', [$startOfMonth, $endOfMonth])->get()->count();

        $penjualan = DB::table('penjualan_barang_details')
            ->selectRaw('SUM(quantity*harga_barang) as total_pendapatan')
            ->whereBetween('tgl_pembelian', [$startOfMonth, $endOfMonth])->first();
        $total_item_terjual = PenjualanBarangDetail::whereBetween('tgl_pembelian', [$startOfMonth, $endOfMonth])->get()->sum('quantity');
        $total_supplier = Supplier::all()->count();

        $jumlah_counter = DB::table('counters')->count();
        setlocale(LC_ALL, 'IND');
        $bulan_tahun = strftime('%B %Y');


        // DATA CHART
        $query = "SELECT SUM(quantity * harga_barang) AS total_harga, DATE_FORMAT(tgl_pembelian, '%M') AS bulan FROM penjualan_barang_details GROUP BY DATE_FORMAT(tgl_pembelian,'%M');";
        $dataTransaksi = DB::select($query);
        $dataJSON = ['bulan' => [], 'total_penjualan' => []];
        foreach ($dataTransaksi as $key => $value) {
            array_push($dataJSON['bulan'], [$value->bulan]);
            array_push($dataJSON['total_penjualan'], [$value->total_harga]);
        }
        $dataPenjualan = array_column($dataJSON['total_penjualan'], 0);
        $dataBulan = array_column($dataJSON['bulan'], 0);

        return view('pages.dashboard.index', compact('dataBulan', 'dataPenjualan', 'user', 'jumlah_jenis', 'total_transaksi', 'penjualan', 'jumlah_counter', 'bulan_tahun', 'total_item_terjual', 'total_supplier'));
    }

    public function stokPersediaan(Request $request)
    {
        if ($request->ajax()) {
            $query = "SELECT bg.barang_id, b.nama_barang, b.harga_barang, b.ss, bg.stok_masuk FROM `barangs` as b JOIN barang_gudangs AS bg ON bg.barang_id = b.barang_id";
            $barangs = DB::select($query);

            return DataTables::of($barangs)
                ->editColumn('stok_masuk', function ($object) {
                    // if ($object->stok_masuk < 100) {
                    if ($object->stok_masuk < $object->ss) {
                        $html = '<span class="btn btn-danger waves-effect waves-light"> Barang hampir habis (' . $object->stok_masuk . ')</span>';
                    } else {
                        $html = '<span class="btn btn-success waves-effect waves-light"> Stok aman</span>';
                    }
                    return $html;
                })
                ->rawColumns(['stok_masuk'])
                ->make(true);
        }
    }
}
