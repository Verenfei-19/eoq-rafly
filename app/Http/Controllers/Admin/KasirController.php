<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\BarangGudang;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
use App\Models\PenjualanBarang;
use App\Models\PenjualanBarangDetail;
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

            $query = 'SELECT bg.slug, bg.barang_id, bg.stok_masuk AS quantity,b.slug,b.nama_barang,b.harga_barang
                        FROM barang_gudangs as bg
                        INNER JOIN 
                            barangs as b
                        ON 
                            b.barang_id = bg.barang_id';
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

    public function store(Request $request)
    {
        $invoice = 'INV' . strtoupper($request->nama_pembeli) . '' . date('dmYHis');
        $keranjangs = json_decode($request->keranjang);

        DB::beginTransaction();
        PenjualanBarang::create([
            'invoice_number' => ($request->tanggal_pengiriman) ? 'DKR' . $invoice : 'DTR' . $invoice,
            'nama_pembeli' => $request->nama_pembeli,
            'alamat_pembeli' => $request->alamat_pembeli,
            'telepon_pembeli' => $request->telepon_pembeli,
            'status' => ($request->tanggal_pengiriman) ? 'DIKIRIM' : 'DITERIMA',
            'tgl_pembelian' => ($request->tanggal_pembelian) ? $request->tanggal_pembelian : NULL,
            'tgl_pengiriman' => ($request->tanggal_pengiriman) ? $request->tanggal_pengiriman : NULL,
        ]);

        try {
            foreach ($keranjangs as $keranjang) {
                PenjualanBarangDetail::create([
                    'invoice_number' => ($request->tanggal_pengiriman) ? 'DKR' . $invoice : 'DTR' . $invoice,
                    'id_barang' => $keranjang->id_barang,
                    'nama_barang' => $keranjang->nama_barang,
                    'quantity' => $keranjang->jumlah,
                    'harga_barang' => $keranjang->harga_barang,
                    'tgl_pembelian' => ($request->tanggal_pembelian) ? $request->tanggal_pembelian : NULL,
                    'tgl_pengiriman' => ($request->tanggal_pengiriman) ? $request->tanggal_pengiriman : NULL
                ]);
            }
            foreach ($keranjangs as $keranjang) {
                $baranggudanng = BarangGudang::where('barang_id', $keranjang->id_barang)->first();
                $baranggudanng->update([
                    'stok_masuk' => $baranggudanng->stok_masuk - $keranjang->jumlah
                ]);
            }
            DB::commit();
            return response()->json($request->all(), 200);
        } catch (\Exception $ex) {
            echo $ex->getMessage();
            DB::rollBack();
        }
    }
}
