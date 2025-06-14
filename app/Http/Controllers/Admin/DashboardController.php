<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PemesananBarang;
use App\Models\PenjualanBarangDetail;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
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

        $pemesananbarang = PemesananBarang::select('invoice', 'status_pemesanan')
            ->where('status_pemesanan', 'Menunggu Persetujuan')->groupBy('invoice', 'status_pemesanan')->get();

        $listnamabarang = DB::table('barangs')->join('barang_gudangs as bg', 'bg.barang_id', '=', 'barangs.barang_id')->pluck('barangs.nama_barang');
        $listbarang = DB::table('barangs')->join('barang_gudangs as bg', 'bg.barang_id', '=', 'barangs.barang_id')->get(['barangs.barang_id', 'barangs.nama_barang']);
        $liststokbarang = DB::table('barangs')->join('barang_gudangs as bg', 'bg.barang_id', '=', 'barangs.barang_id')->pluck('bg.stok_masuk');

        // CHART
        if (request()->get('barang_id')) {
            $id = request()->get('barang_id');
            $datachart = "SELECT b.nama_barang,bg.stok_masuk, SUM(pb.eoq) as eoq,SUM(pb.rop) as rop,SUM(pb.ss) as ss
                            FROM `pemesanan_barangs` as pb 
                            JOIN barang_gudangs as bg ON bg.barang_id = pb.id_barang 
                            JOIN barangs as b ON b.barang_id = pb.id_barang 
                            WHERE b.barang_id = '$id' 
                            AND pb.created_at BETWEEN '2024-12-01' AND '2024-12-31' -- setting tanggal
                            GROUP BY b.nama_barang, bg.stok_masuk;";
            $hasilchart = DB::select($datachart);
            return response()->json($hasilchart);
        } else {
            $datachart = "SELECT b.nama_barang,bg.stok_masuk, SUM(pb.eoq) as eoq,SUM(pb.rop) as rop,SUM(pb.ss) as ss
                            FROM `pemesanan_barangs` as pb 
                            JOIN barang_gudangs as bg ON bg.barang_id = pb.id_barang 
                            JOIN barangs as b ON b.barang_id = pb.id_barang 
                            WHERE pb.created_at BETWEEN '2024-12-01' AND '2024-12-31' -- setting tanggal
                            GROUP BY b.nama_barang, bg.stok_masuk;";
            $hasilchart = DB::select($datachart);
            $arrayChart = [
                'nama' => [],
                'stok_masuk' => [],
                'eoq' => [],
                'rop' => [],
                'ss' => [],
            ];
            foreach ($hasilchart as $key => $value) {
                array_push($arrayChart['nama'], $value->nama_barang);
                array_push($arrayChart['stok_masuk'], $value->stok_masuk);
                array_push($arrayChart['eoq'], $value->eoq);
                array_push($arrayChart['rop'], $value->rop);
                array_push($arrayChart['ss'], $value->ss);
            }
            // dump($hasilchart);
            // dump($arrayChart);
        }

        return view('pages.dashboard.index', compact('dataBulan', 'arrayChart', 'hasilchart', 'listnamabarang', 'liststokbarang', 'listbarang', 'pemesananbarang', 'dataPenjualan', 'user', 'jumlah_jenis', 'total_transaksi', 'penjualan', 'jumlah_counter', 'bulan_tahun', 'total_item_terjual', 'total_supplier'));
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
