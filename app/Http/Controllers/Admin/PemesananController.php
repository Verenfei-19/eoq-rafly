<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Barang;
use Illuminate\Http\Request;
use App\Models\Admin\Pemesanan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\DataTables;
use App\Models\Admin\DetailPemesanan;
use App\Models\PemesananBarang;
use App\Models\PenjualanBarang;
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
            // $pemesanans = DB::table('pemesanans')
            //     ->where('status_pemesanan', 'Menunggu Persetujuan')
            //     ->orWhere('status_pemesanan', 'Disetujui')
            //     ->orderBy('tanggal_pemesanan', 'desc')
            //     ->get();
            $pemesanans = PemesananBarang::select(['invoice', 'status_pemesanan', 'biaya_pemesanan', 'created_at'])
                ->where('status_pemesanan', 'Menunggu Persetujuan')
                ->orWhere('status_pemesanan', 'Disetujui')
                ->groupBy(['invoice', 'status_pemesanan', 'biaya_pemesanan', 'created_at'])->get();

            return DataTables::of($pemesanans)
                ->addColumn('action', function ($object) use ($path, $user) {
                    if ($user->role == 'owner' && $object->status_pemesanan == 'Menunggu Persetujuan') {
                        $html = ' <a href="' . route($path . '.detail', ["slug" => $object->invoice]) . '" class="btn btn-success waves-effect waves-light">'
                            . ' <i class="bx bx-transfer-alt align-middle me-2 font-size-18"></i>Persetujuan</a>';
                        return $html;
                    } elseif ($user->role == 'gudang' && $object->status_pemesanan == 'Disetujui') {
                        $html = ' <a href="' . route($path . '.detail', ["slug" => $object->invoice]) . '" class="btn btn-info waves-effect waves-light btn-detail">
                        <i class="bx bx-detail font-size-18 align-middle me-2"></i> Detail</a>';
                        // $html .= ' <a href="' . route($path . '.dipesan', ["slug" => $object->invoice]) . '" class="btn btn-success waves-effect waves-light btn-detail">
                        // <i class="bx bxs-send font-size-18 align-middle me-2"></i> Dipesan</a>';
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

    public function hitung()
    {
        $bulan_tahun = DB::table('penjualans')
            ->selectRaw('DATE_FORMAT(MAX(tanggal_penjualan),"%m-%Y") as bulan')
            ->whereRaw('DATE_FORMAT(tanggal_penjualan, "%m-%Y") < DATE_FORMAT(now(), "%m-%Y")')
            ->first();
        $barang_id = "B00002";
        $data = DB::table('detail_penjualans as dp')
            ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
            ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
            ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
            ->selectRaw('max(dp.quantity) as max, round(avg(dp.quantity)) as avg, sum(dp.quantity) as total')
            ->whereRaw("b.barang_id = '" . $barang_id . "' AND DATE_FORMAT(p.tanggal_penjualan, '%m-%Y') = '" . $bulan_tahun->bulan . "'")->first();
        $barang = DB::table('barangs')->where('barang_id', $barang_id)->first();
        $s = 5000;
        $h = $barang->biaya_penyimpanan;
        $eoq = round(sqrt((2 * $data->total * $s) / $h));


        dd($eoq);
    }

    public function create(Request $request)
    {
        $user = $this->userAuth();
        if ($request->ajax()) {
            $query = "SELECT a.barang_id, a.slug,a.nama_barang, a.harga_barang, a.biaya_penyimpanan, a.rop,((SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_gudangs WHERE barang_id = a.barang_id GROUP BY barang_id) + (SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_counters WHERE barang_id = a.barang_id GROUP BY barang_id)) as qty_total
            FROM barangs as a
            JOIN barang_gudangs as b on a.barang_id = b.barang_id
            JOIN barang_counters as c on a.barang_id = c.barang_id
            GROUP BY a.barang_id, a.nama_barang, a.harga_barang, a.biaya_penyimpanan, a.rop ORDER BY ((SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_gudangs WHERE barang_id = a.barang_id GROUP BY barang_id) + (SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_counters WHERE barang_id = a.barang_id GROUP BY barang_id)) <= a.rop desc, a.barang_id asc";
            $barangs = DB::select($query);
            return DataTables::of($barangs)
                ->addColumn('action', function ($object) {
                    $html = '<button class="btn btn-success waves-effect waves-light btn-add"' .
                        '><i class="bx bx-plus-circle align-middle font-size-18"></i></button>';
                    return $html;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('pages.pemesanan.create', compact('user'));
    }

    // public function hitungEOQ(Request $request)
    // {
    //     //
    //     $bulan_tahun = DB::table('penjualans')
    //         ->selectRaw('DATE_FORMAT(MAX(tanggal_penjualan),"%m-%Y") as bulan')
    //         ->whereRaw('DATE_FORMAT(tanggal_penjualan, "%m-%Y") < DATE_FORMAT(now(), "%m-%Y")')
    //         ->first();
    //     $hasil_hitung = [];
    //     $pemesanans = json_decode($request->pemesanan);
    //     $s = $request->biaya;
    //     $no = 1;

    //     foreach ($pemesanans as $pemesanan) {
    //         $data = DB::table('detail_penjualans as dp')
    //             ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
    //             ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
    //             ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
    //             ->selectRaw('max(dp.quantity) as max, round(avg(dp.quantity)) as avg, sum(dp.quantity) as total')
    //             ->whereRaw("b.barang_id = '" . $pemesanan->id_barang . "' AND DATE_FORMAT(p.tanggal_penjualan, '%m-%Y') = '" . $bulan_tahun->bulan . "'")->first();
    //         $barang = DB::table('barangs')->where('barang_id', $pemesanan->id_barang)->first();

    //         $h = $barang->biaya_penyimpanan;
    //         $eoq = $data->total > 0 ? round(sqrt((2 * $data->total * $s) / $h)) : 0;
    //         $hasil_eoq = [
    //             'no' => $no++,
    //             'id_barang' => $pemesanan->id_barang,
    //             'nama_barang' => $pemesanan->nama_barang,
    //             'eoq' => $eoq,
    //             'jumlah' => 0
    //         ];

    //         array_push($hasil_hitung, $hasil_eoq);
    //     }
    //     return response()->json(['pemesanan' => $hasil_hitung], 200);
    // }

    public function hitungEOQ(Request $request)
    {
        $pemesanans = json_decode($request->pemesanan);
        $no = 1;
        $biayaPemesanan = $request->biaya;

        $startOfMonth = Carbon::now()->startOfMonth()->translatedFormat('Y-m-d');
        $endOfMonth = Carbon::now()->today()->translatedFormat('Y-m-d');

        $data_eoq = [];
        foreach ($pemesanans as $key) {
            $barangAll = Barang::where('barang_id', $key->id_barang)->get(['nama_barang', 'biaya_penyimpanan'])->first();
            $totalBarangTerjualSebulan = PenjualanBarang::where('id_barang', $key->id_barang)->whereBetween('tgl_pembelian', [$startOfMonth, $endOfMonth])->sum('quantity');
            $rumusEOQ = round(sqrt((2 * $biayaPemesanan * $totalBarangTerjualSebulan) /  $barangAll->biaya_penyimpanan));
            $hasil_eoq = [
                'no' => $no++,
                'id_barang' => $key->id_barang,
                'nama_barang' => $barangAll->nama_barang,
                'eoq' => $rumusEOQ,
                'jumlah' => 0,
            ];
            array_push($data_eoq, $hasil_eoq);
        }
        return response()->json([
            'pemesanan' => $data_eoq,
            'cart' => $pemesanans
        ], 200);
    }

    public function store(Request $request)
    {
        $details = json_decode($request->pemesanan);
        $biaya_pemesanan = $request->biaya;

        DB::beginTransaction();
        $invoice_id = 'PMP-' . date('YmdHis');
        try {
            // $pemesanan_id = Pemesanan::generatePemesananId();
            // $pemesanan = new Pemesanan;
            // $pemesanan->pemesanan_id = $pemesanan_id;
            // $pemesanan->slug = Str::random(16);
            // $pemesanan->status_pemesanan = 'Menunggu Persetujuan';
            // $pemesanan->tanggal_pemesanan = Carbon::now();
            // $pemesanan->biaya_pemesanan = $biaya_pemesanan;
            // $pemesanan->save();
            foreach ($details as $detail) {
                PemesananBarang::create([
                    'invoice' => $invoice_id,
                    'id_barang' => $detail->id_barang,
                    'status_pemesanan' => 'Menunggu Persetujuan',
                    'biaya_pemesanan' => $biaya_pemesanan,
                    'eoq' => $detail->eoq,
                    'rop' => 0,
                    'jumlah_pemesanan' => $detail->jumlah
                ]);
                // $detail_pemesanan = new DetailPemesanan;
                // $detail_pemesanan->pemesanan_id = $pemesanan_id;
                // $detail_pemesanan->barang_id = $detail->id_barang;
                // $detail_pemesanan->eoq = $detail->eoq;
                // $detail_pemesanan->jumlah_pemesanan = $detail->jumlah;
                // $detail_pemesanan->save();
            }
            DB::commit();
            return response()->json(200);
        } catch (\Exception $ex) {
            DB::rollBack();
            return response()->json($ex->getMessage(), 400);
        }
    }

    public function jumlahHari($bulan_tahun)
    {
        # code...
        $jumlah = date('t', strtotime(substr($bulan_tahun, 3, 4) . "-" . substr($bulan_tahun, 0, 2) . "-01"));
        return $jumlah;
    }

    public function detail($slug)
    {
        $user = $this->userAuth();
        $detail_persetujuans = [];
        // $pemesanan = PemesananBarang::where('invoice', $slug)->get();
        $pemesanan = DB::table('pemesanan_barangs as pb')->where('invoice', $slug)
            ->join('barang_gudangs as bg', 'bg.barang_id', '=', 'pb.id_barang')
            ->join('barangs as b as b', 'b.barang_id', '=', 'pb.id_barang')
            ->selectRaw('pb.id,pb.invoice,b.nama_barang,pb.status_pemesanan, bg.stok_masuk,pb.eoq,pb.rop,pb.jumlah_pemesanan,pb.created_at')->get();
        // dd($tes);
        $no = 1;
        // $pemesanan = DB::table('pemesanans')
        //     ->where('slug', $slug)
        //     ->first();

        // $details = DB::table('pemesanans as p')
        //     ->join('detail_pemesanans as dp', 'p.pemesanan_id', '=', 'dp.pemesanan_id')
        //     ->join('barangs as b', 'dp.barang_id', '=', 'b.barang_id')
        //     ->selectRaw('b.barang_id,b.nama_barang, dp.jumlah_pemesanan, p.slug, dp.eoq, ((SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_gudangs WHERE barang_id = b.barang_id GROUP BY barang_id) + (SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_counters WHERE barang_id = b.barang_id GROUP BY barang_id)) as qty_total')
        //     ->where('p.slug', $slug)
        //     ->get();

        // $bulan_tahun = DB::table('penjualans')
        //     ->selectRaw('DATE_FORMAT(MAX(tanggal_penjualan),"%m-%Y") as bulan')
        //     ->whereRaw('DATE_FORMAT(tanggal_penjualan, "%m-%Y") < DATE_FORMAT(now(), "%m-%Y")')
        //     ->first();

        // $subdate = Carbon::createFromFormat('d-m-Y', '01' . "-" . $bulan_tahun->bulan)->format('Y-m-d H:i:s');
        // $lastdate = Carbon::createFromFormat('d-m-Y H:i:s', '01' . "-" . $bulan_tahun->bulan . " 00:00:00")->addDay($this->jumlahHari($bulan_tahun->bulan))->format('Y-m-d H:i:s');
        // $avg_date = DB::table('pemesanans as p')
        //     ->join('persediaan_masuks as pm', 'p.pemesanan_id', '=', 'pm.pemesanan_id')
        //     ->selectRaw('round(avg(DATEDIFF( pm.tanggal_persediaan_masuk, p.tanggal_pemesanan))) as lead_time')
        //     ->where('p.status_pemesanan', 'Selesai')
        //     ->whereBetween('pm.tanggal_persediaan_masuk', [$subdate, $lastdate])
        //     ->first();
        // foreach ($details as $detail) {
        //     $data = DB::table('detail_penjualans as dp')
        //         ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
        //         ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
        //         ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
        //         ->selectRaw('max(dp.quantity) as max, round(avg(dp.quantity)) as avg, sum(dp.quantity) as total')
        //         ->whereRaw("b.barang_id = '" . $detail->barang_id . "' AND DATE_FORMAT(p.tanggal_penjualan, '%m-%Y') = '" . $bulan_tahun->bulan . "'")->first();
        //     $lead_time = !empty($avg_date->lead_time) ? $avg_date->lead_time : 2;
        //     $ss = ($data->max - $data->avg) * $lead_time;
        //     $jumlah_hari = $this->jumlahHari($bulan_tahun->bulan);
        //     $d = (int)round($data->total / $jumlah_hari);
        //     $rop = ($d * $lead_time) + $ss;

        //     $temp = (object)[
        //         'no' => $no++,
        //         'barang_id' => $detail->barang_id,
        //         'nama_barang' => $detail->nama_barang,
        //         'jumlah_pemesanan' => $detail->jumlah_pemesanan,
        //         'stok' => $detail->qty_total,
        //         'eoq' => $detail->eoq,
        //         'rop' => $rop,
        //         'max' => $data->max,
        //         'avg' => $data->avg,
        //         'sum' => $data->total,
        //         'd' => $d,
        //         'lead_time' => $lead_time,
        //         'ss' => $ss
        //     ];

        //     array_push($detail_persetujuans, $temp);
        // }
        // foreach ($data as $key => $value) {
        //     dump($value);
        // }

        // dd($detail_persetujuans);
        return view('pages.pemesanan.detail', compact('user', 'pemesanan'));
    }

    public function persetujuan(Request $request)
    {
        $pemesanan_id = $request->pemesanan_id;
        $persetujuan = $request->persetujuan;
        // dd($request->all());
        PemesananBarang::where('invoice', $pemesanan_id)->update([
            'status_pemesanan' => $persetujuan
        ]);
        return redirect()->route('pemesanan');
        DB::beginTransaction();
        // try {
        //     $pemesanan = DB::table('pemesanans')
        //         ->where('pemesanan_id', $pemesanan_id)
        //         ->first();

        //     $details = DB::table('pemesanans as p')
        //         ->join('detail_pemesanans as dp', 'p.pemesanan_id', '=', 'dp.pemesanan_id')
        //         ->join('barangs as b', 'dp.barang_id', '=', 'b.barang_id')
        //         ->selectRaw('b.barang_id,b.nama_barang, dp.jumlah_pemesanan, p.slug, dp.eoq, ((SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_gudangs WHERE barang_id = b.barang_id GROUP BY barang_id) + (SELECT SUM(stok_masuk)-SUM(stok_keluar) FROM barang_counters WHERE barang_id = b.barang_id GROUP BY barang_id)) as qty_total')
        //         ->where('p.pemesanan_id', $pemesanan_id)
        //         ->get();

        //     $bulan_tahun = DB::table('penjualans')
        //         ->selectRaw('DATE_FORMAT(MAX(tanggal_penjualan),"%m-%Y") as bulan')
        //         ->whereRaw('DATE_FORMAT(tanggal_penjualan, "%m-%Y") < DATE_FORMAT(now(), "%m-%Y")')
        //         ->first();

        //     $subdate = Carbon::createFromFormat('d-m-Y', '01' . "-" . $bulan_tahun->bulan)->format('Y-m-d H:i:s');
        //     $lastdate = Carbon::createFromFormat('d-m-Y H:i:s', '01' . "-" . $bulan_tahun->bulan . " 00:00:00")->addDay($this->jumlahHari($bulan_tahun->bulan))->format('Y-m-d H:i:s');
        //     $avg_date = DB::table('pemesanans as p')
        //         ->join('persediaan_masuks as pm', 'p.pemesanan_id', '=', 'pm.pemesanan_id')
        //         ->selectRaw('round(avg(DATEDIFF( pm.tanggal_persediaan_masuk, p.tanggal_pemesanan))) as lead_time')
        //         ->where('p.status_pemesanan', 'Selesai')
        //         ->whereBetween('pm.tanggal_persediaan_masuk', [$subdate, $lastdate])
        //         ->first();
        //     if ($persetujuan == 'Disetujui') {
        //         foreach ($details as $detail) {
        //             $data = DB::table('detail_penjualans as dp')
        //                 ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
        //                 ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
        //                 ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
        //                 ->selectRaw('max(dp.quantity) as max, round(avg(dp.quantity)) as avg, sum(dp.quantity) as total')
        //                 ->whereRaw("b.barang_id = '" . $detail->barang_id . "' AND DATE_FORMAT(p.tanggal_penjualan, '%m-%Y') = '" . $bulan_tahun->bulan . "'")->first();
        //             $lead_time = !empty($avg_date->lead_time) ? $avg_date->lead_time : 2;
        //             $ss = ($data->max - $data->avg) * $lead_time;
        //             $jumlah_hari = $this->jumlahHari($bulan_tahun->bulan);
        //             $d = (int)round($data->total / $jumlah_hari);
        //             $rop = ($d * $lead_time) + $ss;
        //             $barang = Barang::where('barang_id',  $detail->barang_id)->first();
        //             $barang->rop = $rop;
        //             $barang->ss = $ss;
        //             $barang->save();
        //         }
        //     }
        //     $pemesanan = Pemesanan::where('pemesanan_id', $pemesanan_id)->first();
        //     $pemesanan->status_pemesanan = $persetujuan;
        //     $pemesanan->save();
        //     DB::commit();
        return response()->json([], 200);
        // } catch (\Exception $ex) {
        //     DB::rollBack();
        //     return response()->json([], $ex->getMessage());
        // }
    }

    public function dipesan($slug)
    {
        DB::beginTransaction();
        try {
            $pemesanan = Pemesanan::where('slug', $slug)->first();
            $pemesanan->status_pemesanan = 'Dipesan';
            $pemesanan->save();
            DB::commit();
        } catch (\Exception $ex) {
            //throw $th;
            echo $ex->getMessage();
            DB::rollBack();
        }

        return redirect()->route('pemesanan')->with("msg", "Berhasil merubah status pemesanan");
    }

    public function indexHistory(Request $request)
    {
        $user = $this->userAuth();
        $path = "pemesanan";
        if ($request->ajax()) {
            $pemesanans = DB::table('pemesanans')
                ->where('status_pemesanan', 'Selesai')
                ->orderBy('tanggal_pemesanan', 'desc')
                ->get();
            return DataTables::of($pemesanans)
                ->addColumn('action', function ($object) use ($path) {
                    $html = ' <button class="btn btn-info waves-effect waves-light btn-detail" data-bs-toggle="modal" data-bs-target="#detailModal">'
                        . '  <i class="bx bx-detail font-size-18 align-middle me-2"></i>Detail</button>';
                    $html .= ' <a href="' . route($path . '.exportPDF', ["slug" => $object->slug]) . '" class="btn btn-primary waves-effect waves-light">'
                        . ' <i class="bx bxs-printer align-middle me-2 font-size-18"></i>Cetak PDF</a>';
                    return $html;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('pages.history.pemesanan', compact('user'));
    }

    public function detailHistory(Request $request)
    {
        $user = $this->userAuth();
        $detail_pemesanans = [];
        $no = 1;
        $pemesanan = DB::table('pemesanans')
            ->where('slug', $request->slug)
            ->first();

        $details = DB::table('pemesanans as p')
            ->join('detail_pemesanans as dp', 'p.pemesanan_id', '=', 'dp.pemesanan_id')
            ->join('barangs as b', 'dp.barang_id', '=', 'b.barang_id')
            ->selectRaw('b.barang_id,b.nama_barang, dp.jumlah_pemesanan, p.slug, dp.eoq')
            ->where('p.slug', $request->slug)
            ->get();

        $bulan_tahun = DB::table('penjualans')
            ->selectRaw('DATE_FORMAT(MAX(tanggal_penjualan),"%m-%Y") as bulan')
            ->whereRaw('DATE_FORMAT(tanggal_penjualan, "%m-%Y") < DATE_FORMAT(now(), "%m-%Y")')
            ->first();

        $subdate = Carbon::createFromFormat('d-m-Y', '01' . "-" . $bulan_tahun->bulan)->format('Y-m-d H:i:s');
        $lastdate = Carbon::createFromFormat('d-m-Y H:i:s', '01' . "-" . $bulan_tahun->bulan . " 00:00:00")->addDay($this->jumlahHari($bulan_tahun->bulan))->format('Y-m-d H:i:s');
        $avg_date = DB::table('pemesanans as p')
            ->join('persediaan_masuks as pm', 'p.pemesanan_id', '=', 'pm.pemesanan_id')
            ->selectRaw('round(avg(DATEDIFF( pm.tanggal_persediaan_masuk, p.tanggal_pemesanan))) as lead_time')
            ->where('p.status_pemesanan', 'Selesai')
            ->whereBetween('pm.tanggal_persediaan_masuk', [$subdate, $lastdate])
            ->first();
        foreach ($details as $detail) {
            $data = DB::table('detail_penjualans as dp')
                ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
                ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
                ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
                ->selectRaw('max(dp.quantity) as max, round(avg(dp.quantity)) as avg, sum(dp.quantity) as total')
                ->whereRaw("b.barang_id = '" . $detail->barang_id . "' AND DATE_FORMAT(p.tanggal_penjualan, '%m-%Y') = '" . $bulan_tahun->bulan . "'")->first();
            $lead_time = !empty($avg_date->lead_time) ? $avg_date->lead_time : 2;
            $ss = ($data->max - $data->avg) * $lead_time;
            $jumlah_hari = $this->jumlahHari($bulan_tahun->bulan);
            $d = (int)round($data->total / $jumlah_hari);
            $rop = ($d * $lead_time) + $ss;

            $temp = (object)[
                'no' => $no++,
                'barang_id' => $detail->barang_id,
                'nama_barang' => $detail->nama_barang,
                'jumlah_pemesanan' => $detail->jumlah_pemesanan,
                'eoq' => $detail->eoq,
                'rop' => $rop,
                'max' => $data->max,
                'avg' => $data->avg,
                'sum' => $data->total,
                'd' => $d,
                'lead_time' => $lead_time,
                'ss' => $ss
            ];

            array_push($detail_pemesanans, $temp);
        }
        return DataTables::of($detail_pemesanans)->make(true);
    }

    public function exportPDF($slug)
    {
        $month = [
            "01" => "Januari",
            "02" => "Februari",
            "03" => "Maret",
            "04" => "April",
            "05" => "Mei",
            "06" => "Juni",
            "07" => "Juli",
            "08" => "Agustus",
            "09" => "September",
            "10" => "Oktober",
            "11" => "November",
            "12" => "Desember",
        ];

        $tanggal = Carbon::now()->format('d') . ' ' . $month[Carbon::now()->format('m')] . ' ' . Carbon::now()->format('Y');

        $detail_pemesanans = [];
        $no = 1;
        $pemesanan = DB::table('pemesanans')
            ->where('slug', $slug)
            ->first();

        $details = DB::table('pemesanans as p')
            ->join('detail_pemesanans as dp', 'p.pemesanan_id', '=', 'dp.pemesanan_id')
            ->join('barangs as b', 'dp.barang_id', '=', 'b.barang_id')
            ->selectRaw('b.barang_id,b.nama_barang, dp.jumlah_pemesanan, p.slug, dp.eoq')
            ->where('p.slug', $slug)
            ->get();

        $bulan_tahun = DB::table('penjualans')
            ->selectRaw('DATE_FORMAT(MAX(tanggal_penjualan),"%m-%Y") as bulan')
            ->whereRaw('DATE_FORMAT(tanggal_penjualan, "%m-%Y") < DATE_FORMAT(now(), "%m-%Y")')
            ->first();

        $subdate = Carbon::createFromFormat('d-m-Y', '01' . "-" . $bulan_tahun->bulan)->format('Y-m-d H:i:s');
        $lastdate = Carbon::createFromFormat('d-m-Y H:i:s', '01' . "-" . $bulan_tahun->bulan . " 00:00:00")->addDay($this->jumlahHari($bulan_tahun->bulan))->format('Y-m-d H:i:s');
        $avg_date = DB::table('pemesanans as p')
            ->join('persediaan_masuks as pm', 'p.pemesanan_id', '=', 'pm.pemesanan_id')
            ->selectRaw('round(avg(DATEDIFF( pm.tanggal_persediaan_masuk, p.tanggal_pemesanan))) as lead_time')
            ->where('p.status_pemesanan', 'Selesai')
            ->whereBetween('pm.tanggal_persediaan_masuk', [$subdate, $lastdate])
            ->first();
        foreach ($details as $detail) {
            $data = DB::table('detail_penjualans as dp')
                ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
                ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
                ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
                ->selectRaw('max(dp.quantity) as max, round(avg(dp.quantity)) as avg, sum(dp.quantity) as total')
                ->whereRaw("b.barang_id = '" . $detail->barang_id . "' AND DATE_FORMAT(p.tanggal_penjualan, '%m-%Y') = '" . $bulan_tahun->bulan . "'")->first();
            $lead_time = !empty($avg_date->lead_time) ? $avg_date->lead_time : 2;
            $ss = ($data->max - $data->avg) * $lead_time;
            $jumlah_hari = $this->jumlahHari($bulan_tahun->bulan);
            $d = (int)round($data->total / $jumlah_hari);
            $rop = ($d * $lead_time) + $ss;

            $temp = (object)[
                'no' => $no++,
                'barang_id' => $detail->barang_id,
                'nama_barang' => $detail->nama_barang,
                'jumlah_pemesanan' => $detail->jumlah_pemesanan,
                'eoq' => $detail->eoq,
                'rop' => $rop,
                'max' => $data->max,
                'avg' => $data->avg,
                'sum' => $data->total,
                'd' => $d,
                'lead_time' => $lead_time,
                'ss' => $ss
            ];

            array_push($detail_pemesanans, $temp);
        }
        (object) $datas = (object)$detail_pemesanans;
        $day = substr($pemesanan->tanggal_pemesanan, 8, 2);
        $months = substr($pemesanan->tanggal_pemesanan, 5, 2);
        $year = substr($pemesanan->tanggal_pemesanan, 0, 4);
        $title = 'Pemesanan Persediaan Tanggal ' . $day . ' ' . $month[$months] . ' ' . $year;
        $pdf = Pdf::loadView('pages.export.pemesanan', compact('datas', 'title', 'tanggal', 'pemesanan'));
        return $pdf->download($title . ".pdf");
    }
}
