<h4 class="card-title">Form @yield('title')</h4>

<div class="mt-4 mb-3 row">
    <div class="col-md-10">
        <input class="form-control" type="text" value="{{ !empty($counters) ? $counters->counter_id : $counter_id }}"
            id="id_counter" name="counter_id" hidden>
    </div>
</div>

<div class="mt-4 mb-3 row">
    <label for="nama_counter" class="col-md-2 col-form-label">Nama Toko</label>
    <div class="col-md-10">
        <input class="form-control" type="text" id="nama_counter"
            value="{{ !empty($counters) ? $counters->name : '' }}" name="nama_counter"
            placeholder="Ketikkan Nama Toko">
    </div>
</div>

<div class="mt-4 mb-3 row">
    <label for="alamat_counter" class="col-md-2 col-form-label">Alamat Toko</label>
    <div class="col-md-10">
        <input class="form-control" type="text" id="alamat_counter"
            value="{{ !empty($counters) ? $counters->address : '' }}" name="alamat_counter"
            placeholder="Ketikkan Alamat Toko">
    </div>
</div>

<div class="mt-4 mb-3 row">
    <label for="username" class="col-md-2 col-form-label">Username</label>
    <div class="col-md-10">
        <input class="form-control" type="text" id="username"
            value="{{ !empty($counters) ? $counters->username : '' }}" name="username" placeholder="Ketikkan Username">
    </div>
</div>

<div class="mt-4 mb-3 row">
    <label for="password" class="col-md-2 col-form-label">Password</label>
    <div class="col-md-10">
        <input class="form-control" type="password" id="password" name="password" placeholder="Ketikkan Password">
    </div>
</div>

<div class="mt-4 mb-3 row">
    <div class="col-md-2"></div>
    <div class="col-md-10">
        <a href="{{ route('counter') }}" class="btn btn-secondary waves-effect waves-light">
            <i class="bx bx-caret-left align-middle me-2 font-size-18"></i>Kembali
        </a>
        <button type="submit" class="btn btn-primary waves-effect waves-light"><i
                class="bx bx bxs-save align-middle me-2 font-size-18"></i>Simpan</button>
    </div>
</div>
