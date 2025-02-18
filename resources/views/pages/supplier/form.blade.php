<h4 class="card-title">Form @yield('title')</h4>

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
    <label for="id_barang" class="col-md-2 col-form-label">Barang Supplier</label>
    <div class="col-md-10">
        <select class="form-control" name="id_barang" id="id_barang">
            <option value="" style="display: none">-- Pilih barang --</option>
            
            @if (empty($supplier))
                @foreach ($barang as $item)
                <option value="{{ $item->barang_id }}">{{ $item->nama_barang }}</option>
                @endforeach
            @else 
                @foreach ($barang as $item)
                <option value="{{ $item->barang_id }}" {{ ($item->barang_id === $supplier->id_barang) ? 'selected' : ''}}>{{ $item->nama_barang }}</option>
                @endforeach

            @endif
        </select>
    </div>
</div>

<div class="mt-4 mb-3 row">
    <label for="waktu" class="col-md-2 col-form-label">Estimasi pengiriman dalam hari</label>
    <div class="col-md-10">
        <input class="form-control" type="number" id="waktu"
            name="waktu" value="{{ !empty($supplier) ? $supplier->waktu : '' }}"
            placeholder="3">
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
