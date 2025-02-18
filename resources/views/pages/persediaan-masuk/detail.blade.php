@extends('layouts.app')

@section('title')
    Detail Pemesanan
@endsection

@push('before-app-style')
    <!-- DataTables -->
    <link href="{{ asset('assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css') }}" rel="stylesheet"
        type="text/css" />
    <link href="{{ asset('assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css') }}" rel="stylesheet"
        type="text/css" />

    <!-- Responsive datatable examples -->
    <link href="{{ asset('assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css') }}" rel="stylesheet"
        type="text/css" />
@endpush

@push('after-app-script')
    <script src="{{ asset('assets/libs/datatables.net/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <!-- Responsive examples -->
    <script src="{{ asset('assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js') }}"></script>

    <!-- Datatable init js -->
    <script src="{{ asset('assets/js/pages/datatables.init.js') }}"></script>
@endpush

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">Data @yield('title')</h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                        <li class="breadcrumb-item active">Data @yield('title')</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            @if (session()->has('msg'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="mdi mdi-check-all me-2"></i>
                    {{ session('msg') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            @endif
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Detail Pemesanan {{ $pemesanan[0]->invoice }}</h4>
                    <form action="{{ route('persediaan-masuk.store') }}" method="post">
                        @csrf
                        <input type="hidden" name="pemesanan_id" value="{{ $pemesanan[0]->invoice }}">
                        <div class="row mb-4 mt-1">
                            <div class="col-2">
                                <a href="{{ route('pemesanan') }}" class="btn btn-secondary waves-effect waves-light">
                                    <i class="bx bx-caret-left align-middle me-2 font-size-18"></i>Kembali
                                </a>
                            </div>
                                <div class="col">
                                    <div class="d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary waves-effect waves-light" id="save-persetujuan">
                                            <i class="bx bx-save align-middle me-2 font-size-18"></i>Tambah ke Stok Barang
                                        </button>
                                    </div>
                                </div>
                        </div>
                    </form>
                    <table id="datatable" class="table table-bordered dt-responsive nowrap w-100">
                        <thead>
                            <tr>
                                <th>Nama Barang</th>
                                <th>Nama Supplier</th>
                                <th>Tanggal Datang</th>
                                <th>Stok Sekarang</th>
                                <th>Jumlah Pemesanan</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($pemesanan as $data)
                                <tr>
                                    <td>{{ $data->nama_barang }}</td>
                                    <td>{{ $data->nama }}</td>
                                    <td>{{ \Carbon\Carbon::parse($data->created_at)->addDays($data->tgl_datang)->translatedFormat('d F Y') }}</td>
                                    <td>{{ $data->stok_masuk }}</td>
                                    <td>{{ $data->jumlah_pemesanan }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div> <!-- end col -->
    </div>
@endsection
