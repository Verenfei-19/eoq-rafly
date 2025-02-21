<?php

namespace App\Http\Controllers;

use App\Models\Admin\Barang;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class SupplierController extends Controller
{
    public function userAuth()
    {
        $user = Auth::guard('user')->user();
        return $user;
    }

    public function index(Request $request)
    {
        $user = $this->userAuth();
        $path = 'supplier';
        if ($request->ajax()) {
            $query = "SELECT sp.id, sp.nama, sp.telepon, sp.alamat, bg.nama_barang ,sp.waktu 
                    FROM `suppliers` as sp 
                    JOIN 
                        barangs as bg ON bg.barang_id = sp.id_barang";
            $suppliers = DB::select($query);

            return DataTables::of($suppliers)
                ->addColumn('action', function ($object) use ($path) {
                    $html = ' <a href="' . route($path . ".edit", $object->id) . '" class="btn btn-success waves-effect waves-light">'
                        . ' <i class="bx bx-edit align-middle me-2 font-size-18"></i>Edit</a>';
                    $html .= ' <a onclick="confirmDelete(event, this.href);" href="' . route($path . ".destroy", $object->id) . '" class="btn btn-danger waves-effect waves-light">'
                        . ' <i class="bx bx-trash align-middle me-2 font-size-18"></i>Hapus</a>';
                    return $html;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('pages.supplier.index', compact('user'));
    }

    public function create()
    {
        $user = $this->userAuth();
        $barang = Barang::all();
        return view('pages.supplier.create', compact('user', 'barang'));
    }

    public function store(Request $request)
    {
        Supplier::create([
            'nama' => $request->nama_supplier,
            'telepon' => $request->telepon_supplier,
            'alamat' => $request->alamat_supplier,
            'waktu' => $request->waktu,
            'id_barang' => $request->id_barang
        ]);
        return redirect()->route('supplier')->with('msg', 'Data counter baru berhasil ditambahkan');
    }


    public function edit(Supplier $supplier)
    {
        $user = $this->userAuth();
        $barang = Barang::all();
        return view('pages.supplier.edit', ['supplier' => $supplier, 'user' => $user, 'barang' => $barang]);
    }

    public function update(Request $request, Supplier $supplier)
    {
        $supplier->update([
            'nama' => $request->nama_supplier,
            'telepon' => $request->telepon_supplier,
            'alamat' => $request->alamat_supplier,
        ]);
        return redirect()->route('supplier')->with('msg', 'Data supplier berhasil diubah');
    }

    public function destroy(Supplier $supplier)
    {
        $supplier->delete();
        return redirect()->route('supplier')->with('msg', 'Data supplier berhasil dihapus');
    }
}
