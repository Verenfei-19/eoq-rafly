<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PenjualanBarang;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;

class PenjualanController extends Controller
{

    public function userAuth()
    {
        $user = Auth::guard('user')->user();
        return $user;
    }

    public function index(Request $request)
    {
        $user = $this->userAuth();
        $path = 'penjualan';
        if ($request->ajax() && empty($request->type)) {
            if ($user->role == 'gudang' || $user->role == 'owner') {
                $penjualan = DB::table('penjualans as p')
                    ->join('counters as c', 'p.counter_id', '=', 'c.counter_id')
                    ->join('users as u', 'c.user_id', '=', 'u.user_id')
                    ->select('p.penjualan_id', 'p.slug', 'u.name', 'p.grand_total', 'p.tanggal_penjualan')
                    ->orderByDesc('p.tanggal_penjualan')
                    ->orderByDesc('p.penjualan_id')
                    ->get();
                return DataTables::of($penjualan)->addColumn('action', function ($object) use ($path) {
                    $html = ' <button class="btn btn-info waves-effect waves-light btn-detail" data-bs-toggle="modal" data-bs-target="#detailModal">'
                        . '  <i class="bx bx-detail font-size-18 align-middle me-2"></i>Detail</button>';
                    return $html;
                })
                    ->rawColumns(['action'])
                    ->make(true);
            } elseif ($user->role == 'counter') {
                $counter = DB::table('counters')->where('user_id', $user->user_id)->first();
                $penjualan = DB::table('penjualans as p')
                    ->join('counters as c', 'p.counter_id', '=', 'c.counter_id')
                    ->join('users as u', 'c.user_id', '=', 'u.user_id')
                    ->select('p.penjualan_id', 'p.slug', 'u.name', 'p.grand_total', 'p.tanggal_penjualan')
                    ->where('p.counter_id', $counter->counter_id)
                    ->orderByDesc('p.tanggal_penjualan')
                    ->orderByDesc('p.penjualan_id')
                    ->get();
                return DataTables::of($penjualan)->addColumn('action', function ($object) use ($path) {
                    $html = ' <button class="btn btn-info waves-effect waves-light btn-detail" data-bs-toggle="modal" data-bs-target="#detailModal">'
                        . '  <i class="bx bx-detail font-size-18 align-middle me-2"></i>Detail</button>';
                    return $html;
                })
                    ->rawColumns(['action'])
                    ->make(true);
            }
        } elseif ($request->ajax() && !empty($request->type)) {
            if ($user->role == 'gudang' || $user->role == 'owner') {
                $penjualan = DB::table('detail_penjualans as dp')
                    ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
                    ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
                    ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
                    ->selectRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") as tanggal_penjualan, b.nama_barang, SUM(quantity) as total_penjualan')
                    ->groupByRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m"), b.nama_barang')
                    ->orderByRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") DESC')
                    ->get();
                return DataTables::of($penjualan)->addColumn('action', function ($object) use ($path) {
                    $html = ' <button class="btn btn-info waves-effect waves-light btn-detail" data-bs-toggle="modal" data-bs-target="#detailModal">'
                        . '  <i class="bx bx-detail font-size-18 align-middle me-2"></i>Detail</button>';
                    return $html;
                })
                    ->rawColumns(['action'])
                    ->make(true);
            } elseif ($user->role == 'counter') {
                $counter = DB::table('counters')->where('user_id', $user->user_id)->first();
                $penjualan = DB::table('penjualans as p')
                    ->join('detail_penjualans as dp', 'p.penjualan_id', '=', 'dp.penjualan_id')
                    ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
                    ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
                    ->join('counters as c', 'p.counter_id', '=', 'c.counter_id')
                    ->join('users as u', 'c.user_id', '=', 'u.user_id')
                    ->selectRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") as tanggal_penjualan, b.nama_barang, SUM(quantity) as total_penjualan')
                    ->where('p.counter_id', $counter->counter_id)
                    ->groupByRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m"), b.nama_barang')
                    ->orderByRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") DESC')
                    ->get();
                return DataTables::of($penjualan)->addColumn('action', function ($object) use ($path) {
                    $html = ' <button class="btn btn-info waves-effect waves-light btn-detail" data-bs-toggle="modal" data-bs-target="#detailModal">'
                        . '  <i class="bx bx-detail font-size-18 align-middle me-2"></i>Detail</button>';
                    return $html;
                })
                    ->rawColumns(['action'])
                    ->make(true);
            }
        }
        // dd($penjualan_id);

        return view('pages.history.penjualan', compact('user'));
    }

