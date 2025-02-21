<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PenjualanBarang;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;

class PenjualanController extends Controller
{

    public function userAuth()
    {
        $user = Auth::guard('user')->user();
        return $user;
    }

    public function detail(Request $request)
    {
        $detail_penjualans = DB::table('detail_penjualans as dp')
            ->join('penjualans as p', 'dp.penjualan_id', '=', 'p.penjualan_id')
            ->join('barang_counters as bc', 'dp.barang_counter_id', '=', 'bc.barang_counter_id')
            ->join('barangs as b', 'bc.barang_id', '=', 'b.barang_id')
            ->selectRaw('b.nama_barang, b.harga_barang, dp.quantity, dp.subtotal')
            ->where('p.slug', $request->slug)
            ->get();

        return DataTables::of($detail_penjualans)->make(true);
    }

    public function penjualan_diterima(Request $request)
    {
        $user = $this->userAuth();
        if ($request->ajax()) {

            if ($request->filled('start_date') && $request->filled('end_date')) {
                $startdate = $request->start_date;
                $enddate = $request->end_date;

                $query = "SELECT pb.invoice_number,pb.nama_pembeli,pb.alamat_pembeli,pb.telepon_pembeli,pb.tgl_pembelian,pb.status, 
                            SUM(pbd.quantity * pbd.harga_barang) as total_penjualan 
                            FROM `penjualan_barangs` as pb
                            JOIN 
                                penjualan_barang_details as pbd
                            ON 
                                pbd.invoice_number = pb.invoice_number
                            WHERE pb.status = 'DITERIMA' 
                            AND pb.tgl_pembelian BETWEEN '$startdate' AND '$enddate'
                            GROUP BY 
                                pb.invoice_number,
                                pb.nama_pembeli,
                                pb.tgl_pembelian,
                                pb.status,
                                pb.created_at,
                                pb.alamat_pembeli,
                                pb.telepon_pembeli
                            ORDER BY pb.created_at DESC";
                $data = DB::select($query);
            } else {
                $query = "SELECT 
                                pb.invoice_number,pb.nama_pembeli,pb.alamat_pembeli,pb.telepon_pembeli,pb.tgl_pembelian,pb.status, 
                                SUM(pbd.quantity * pbd.harga_barang) as total_penjualan 
                            FROM `penjualan_barangs` as pb
                            JOIN 
                                penjualan_barang_details as pbd
                            ON 
                                pbd.invoice_number = pb.invoice_number
                            WHERE pb.status = 'DITERIMA'
                            GROUP BY 
                                pb.invoice_number,
                                pb.nama_pembeli,
                                pb.tgl_pembelian,
                                pb.status,
                                pb.created_at,
                                pb.alamat_pembeli,
                                pb.telepon_pembeli
                            ORDER BY pb.created_at DESC";
                $data = DB::select($query);
            }
            $count = 0;
            foreach ($data as $key => $value) {
                $count += $value->total_penjualan;
            }

            return DataTables::of($data)
                ->addColumn('action', function ($object) {
                    $html = '<a data-bs-toggle="modal" data-bs-target="#lihatdetail" class="btn btn-primary waves-effect waves-light btn-detail">
                    <i class="bx bx-detail align-middle font-size-18"></i> Detail Invoice</a>';
                    return $html;
                })
                ->addColumn('total_penjualan_diterima', function ($object) use ($count) {
                    return $count;
                })
                ->addColumn('links', function ($data) {
                    return 'invoice-diterima/' .  $data->invoice_number;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.kasir.penjualan-diterima', compact('user'));
    }

    public function get_tabel_penjualan_diterima(Request $request)
    {
        $query = "SELECT pb.invoice_number,pb.nama_pembeli,pbd.nama_barang,pbd.quantity,pbd.harga_barang, (pbd.quantity * pbd.harga_barang) as total 
                    FROM `penjualan_barang_details` as pbd 
                    JOIN 
                        penjualan_barangs as pb 
                    ON 
                        pb.invoice_number = pbd.invoice_number 
                    WHERE pb.invoice_number = '$request->invoice'";
        $detail_penjualans = DB::select($query);

        return DataTables::of($detail_penjualans)
            ->editColumn('harga_barang', function ($data) {
                return 'Rp ' . number_format($data->harga_barang, 0, '.');
            })
            ->editColumn('total', function ($data) {
                return 'Rp ' . number_format($data->total, 0, '.');
            })
            ->addColumn('total', function ($data) {
                return $data->quantity * $data->harga_barang;
            })
            ->make(true);
    }

    public function get_single_row(Request $request)
    {
        $query = "SELECT SUM(pbd.quantity * pbd.harga_barang) as total 
                    FROM `penjualan_barang_details` as pbd 
                    JOIN 
                        penjualan_barangs as pb 
                    ON 
                        pb.invoice_number = pbd.invoice_number 
                    WHERE pb.invoice_number = '$request->invoice'";
        $detail_penjualans = DB::select($query);

        return DataTables::of($detail_penjualans)
            ->editColumn('total', function ($data) {
                return 'Rp ' . number_format($data->total, 0, '.');
            })
            ->addColumn('text', function ($object) {
                $html = '<span><strong>Total</strong></span>';
                return $html;
            })
            ->rawColumns(['text'])
            ->make(true);
    }

    public function penjualan_dikirim(Request $request)
    {
        $user = $this->userAuth();
        if ($request->ajax()) {

            if ($request->filled('start_date') && $request->filled('end_date')) {
                $startdate = $request->start_date;
                $enddate = $request->end_date;

                $query = "SELECT pb.invoice_number,pb.nama_pembeli,pb.alamat_pembeli,pb.telepon_pembeli,pb.tgl_pembelian,pb.status, 
                            SUM(pbd.quantity * pbd.harga_barang) as total_penjualan 
                            FROM `penjualan_barangs` as pb
                            JOIN 
                                penjualan_barang_details as pbd
                            ON 
                                pbd.invoice_number = pb.invoice_number
                            WHERE status = 'DIKIRIM' 
                                AND tgl_pembelian BETWEEN '$startdate' AND '$enddate'
                            GROUP BY 
                                pb.invoice_number,
                                pb.nama_pembeli,
                                pb.tgl_pembelian,
                                pb.status,
                                pb.created_at,
                                pb.alamat_pembeli,
                                pb.telepon_pembeli
                            ORDER BY pb.created_at DESC";
                $data = DB::select($query);
            } else {
                $query = "SELECT pb.invoice_number,pb.nama_pembeli,pb.alamat_pembeli,pb.telepon_pembeli,pb.tgl_pembelian,pb.tgl_pengiriman,pb.status, 
                                SUM(pbd.quantity * pbd.harga_barang) as total_penjualan 
                            FROM `penjualan_barangs` as pb
                            JOIN 
                                penjualan_barang_details as pbd
                            ON 
                                pbd.invoice_number = pb.invoice_number
                            WHERE status = 'DIKIRIM'
                            GROUP BY 
                                pb.invoice_number,
                                pb.nama_pembeli,
                                pb.tgl_pembelian,
                                pb.status,
                                pb.created_at,
                                pb.alamat_pembeli,
                                pb.telepon_pembeli,
                                pb.tgl_pengiriman
                            ORDER BY pb.created_at DESC";
                $data = DB::select($query);
            }
            $count = 0;
            foreach ($data as $key => $value) {
                $count += $value->total_penjualan;
            }

            return DataTables::of($data)
                ->addColumn('action', function ($object) {
                    $html = '<a data-bs-toggle="modal" data-bs-target="#lihatdetail" class="btn btn-primary waves-effect waves-light btn-detail">
                    <i class="bx bx-detail align-middle font-size-18"></i> Detail Invoice</a>';
                    return $html;
                })
                ->addColumn('total_penjualan_dikirim', function ($object) use ($count) {
                    return $count;
                })

                ->addColumn('links', function ($data) {
                    return 'invoice-dikirim/' . $data->invoice_number;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.kasir.penjualan-dikirim', compact('user'));
    }

    public function get_tabel_penjualan_dikirim(Request $request)
    {
        $query = "SELECT pb.invoice_number,pb.nama_pembeli,pbd.nama_barang,pbd.quantity,pbd.harga_barang, (pbd.quantity * pbd.harga_barang) as total 
                    FROM `penjualan_barang_details` as pbd 
                    JOIN 
                        penjualan_barangs as pb 
                    ON 
                        pb.invoice_number = pbd.invoice_number 
                    WHERE pb.invoice_number = '$request->invoice'";

        $detail_penjualans = DB::select($query);

        return DataTables::of($detail_penjualans)
            ->editColumn('harga_barang', function ($data) {
                return 'Rp ' . number_format($data->total, 0, '.');
            })
            ->editColumn('total', function ($data) {
                return 'Rp ' . number_format($data->total, 0, '.');
            })
            ->addColumn('total', function ($data) {
                return $data->quantity * $data->harga_barang;
            })
            ->make(true);
    }

    // FUNGSI CETAK INVOICE
    public function invoice_diterima(Request $request, PenjualanBarang $penjualan)
    {
        $user = $this->userAuth();
        $data = $penjualan->where('invoice_number', $penjualan->invoice_number)->get();
        $query = "SELECT * FROM `penjualan_barang_details` WHERE invoice_number = '$penjualan->invoice_number'";
        $dataProduk = DB::select($query);
        return view('pages.kasir.invoice-diterima', compact('data', 'dataProduk', 'user'));
    }
    public function invoice_dikirim(Request $request, PenjualanBarang $penjualan)
    {
        $user = $this->userAuth();
        $data = $penjualan->where('invoice_number', $penjualan->invoice_number)->get();
        $query = "SELECT * FROM `penjualan_barang_details` WHERE invoice_number = '$penjualan->invoice_number'";
        $dataProduk = DB::select($query);
        return view('pages.kasir.invoice-dikirim', compact('data', 'dataProduk', 'user'));
    }
}
