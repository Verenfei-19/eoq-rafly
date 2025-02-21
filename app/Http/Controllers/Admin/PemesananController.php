<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Barang;
use App\Models\Admin\BarangGudang;
use Illuminate\Http\Request;
use App\Models\Admin\Pemesanan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\DataTables;
use App\Models\Admin\DetailPemesanan;
use App\Models\PemesananBarang;
use App\Models\PenjualanBarang;
use App\Models\PenjualanBarangDetail;
use App\Models\Supplier;
use Illuminate\Support\Str;
use Barryvdh\DomPDF\Facade\Pdf;

class PemesananController extends Controller
{

    public function userAuth()
    {
        $user = Auth::guard('user')->user();
        return $user;
    }

    public function index(Request $request)
    {
        $user = $this->userAuth();
        $path = 'pemesanan';
        if ($request->ajax()) {
            $query = "SELECT pb.invoice, pb.status_pemesanan, pb.created_at, pb.biaya_pemesanan
                        FROM `pemesanan_barangs` AS pb
                        JOIN 
                            suppliers AS sp 
                        ON 
                            sp.id = pb.id_supplier
                        WHERE pb.status_pemesanan IN ('Menunggu Persetujuan', 'Disetujui', 'Ditolak')
                        GROUP BY 
                            pb.invoice,
                            pb.status_pemesanan,
                            pb.created_at, 
                            pb.biaya_pemesanan
                            ";
            $pemesanans = DB::select($query);

            return DataTables::of($pemesanans)
                ->addColumn('action', function ($object) use ($path, $user) {
                    if ($user->role == 'owner' && $object->status_pemesanan == 'Menunggu Persetujuan') {
                        $html = ' <a href="' . route($path . '.detail', ["slug" => $object->invoice]) . '" class="btn btn-success waves-effect waves-light">'
                            . ' <i class="bx bx-transfer-alt align-middle me-2 font-size-18"></i>Persetujuan</a>';
                        return $html;
                    } elseif ($user->role == 'gudang' && $object->status_pemesanan == 'Disetujui') {
                        $html = ' <a href="' . route($path . '.detail', ["slug" => $object->invoice]) . '" class="btn btn-info waves-effect waves-light btn-detail">
                        <i class="bx bx-detail font-size-18 align-middle me-2"></i> Detail</a>';
                        return $html;
                    } else {
                        $html = ' <a href="' . route($path . '.detail', ["slug" => $object->invoice]) . '" class="btn btn-info waves-effect waves-light btn-detail">
                        <i class="bx bx-detail font-size-18 align-middle me-2"></i> Detail</a>';
                        return $html;
                    }
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.pemesanan.index', compact('user'));
    }

    public function create(Request $request)
    {
        $user = $this->userAuth();
        $startDate = Carbon::now()->subDays(30)->translatedFormat('Y-m-d'); // menghitung tgl sekarang mundur 30 hari, sesuai value 30
        $currentDate = Carbon::now()->today()->translatedFormat('Y-m-d');
        if ($request->ajax()) {
            $query = "SELECT 
                        a.barang_id AS barang_id, 
                        b.slug, 
                        a.nama_barang, 
                        a.harga_barang, 
                        a.biaya_penyimpanan, 
                        a.rop, 
                        a.ss, 
                        sp.id AS supplier_id, 
                        sp.nama, 
                        sp.waktu, 
                        IFNULL(SUM(pbd.quantity), 0) AS qty_total
                    FROM 
                        barangs AS a
                    JOIN 
                        barang_gudangs AS b ON a.barang_id = b.barang_id
                    JOIN 
                        suppliers AS sp ON a.barang_id = sp.id_barang
                    LEFT JOIN 
                        penjualan_barang_details AS pbd ON a.barang_id = pbd.id_barang 
                        AND pbd.tgl_pembelian BETWEEN '$startDate' AND '$currentDate'
                    GROUP BY 
                        b.barang_gudang_id, 
                        b.slug, 
                        a.nama_barang, 
                        a.harga_barang, 
                        sp.nama, 
                        sp.waktu, 
                        supplier_id
                    ORDER BY 
                        b.barang_gudang_id ASC";

            $barangs = DB::select($query);

            return DataTables::of($barangs)
                ->editColumn('nama', function ($object) {
                    return $object->nama . ', Estimasi barang ' . $object->waktu . ' Hari';
                })
                ->addColumn('action', function ($object) {
                    $html = '<button class="btn btn-success waves-effect waves-light btn-add"' .
                        '><i class="bx bx-plus-circle align-middle font-size-18"></i></button>';
                    return $html;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('pages.pemesanan.create', compact('user', 'startDate', 'currentDate'));
    }

    public function create_from_notif(Request $request)
    {
        $user = $this->userAuth();
        $startDate = Carbon::now()->subDays(30)->translatedFormat('Y-m-d'); // menghitung tgl sekarang mundur 30 hari, sesuai value 30
        $currentDate = Carbon::now()->today()->translatedFormat('Y-m-d');
        if ($request->ajax()) {
            // QUERY UNTUK MENAMPILKAN DATA YANG MUNCUL DI NOTIF
            $query = "SELECT 
                        a.barang_id AS barang_id, 
                        b.slug, 
                        a.nama_barang, 
                        a.harga_barang, 
                        a.biaya_penyimpanan, 
                        a.rop, 
                        a.ss, 
                        b.stok_masuk,
                        sp.id AS supplier_id, 
                        sp.nama, 
                        sp.waktu, 
                        IFNULL(SUM(pbd.quantity), 0) AS qty_total
                    FROM 
                        barangs AS a
                    JOIN 
                        barang_gudangs AS b ON a.barang_id = b.barang_id
                    JOIN 
                        suppliers AS sp ON a.barang_id = sp.id_barang
                    LEFT JOIN 
                        penjualan_barang_details AS pbd ON a.barang_id = pbd.id_barang 
                        AND pbd.tgl_pembelian BETWEEN '$startDate' AND '$currentDate'
                    GROUP BY 
                        b.barang_gudang_id, 
                        b.slug, 
                        a.nama_barang, 
                        a.harga_barang, 
                        sp.nama, 
                        sp.waktu, 
                        supplier_id
                    HAVING 
                        b.stok_masuk <= a.rop 
                    ORDER BY 
                        b.barang_gudang_id ASC";

            $barangs = DB::select($query);

            return DataTables::of($barangs)
                ->editColumn('nama', function ($object) {
                    return $object->nama . ', Estimasi barang ' . $object->waktu . ' Hari';
                })
                ->addColumn('action', function ($object) {
                    $html = '<button class="btn btn-success waves-effect waves-light btn-add"' .
                        '><i class="bx bx-plus-circle align-middle font-size-18"></i></button>';
                    return $html;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('pages.pemesanan.create-from-notif', compact('user', 'startDate', 'currentDate'));
    }

    public function hitungEOQ(Request $request)
    {
        $pemesanans = json_decode($request->pemesanan);
        $no = 1;
        $biayaPemesanan = $request->biaya;

        $startDate = Carbon::now()->subDays(30)->translatedFormat('Y-m-d'); // menghitung tgl sekarang mundur 30 hari, sesuai value 30
        $currentDate = Carbon::now()->today()->translatedFormat('Y-m-d');
        $data_eoq = [];
        foreach ($pemesanans as $key) {
            $barangAll = Barang::where('barang_id', $key->id_barang)->get(['nama_barang', 'biaya_penyimpanan'])->first();
            $supplierAll = Supplier::where('id_barang', $key->id_barang)->get(['id', 'waktu'])->first();
            $totalBarangTerjualSebulan = PenjualanBarangDetail::where('id_barang', $key->id_barang)->whereBetween('tgl_pembelian', [$startDate, $currentDate])->sum('quantity');
            // $totalBarangTerjualSebulan = PenjualanBarangDetail::where('id_barang', $key->id_barang)->whereBetween('tgl_pembelian', ['2024-10-01', '2024-10-31'])->sum('quantity');
            $rumusEOQ = round(sqrt((2 * $biayaPemesanan * $totalBarangTerjualSebulan) /  $barangAll->biaya_penyimpanan));

            $hasil_eoq = [
                'no' => $no++,
                'id_barang' => $key->id_barang,
                'nama_barang' => $barangAll->nama_barang,
                'eoq' => $rumusEOQ,
                'id_supplier' => $supplierAll->id,
                'waktu_proses' => $supplierAll->waktu,
                'jumlah' => 0
            ];
            array_push($data_eoq, $hasil_eoq);
        }
        return response()->json([
            'pemesanan' => $data_eoq,
        ], 200);
    }

    public function store(Request $request)
    {
        $details = json_decode($request->pemesanan);
        $biaya_pemesanan = $request->biaya;

        // $startOfMonth = Carbon::now()->startOfMonth()->translatedFormat('Y-m-d');
        $startDate = Carbon::now()->subDays(30)->translatedFormat('Y-m-d'); // menghitung tgl sekarang mundur 30 hari, sesuai value 30
        $currentDate = Carbon::now()->today()->translatedFormat('Y-m-d');

        DB::beginTransaction();
        $invoice_id = 'PMP-' . date('YmdHis');
        try {
            // QUERY MENCARI TOTAL ITEM PENJUALAN TERTINGGI PERIODE TERTENTU
            foreach ($details as $detail) {
                $totalBarangTerjualSebulan = PenjualanBarangDetail::where('id_barang', $detail->id_barang)->whereBetween('tgl_pembelian', [$startDate, $currentDate])->sum('quantity');
                $totalMaxBarangTerjualSebulan = PenjualanBarangDetail::where('id_barang', $detail->id_barang)->whereBetween('tgl_pembelian', [$startDate, $currentDate])->max('quantity');

                $d = $totalBarangTerjualSebulan / 30;

                $hasil_ss = round(($totalMaxBarangTerjualSebulan - $d) * $detail->waktu_proses);
                $hasil_rop = ($d * $detail->waktu_proses) + $hasil_ss;

                PemesananBarang::create([
                    'invoice' => $invoice_id,
                    'id_barang' => $detail->id_barang,
                    'id_supplier' => $detail->id_supplier,
                    'tgl_datang' => $detail->waktu_proses,
                    'status_pemesanan' => 'Menunggu Persetujuan',
                    'biaya_pemesanan' => $biaya_pemesanan,
                    'eoq' => $detail->eoq,
                    // 'rop' => 0,
                    'ss' => $hasil_ss,
                    'rop' => $hasil_rop,
                    'jumlah_pemesanan' => $detail->jumlah
                ]);
            }
            DB::commit();
            return response()->json(['datas' => $details], 200);
        } catch (\Exception $ex) {
            DB::rollBack();
            return response()->json($ex->getMessage(), 400);
        }
    }

    public function detail($slug)
    {
        $user = $this->userAuth();

        $pemesanan = DB::table('pemesanan_barangs as pb')->where('invoice', $slug)
            ->join('barang_gudangs as bg', 'bg.barang_id', '=', 'pb.id_barang')
            ->join('barangs as b', 'b.barang_id', '=', 'pb.id_barang')
            ->join('suppliers as sp', 'sp.id', '=', 'pb.id_supplier')
            ->selectRaw('pb.id,pb.invoice,sp.nama,b.nama_barang,pb.tgl_datang,pb.status_pemesanan, bg.stok_masuk,pb.eoq,pb.rop,pb.ss,pb.jumlah_pemesanan,pb.created_at')->get();

        $no = 1;

        return view('pages.pemesanan.detail', compact('user', 'pemesanan'));
    }

    public function persetujuan(Request $request)
    {
        // PERSETUJUAN + UPDATE STOK GUDANG DITAMBAH JUMLAH PEMESANAN
        $pemesanan_id = $request->pemesanan_id;
        $persetujuan = $request->persetujuan;
        PemesananBarang::where('invoice', $pemesanan_id)->update([
            'status_pemesanan' => $persetujuan
        ]);
        return redirect()->route('pemesanan');
        DB::beginTransaction();
        return response()->json([], 200);
    }
}