    public function filter(Request $request)
    {
        $bulan_tahun = $request->bulan_tahun;
        $path = 'penjualan';
        $penjualan = DB::table('detail_penjualans as dp')
            ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
            ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
            ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
            ->selectRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") as tanggal_penjualan, b.nama_barang, SUM(quantity) as total_penjualan')
            ->whereRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") = "' . $bulan_tahun . '"')
            ->groupByRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m"), b.nama_barang')
            ->orderByRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") DESC')
            ->get();
        return DataTables::of($penjualan)->addColumn('action', function ($object) use ($path) {
            $html = ' <button class="btn btn-info waves-effect waves-light btn-detail">'
                . '  <i class="bx bx-detail font-size-18 align-middle me-2"></i>Detail</button>';
            return $html;
        })
            ->rawColumns(['action'])
            ->make(true);
    }

    /**
     * undocumented function summary
     *
     * Undocumented function long description
     *
     * @param Type $var Description
     * @return type
     * @throws conditon
     **/
    public function exportPDF(Request $request)
    {
        # code...
        $bulan_tahun = $request->bulan_tahun;
        $tahun = substr($bulan_tahun, 0, 4);
        $bulan = substr($bulan_tahun, 5);

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

        $title = 'Laporan Penjualan ' . $month[$bulan] . ' ' . $tahun;
        $tanggal = Carbon::now()->format('d') . ' ' . $month[Carbon::now()->format('m')] . ' ' . Carbon::now()->format('Y');
        $penjualans = DB::table('detail_penjualans as dp')
            ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
            ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
            ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
            ->selectRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") as tanggal_penjualan, b.nama_barang, SUM(quantity) as total_penjualan')
            ->whereRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") = "' . $bulan_tahun . '"')
            ->groupByRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m"), b.nama_barang')
            ->orderByRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") DESC')
            ->get();

        $total = DB::table('detail_penjualans as dp')
            ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
            ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
            ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
            ->selectRaw('SUM(quantity) as total')
            ->whereRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") = "' . $bulan_tahun . '"')
            // ->groupByRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m"), b.nama_barang')
            // ->orderByRaw('DATE_FORMAT(p.tanggal_penjualan,"%Y-%m") DESC')
            ->first();

        $pdf = Pdf::loadView('pages.export.penjualan', compact('penjualans', 'title', 'tanggal', 'month', 'total'));
        return $pdf->download($title . ".pdf");
    }

    public function detail(Request $request)
    {
        # code...
        $detail_penjualans = DB::table('detail_penjualans as dp')
            ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
            ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
            ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
            ->selectRaw('b.nama_barang, b.harga_barang, dp.quantity, dp.subtotal')
            ->where('p.slug', $request->slug)
            ->get();

        return DataTables::of($detail_penjualans)->make(true);
    }

    public function penjualan(Request $request)
    {
        $user = $this->userAuth();
        if ($request->ajax()) {
            $query = "SELECT invoice_number, nama_pembeli, status,created_at FROM `penjualan_barangs` GROUP BY invoice_number,nama_pembeli,status,created_at";
            $data = DB::select($query);

            return DataTables::of($data)
                ->addColumn('action', function ($object) {
                    $html = '<a href="penjualan/invoice/' . $object->invoice_number . '" class="btn btn-primary waves-effect waves-light btn-add"><i class="bx bx-detail align-middle font-size-18"></i> Cetak Invoice</a>';
                    return $html;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        // else if ($request->get('invoice')) {
        //     $invoice = $request->get('invoice');
        //     $query = "SELECT * FROM `penjualan_barangs` WHERE invoice_number = '$invoice'";
        //     $data = DB::select($query);

        //     return DataTables::of($data)
        //         ->addColumn('action', function ($row) {
        //             $html = '<a href="#" class="btn btn-primary waves-effect waves-light btn-add"><i class="bx bx-detail align-middle font-size-18"></i> awikwok</a>';
        //             return $html;
        //         })
        //         ->rawColumns(['action'])
        //         ->make(true);
        // }
        return view('pages.kasir.penjualan', compact('user'));
    }
    public function invoice(Request $request, PenjualanBarang $penjualan)
    {
        $data = $penjualan->where('invoice_number', $penjualan->invoice_number)->get();
        // dump($data);
        return view('pages.kasir.invoice', compact('data'));
        // $invoice = $request->get('invoice');
        // $query = "SELECT * FROM `penjualan_barangs` WHERE invoice_number = '$invoice'";
        // dump($query);
    }
}
