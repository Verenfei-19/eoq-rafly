<?php

namespace App\Http\Controllers;

use App\Models\Admin\Counter;
use App\Models\Admin\UserAuth;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Str;

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
            $suppliers = Supplier::all();
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

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $user = $this->userAuth();
        return view('pages.supplier.create', compact('user'));
    }

    public function store(Request $request)
    {
        // dump($request->all());
        Supplier::create([
            'nama' => $request->nama_supplier,
            'telepon' => $request->telepon_supplier,
            'alamat' => $request->alamat_supplier,
        ]);
        return redirect()->route('supplier')->with('msg', 'Data counter baru berhasil ditambahkan');
    }


    /**
     * Display the specified resource.
     */
    public function show(Supplier $supplier)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Supplier $supplier)
    {
        $user = $this->userAuth();

        return view('pages.supplier.edit', ['supplier' => $supplier, 'user' => $user]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Supplier $supplier)
    {
        $supplier->update([
            'nama' => $request->nama_supplier,
            'telepon' => $request->telepon_supplier,
            'alamat' => $request->alamat_supplier,
        ]);
        return redirect()->route('supplier')->with('msg', 'Data supplier berhasil diubah');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Supplier $supplier)
    {
        //
        $supplier->delete();
        return redirect()->route('supplier')->with('msg', 'Data supplier berhasil dihapus');
    }
}
