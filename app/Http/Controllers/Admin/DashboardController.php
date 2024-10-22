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
        if ($request->ajax()) {
            $barangs = DB::table('barangs as b')
                ->join('barang_gudangs as bg', 'b.barang_id', '=', 'bg.barang_id')
                ->join('barang_counters as bc', 'b.barang_id', '=', 'bc.barang_id')
                ->join('detail_penjualans as dp', 'bc.barang_counter_id', '=', 'dp.barang_counter_id')
                ->selectRaw('b.barang_id, b.slug, b.nama_barang, b.harga_barang, b.biaya_penyimpanan, b.rop,((SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_gudangs WHERE barang_id = b.barang_id GROUP BY barang_id) + (SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_counters WHERE barang_id = b.barang_id GROUP BY barang_id)) as qty_total, round(avg(dp.quantity)) as avg')
                ->groupByRaw("b.barang_id, b.slug, b.nama_barang, b.harga_barang, b.biaya_penyimpanan, b.rop, ((SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_gudangs WHERE barang_id = b.barang_id GROUP BY barang_id) + (SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_counters WHERE barang_id = b.barang_id GROUP BY barang_id))")
                ->orderByRaw("((SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_gudangs WHERE barang_id = b.barang_id GROUP BY barang_id) + (SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_counters WHERE barang_id = b.barang_id GROUP BY barang_id)) <= b.rop desc, b.barang_id asc")
                ->get();

            return DataTables::of($barangs)
                ->addColumn('action', function ($object) {
                    $html = ' <a href="' . route("pemesanan.create") . '" class="btn btn-success waves-effect waves-light">'
                        . ' <i class="bx bx-edit align-middle me-2 font-size-18"></i>Edit</a>';
                    return $html;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        $jumlah_jenis = DB::table('barangs')->count();

        $startOfMonth = Carbon::now()->startOfMonth()->translatedFormat('Y-m-d');
        $endOfMonth = Carbon::now()->endOfMonth()->translatedFormat('Y-m-d');
        $total_transaksi = PenjualanBarangDetail::whereBetween('tgl_pembelian', [$startOfMonth, $endOfMonth])->get()->count();
        // $total_transaksi = DB::table('penjualans')
        //     ->whereMonth('tanggal_penjualan', Carbon::now()->format('m'))
        //     ->whereYear('tanggal_penjualan', Carbon::now()->format('Y'))
        //     ->count();
        $penjualan = DB::table('penjualan_barang_details')
            ->selectRaw('SUM(quantity*harga_barang) as total_pendapatan')
            ->whereBetween('tgl_pembelian', [$startOfMonth, $endOfMonth])->first();
        $total_item_terjual = PenjualanBarangDetail::whereBetween('tgl_pembelian', [$startOfMonth, $endOfMonth])->get()->sum('quantity');
        $total_supplier = Supplier::all()->count();
        // $penjualan = DB::table('penjualans')
        //     ->selectRaw('SUM(grand_total) as total_pendapatan')
        //     ->whereMonth('tanggal_penjualan', Carbon::now()->format('m'))
        //     ->whereYear('tanggal_penjualan', Carbon::now()->format('Y'))
        //     ->first();

        $jumlah_counter = DB::table('counters')->count();
        setlocale(LC_ALL, 'IND');
        $bulan_tahun = strftime('%B %Y');


        return view('pages.dashboard.index', compact('user', 'jumlah_jenis', 'total_transaksi', 'penjualan', 'jumlah_counter', 'bulan_tahun', 'total_item_terjual', 'total_supplier'));
    }

    public function stokPersediaan(Request $request)
    {
        if ($request->ajax()) {
            $query = "SELECT bg.barang_id, b.nama_barang, b.harga_barang, bg.stok_masuk FROM `barangs` as b JOIN barang_gudangs AS bg ON bg.barang_id = b.barang_id";
            $barangs = DB::select($query);

            return DataTables::of($barangs)
                ->editColumn('stok_masuk', function ($object) {
                    if ($object->stok_masuk < 100) {
                        $html = '<a href="#" class="btn btn-danger waves-effect waves-light"> Barang hampir habis (' . $object->stok_masuk . ')</a>';
                    } else {
                        $html = '<a href="#" class="btn btn-success waves-effect waves-light"> Stok aman</a>';
                    }
                    return $html;
                })
                ->rawColumns(['stok_masuk'])
                ->make(true);
        }
    }
}
