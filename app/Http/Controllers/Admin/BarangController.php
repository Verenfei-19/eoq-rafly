<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin\Barang;
use App\Models\Admin\BarangGudang;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class BarangController extends Controller
{

    public function userAuth()
    {
        $user = Auth::guard('user')->user();
        return $user;
    }

    public function index(Request $request)
    {
        $user = $this->userAuth();
        $path = 'barang';

        if ($user->role == 'gudang' || $user->role == 'owner' || $user->role == 'admin') {
            if ($request->ajax()) {
                $query = "SELECT b.barang_id,b.slug,b.nama_barang,b.harga_barang,b.harga_supplier,b.biaya_penyimpanan,b.rop,b.ss,bg.stok_masuk  as qty_total
                            FROM `barang_gudangs` as bg 
                            JOIN 
                                barangs as b 
                            ON 
                                b.barang_id = bg.barang_id;";
                $barangs = DB::select($query);

                return DataTables::of($barangs)
                    ->addColumn('action', function ($object) use ($path, $user) {
                        $html = '';
                        $html .= ' <a href="' . route($path . ".edit", ["slug" => $object->slug]) . '" class="btn btn-success waves-effect waves-light">'
                            . ' <i class="bx bx-edit align-middle me-2 font-size-18"></i></a>';
                        $html .= ' <a href="' . route($path . ".destroy", ["slug" => $object->slug]) . '" class="btn btn-danger waves-effect waves-light">'
                            . ' <i class="bx bx-trash align-middle me-2 font-size-18"></i></a>';
                        return $html;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
            }
        } elseif ($user->role == 'counter') {
            if ($request->ajax()) {
                // GET DATA BARANG GUDANG BY LOGIN COUNTER/TOKO
                $query = "SELECT a.barang_id as barang_id, b.slug,a.nama_barang, a.harga_barang, b.stok_masuk as quantity
                FROM barangs as a
                JOIN barang_gudangs as b on a.barang_id = b.barang_id
                GROUP BY b.barang_gudang_id, b.slug, a.nama_barang, a.harga_barang
                ORDER BY b.barang_gudang_id ASC";
                $data = DB::select($query);
                return DataTables::of($data)->make(true);
            }
        }

        return view('pages.barang.index', compact('user'));
    }

    public function validatorHelper($request, $slug = null)
    {
        if (!empty($slug)) {
            $barangs = Barang::where('slug', $slug)->first();
            $check_barangs = Barang::where('nama_barang', $request['nama_barang'])
                ->where('nama_barang', '<>', $barangs->nama_barang)->count();
            if (empty($request['nama_barang']) || empty($request['harga_barang'])) {
                # tidak boleh ada field yang kosong
                $msg = (object) [
                    "message" => "Tidak boleh ada field yang kosong !!",
                    "response" => "warning"
                ];
                return $msg;
            } elseif ($check_barangs > 0) {
                $msg = (object) [
                    "message" => "Nama barang tersebut sudah ada !!",
                    "response" => "warning"
                ];
                return $msg;
            }
        } else {
            $barangs = Barang::where('nama_barang', $request['nama_barang'])->first();
            if (empty($request['nama_barang']) || empty($request['harga_barang'])) {
                # tidak boleh ada field yang kosong
                $msg = (object) [
                    "message" => "Tidak boleh ada field yang kosong !!",
                    "response" => "warning"
                ];
                return $msg;
            } elseif (!empty($barangs)) {
                # nama barang sudah ada
                $msg = (object) [
                    "message" => "Nama barang tersebut sudah ada !!",
                    "response" => "warning"
                ];
                return $msg;
            }
        }
    }

    public function edit($slug)
    {
        $user = $this->userAuth();
        $barangs = Barang::where('slug', $slug)->first();
        return view('pages.barang.edit', compact('barangs', 'user'));
    }

    public function update(Request $request, $slug)
    {
        $validator = $this->validatorHelper($request->all(), $slug);

        if (!empty($validator)) {
            return redirect()->back()->with(['msg' => $validator->message]);
        }

        DB::beginTransaction();
        try {
            $barangs = Barang::where('slug', $slug)->first();
            $barangs->nama_barang = $request->nama_barang;
            $barangs->harga_barang = $request->harga_barang;
            $barangs->save();
            DB::commit();
            return redirect()->route('barang')->with('msg', 'Data barang berhasil di ubah');
        } catch (\Exception $ex) {
            //throw $th;
            echo $ex->getMessage();
            DB::rollBack();
        }
    }

    public function destroy($slug)
    {
        DB::beginTransaction();
        try {
            Barang::where('slug', $slug)->delete();
            DB::commit();
            return redirect(route('barang'))->with('msg', 'Data barang berhasil dihapus');
        } catch (\Exception $ex) {
            //throw $th;
            echo $ex->getMessage();
            DB::rollBack();
        }
    }

    public function biayaPenyimpanan(Request $request)
    {
        // rumus = (biaya penyimpanan / quantity item tiap barang)/total barang
        $query = 'SELECT bg.barang_id,nama_barang,harga_barang,biaya_penyimpanan,rop,ss,bg.stok_masuk FROM `barangs` JOIN barang_gudangs as bg ON bg.barang_id = barangs.barang_id;';
        $data = DB::select($query);
        $jumlahBarang = BarangGudang::all()->count();
        $allBarang = Barang::all();

        foreach ($allBarang as $key => $value) {
            Barang::where('barang_id', $value['barang_id'])->update(
                [
                    'biaya_penyimpanan' => ($request->total_biaya / $data[$key]->stok_masuk) / $jumlahBarang
                ]
            );
        }
    }

    public function detailQuantity(Request $request)
    {
        $slug = $request->slug;
        $gudang = DB::table('users')
            ->where('role', 'gudang')
            ->first();
        $query = 'SELECT DISTINCT u.name as nama, 
        CASE u.name
        WHEN "' . $gudang->name . '" THEN
        (bg.stok_awal + bg.stok_masuk - bg.stok_keluar)
        ELSE
        (bc.stok_masuk - bc.stok_keluar)
        END as quantity
        FROM barangs as b
        LEFT JOIN barang_gudangs as bg on b.barang_id = bg.barang_id
        LEFT JOIN barang_counters as bc on b.barang_id = bc.barang_id
        LEFT JOIN gudangs as g on bg.gudang_id = g.gudang_id
        LEFT JOIN counters as c on bc.counter_id = c.counter_id
        LEFT JOIN users as u on g.user_id = u.user_id OR c.user_id = u.user_id WHERE b.slug = "' . $slug . '"';
        $details = DB::select($query);
        return DataTables::of($details)->make(true);
    }

    public function checkROP()
    {
        // NOTIFIKASI
        $barangs = DB::table('barang_gudangs as bg')
            ->join('barangs as b', 'b.barang_id', '=', 'bg.barang_id')
            ->whereRaw('bg.stok_masuk <= b.rop')->get();
        $jumlah_barang = count($barangs);

        $result = [
            'barangs' => $barangs,
            'jumlah' => $jumlah_barang
        ];

        $result = (object) $result;
        return response()->json($result, 200);
    }
}
