<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\BarangCounter;
use App\Models\Admin\BarangGudang;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
use App\Models\Admin\Penjualan;
use App\Models\Admin\DetailPenjualan;
use App\Models\PenjualanBarang;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class KasirController extends Controller
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
            $counters = DB::table('counters')
                ->select('counter_id')
                ->where('user_id', $user->user_id)
                ->first();
            // $query = 'SELECT a.barang_counter_id, b.barang_id, b.nama_barang, b.harga_barang, a.slug, (a.stok_masuk-a.stok_keluar) as quantity
            // FROM barang_counters as a
            // JOIN barangs as b on a.barang_id = b.barang_id
            // WHERE a.counter_id = "' . $counters->counter_id . '" ORDER BY a.barang_counter_id ASC';
            // NEW
            $query = 'SELECT bg.slug, bg.barang_id, bg.stok_masuk AS quantity,b.slug,b.nama_barang,b.harga_barang
            FROM barang_gudangs as bg
            INNER JOIN barangs as b
            ON b.barang_id = bg.barang_id';
            $data = DB::select($query);

            return DataTables::of($data)
                ->addColumn('action', function ($object) {
                    $html = '<button class="btn btn-success waves-effect waves-light btn-add" data-bs-toggle="modal"' .
                        'data-bs-target="#quantityModal"><i class="bx bxs-cart align-middle font-size-18"></i></button>';
                    return $html;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.kasir.index', compact('user'));
    }
    public function tes(Request $request)
    {
        // $query = "SELECT b.barang_gudang_id as barang_id, b.slug,a.nama_barang, a.harga_barang, 
        //         (SELECT (SUM(stok_masuk) - SUM(stok_keluar)) FROM barang_gudangs WHERE barang_id = b.barang_id GROUP BY barang_id) as quantity
        //         FROM barangs as a
        //         JOIN barang_gudangs as b on a.barang_id = b.barang_id
        //         GROUP BY b.barang_gudang_id, b.slug, a.nama_barang, a.harga_barang
        //         ORDER BY b.barang_gudang_id ASC";
        // $data = DB::select($query);

        // return DataTables::of($data)
        //     ->addColumn('action', function ($object) {
        //         $html = '<button class="btn btn-success waves-effect waves-light btn-add" data-bs-toggle="modal"' .
        //             'data-bs-target="#quantityModal"><i class="bx bxs-cart align-middle font-size-18"></i></button>';
        //         return $html;
        //     })
        //     ->rawColumns(['action'])
        //     ->make(true);

        // GET DATA BARANG GUDANG BY LOGIN COUNTER/TOKO
        // $query = "SELECT b.barang_gudang_id as barang_id, b.slug,a.nama_barang, a.harga_barang, 
        //         (SELECT (SUM(stok_masuk) - SUM(stok_keluar)) FROM barang_gudangs WHERE barang_id = b.barang_id GROUP BY barang_id) as quantity
        //         FROM barangs as a
        //         JOIN barang_gudangs as b on a.barang_id = b.barang_id
        //         GROUP BY b.barang_gudang_id, b.slug, a.nama_barang, a.harga_barang
        //         ORDER BY b.barang_gudang_id ASC";
        // $data = DB::select($query);
        // return DataTables::of($data)->make(true);
    }

    public function store(Request $request)
    {
        // return response()->json($request->all(), 200);

        $penjualan_barang = new PenjualanBarang;

        $invoice = 'INV' . strtoupper($request->nama_pembeli) . '' . date('dmYHis');

        $user = $this->userAuth();
        $counters = DB::table('counters')->where('user_id', $user->user_id)->first();
        $counter_id = $counters->counter_id;
        $keranjangs = json_decode($request->keranjang);
        DB::beginTransaction();
        try {
            foreach ($keranjangs as $keranjang) {
                PenjualanBarang::create([
                    'nama_barang' => $keranjang->nama_barang,
                    'invoice_number' => $invoice,
                    'nama_pembeli' => $request->nama_pembeli,
                    'alamat_pembeli' => $request->alamat_pembeli,
                    'telepon_pembeli' => $request->telepon_pembeli,
                    'quantity' => $keranjang->jumlah,
                    'harga_barang' => $keranjang->harga_barang
                ]);
            }
            foreach ($keranjangs as $keranjang) {
                $baranggudanng = BarangGudang::where('barang_id', $keranjang->id_barang)->first();
                $baranggudanng->update([
                    'stok_masuk' => $baranggudanng->stok_masuk - $keranjang->jumlah
                ]);
                // $baranggudanng->where('barang_id', $keranjang->id_barang)->update([
                //     'stok_masuk' => $baranggudanng->+= $keranjang->jumlah
                // ]);
            }
            // $penjualan_id = Penjualan::generatePenjualanCounterId($counter_id);
            // $penjualans = new Penjualan;
            // $penjualans->penjualan_id = $penjualan_id;
            // $penjualans->slug = Str::random(16);
            // $penjualans->counter_id = $counter_id;
            // $penjualans->grand_total = $request->grand_total;
            // $penjualans->tanggal_penjualan = Carbon::now();
            // $penjualans->save();

            // foreach ($keranjangs as $keranjang) {
            //     $detail_penjualans = new DetailPenjualan;
            //     $detail_penjualans->penjualan_id = $penjualan_id;
            //     $detail_penjualans->barang_counter_id = $keranjang->barang_counter_id;
            //     $detail_penjualans->quantity = $keranjang->jumlah;
            //     $detail_penjualans->subtotal = $keranjang->subtotal;
            //     $detail_penjualans->save();

            //     $barang_counters = BarangCounter::where('barang_counter_id', $keranjang->barang_counter_id)->first();
            //     $barang_counters->stok_keluar += $keranjang->jumlah;
            //     $barang_counters->save();
            // }
            DB::commit();
            return response()->json($request->all(), 200);

            // return response()->json([], 200);
        } catch (\Exception $ex) {
            //throw $th;
            echo $ex->getMessage();
            DB::rollBack();
        }
    }
}
