<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Barang;
use App\Models\Admin\DetailPersediaanMasuk;
use App\Models\Admin\Pemesanan;
use Illuminate\Http\Request;
use App\Models\Admin\PersediaanMasuk;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Str;
use App\Models\Admin\BarangGudang;
use App\Models\PemesananBarang;

class PersediaanMasukController extends Controller
{

    public function userAuth()
    {
        $user = Auth::guard('user')->user();
        return $user;
    }

    public function index(Request $request)
    {
        $user = $this->userAuth();
        $path = 'persediaan-masuk';
        if ($request->ajax()) {

            $query = "SELECT pb.invoice, pb.status_pemesanan, pb.created_at, pb.biaya_pemesanan
            FROM `pemesanan_barangs` AS pb
            JOIN suppliers AS sp ON sp.id = pb.id_supplier
            WHERE pb.status_pemesanan = 'Disetujui'
            GROUP BY pb.invoice, pb.status_pemesanan, pb.created_at, pb.biaya_pemesanan";
            $pemesanan = DB::select($query);

            return DataTables::of($pemesanan)
                ->addColumn('action', function ($object) use ($path) {
                    $html = ' <a href="' . route($path . '.detail', ["slug" => $object->invoice]) . '" class="btn btn-info waves-effect waves-light btn-detail">
                    <i class="bx bx-detail font-size-18 align-middle me-2"></i> Detail</a>';
                    return $html;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('pages.persediaan-masuk.index', compact('user'));
    }

    public function detail($slug)
    {
        $user = $this->userAuth();

        $pemesanan = DB::table('pemesanan_barangs as pb')->where('invoice', $slug)
            ->join('barang_gudangs as bg', 'bg.barang_id', '=', 'pb.id_barang')
            ->join('barangs as b', 'b.barang_id', '=', 'pb.id_barang')
            ->join('suppliers as sp', 'sp.id', '=', 'pb.id_supplier')
            ->selectRaw('pb.id,pb.invoice,sp.nama,b.nama_barang,pb.tgl_datang,pb.status_pemesanan, bg.stok_masuk,pb.eoq,pb.rop,pb.ss,pb.jumlah_pemesanan,pb.created_at')->get();

        return view('pages.persediaan-masuk.detail', compact('user', 'pemesanan'));
    }

    public function store(Request $request)
    {
        $pemesanan_id = $request->pemesanan_id;

        $data_pemesanan = PemesananBarang::where('invoice', $pemesanan_id)->get();

        foreach ($data_pemesanan as $key => $value) {
            $barang_gudang = BarangGudang::where('barang_id', $value['id_barang'])->first('stok_masuk');

            Barang::where('barang_id',  $value['id_barang'])->update([
                'ss' => $value['ss'],
                'rop' => $value['rop'],
            ]);

            BarangGudang::where('barang_id', $value['id_barang'])->update([
                'stok_masuk' => $barang_gudang['stok_masuk'] + $value['jumlah_pemesanan']
            ]);
        }
        return redirect()->route('persediaan-masuk');
    }
}
