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
    <script>
        let persetujuan;
        let pemesanan_id
        $('#datatable').DataTable({
            ordering: false
        });

        $('#save-persetujuan').on('click', function() {
            persetujuan = $("input[name='btnradio']:checked").val();
            pemesanan_id = $('#pemesanan_id').text();
            // console.log(pemesanan_id);
            $('#answer').text(persetujuan);
            // $('#confirmModal').modal('toggle');

        });

        $('#btn-save').on('click', function() {
            $.ajax({
                type: "POST",
                url: "{{ route('pemesanan.persetujuan') }}",
                data: {
                    '_token': "{{ csrf_token() }}",
                    'persetujuan': persetujuan,
                    'pemesanan_id': pemesanan_id
                },
                dataType: "json",
                success: function(response) {
                    window.location = "{{ route('pemesanan') }}";
                }
            });
        });
    </script>
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
                    <h4 class="card-title mb-3">Detail Pemesanan <span id="pemesanan_id">{{ $pemesanan[0]->invoice }}</span></h4>
                    <form action="{{ route('pemesanan.persetujuan') }}" method="post">
                        @csrf
                        <input type="hidden" name="pemesanan_id" value="{{ $pemesanan[0]->invoice }}">
                        <div class="row mb-4 mt-1">
                            <div class="col-2">
                                <a href="{{ route('pemesanan') }}" class="btn btn-secondary waves-effect waves-light">
                                    <i class="bx bx-caret-left align-middle me-2 font-size-18"></i>Kembali
                                </a>
                            </div>
                            @if ($user->role == 'owner' && $pemesanan[0]->status_pemesanan == 'Menunggu Persetujuan')
                                <div class="col-5 d-flex justify-content-end">
                                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                        <input type="radio" class="btn-check" name="persetujuan" value="Disetujui" id="disetujui"
                                            autocomplete="off" checked>
                                        <label class="btn btn-outline-primary" for="disetujui">Disetujui</label>
    
                                        <input type="radio" class="btn-check" name="persetujuan" value="Ditolak" id="ditolak"
                                            autocomplete="off">
                                        <label class="btn btn-outline-primary" for="ditolak">Ditolak</label>
                                    </div>
                                </div>
    
                                <div class="col">
                                    <div class="d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary waves-effect waves-light" id="save-persetujuan">
                                            <i class="bx bx-save align-middle me-2 font-size-18"></i>Simpan
                                        </button>
                                    </div>
                                </div>
                            @endif
                        </div>
                    </form>
                    {{-- @dump($pemesanan) --}}
                    <table id="datatable" class="table table-bordered dt-responsive nowrap w-100">
                        <thead>
                            <tr>
                                <th>Nama Barang</th>
                                <th>Nama Supplier</th>
                                <th>Tanggal Datang</th>
                                <th>Stok Sekarang</th>
                                <th>EOQ</th>
                                <th>ROP</th>
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
                                    <td>{{ $data->eoq }}</td>
                                    <td>{{ $data->rop }}</td>
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
