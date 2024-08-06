<h4 class="card-title">Form @yield('title')</h4>
{{-- <p class="card-title-desc">Here are examples of <code>.form-control</code> applied to_counter
    each
    textual HTML5 <code>&lt;input&gt;</code> <code>type</code>.</p> --}}
    
<div class="mt-4 mb-3 row">
    <label for="nama_supplier" class="col-md-2 col-form-label">Nama Supplier</label>
    <div class="col-md-10">
        <input class="form-control" type="text" id="nama_supplier"
            name="nama_supplier" value="{{ !empty($supplier) ? $supplier->nama : '' }}"
            placeholder="Ketikkan Nama Supplier">
    </div>
</div>

<div class="mt-4 mb-3 row">
    <label for="telepon_supplier" class="col-md-2 col-form-label">Telepon Supplier</label>
    <div class="col-md-10">
        <input class="form-control" type="text" id="telepon_supplier"
            name="telepon_supplier" value="{{ !empty($supplier) ? $supplier->telepon : '' }}"
            placeholder="08xxxxxxx">
    </div>
</div>

<div class="mt-4 mb-3 row">
    <label for="alamat_supplier" class="col-md-2 col-form-label">Alamat Supplier</label>
    <div class="col-md-10">
        <input class="form-control" type="text" id="alamat_supplier"
            name="alamat_supplier" value="{{ !empty($supplier) ? $supplier->alamat : '' }}"
            placeholder="Ketikkan Alamat Supplier">
    </div>
</div>

<div class="mt-4 mb-3 row">
    <div class="col-md-2"></div>
    <div class="col-md-10">
        <a href="{{ route('supplier') }}" class="btn btn-secondary waves-effect waves-light">
            <i class="bx bx-caret-left align-middle me-2 font-size-18"></i>Kembali
        </a>
        <button type="submit" class="btn btn-primary waves-effect waves-light"><i
                class="bx bx bxs-save align-middle me-2 font-size-18"></i>Simpan</button>
    </div>
</div>
