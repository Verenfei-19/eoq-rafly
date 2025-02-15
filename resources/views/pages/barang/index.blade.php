@extends('layouts.app')

@section('title')
    Barang
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
        const rupiah = (number) => {
            return new Intl.NumberFormat("id-ID", {
                style: "currency",
                currency: "IDR"
            }).format(number);
        }

        let barangDatatable = $('#datatable').DataTable({
            ajax: "{{ route('barang') }}",
            columns: [{
                    data: "barang_id",
                    name: "barang_id"
                },
                {
                    data: "nama_barang",
                    name: "nama_barang"
                },
                {
                    data: "harga_supplier",
                    render: function(data, type, row) {
                        return rupiah(data);
                    }
                },
                {
                    data: "harga_barang",
                    render: function(data, type, row) {
                        return rupiah(data);
                    }
                },
                @if ($user->role == 'gudang' || $user->role == 'owner' || $user->role == 'admin')
                    {
                        data: "biaya_penyimpanan",
                        render: function(data, type, row) {
                            return rupiah(data);
                        }
                    }, {
                        data: "rop",
                        name: "rop"
                    }, {
                        data: "ss",
                        name: "ss"
                    }, {
                        data: "qty_total",
                        name: "qty_total"
                    },
                    @if ($user->role == 'gudang' || $user->role == 'owner' || $user->role == 'admin')
                        {
                            data: "action",
                            name: "action"
                        },
                    @endif
                @else
                    {
                        data: "quantity",
                        name: "quantity"
                    },
                @endif

            ],
        });

        $("#biaya_penyimpanan").keypress(function(evt) {
            var key = String.fromCharCode(evt.which);
            if (!(/[0-9]/.test(key))) {
                evt.preventDefault();
            }
        });
        $('.alert-penyimpanan').hide();
        $('.alert-warning').hide();

        // SAVE BIAYA PENYIMPANAN
        $('#btn-save').on('click', function() {
            let total_biaya = $('#biaya_penyimpanan').val();
            if (total_biaya != "") {
                $.ajax({
                    type: "post",
                    url: "{{ route('barang.biayapenyimpanan') }}",
                    data: {
                        '_token': "{{ csrf_token() }}",
                        'total_biaya': Number(total_biaya)
                    },
                    success: function(response) {
                        $('#biayaModal').modal('toggle');
                        $('.alert-penyimpanan').show();
                        $('#datatable').DataTable().clear();
                        $('#datatable').DataTable().destroy();
                        $('#datatable').DataTable({
                            ajax: "{{ route('barang') }}",
                            columns: [{
                                    data: "barang_id",
                                    name: "barang_id"
                                },
                                {
                                    data: "nama_barang",
                                    name: "nama_barang"
                                },
                                {
                                    data: "harga_barang",
                                    render: function(data, type, row) {
                                        return rupiah(data);
                                    }
                                },
                                {
                                    data: "biaya_penyimpanan",
                                    render: function(data, type, row) {
                                        return rupiah(data);
                                    }
                                },
                                {
                                    data: "rop",
                                    name: "rop"
                                },
                                {
                                    data: "ss",
                                    name: "ss"
                                },
                                {
                                    data: "qty_total",
                                    name: "qty_total"
                                },
                                {
                                    data: "action",
                                    name: "action"
                                }
                            ],
                        });
                        $('#biaya_penyimpanan').val("");
                    }
                });
            } else {
                $('#biayaModal').modal('toggle');
                $('.alert-warning').show();
                $('#biaya_penyimpanan').val("");
            }
        });

        $('.btn-close').on('click', function() {
            $('.alert').hide();
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
            <div class="alert alert-success alert-dismissible alert-penyimpanan" role="alert">
                <i class="mdi mdi-check-all me-2"></i>
                Biaya Penyimpanan berhasil disimpan
                <button type="button" class="btn-close" aria-label="Close"></button>
            </div>
            <div class="alert alert-warning alert-dismissible" role="alert">
                <i class="mdi mdi-alert-outline me-2"></i>
                Biaya penyimpanan tidak boleh kosong
                <button type="button" class="btn-close" aria-label="Close"></button>
            </div>
            <div class="card">
                <div class="card-body">

                    <table id="datatable" class="table table-bordered dt-responsive  nowrap w-100">
                        <thead>
                            <tr>
                                <th>ID Barang</th>
                                <th>Nama Barang</th>
                                <th>Harga Supplier</th>
                                <th>Harga Barang</th>
                                @if ($user->role == 'gudang' || $user->role == 'owner' || $user->role == 'admin')
                                    <th>Biaya Penyimpanan</th>
                                    <th>ROP</th>
                                    <th>SS</th>
                                    <th>Quantity Total</th>
                                    @if ($user->role == 'gudang' || $user->role == 'owner' || $user->role == 'admin')
                                        <th>Action</th>
                                    @endif
                                @else
                                    <th>Quantity</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>
            </div>
        </div> <!-- end col -->
    </div>

    <div class="modal fade" id="biayaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Total Biaya Penyimpanan</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label for="nama_barang" class="form-label font-weight-bold">Total biaya penyimpanan akan dibagi total
                        stok barang agar menjadi biaya penyimpanan barang per unit</label>
                    <input class="form-control" type="text" value="" id="biaya_penyimpanan"
                        placeholder="Masukkan Total Biaya Penyimpanan">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                    <button type="button" class="btn btn-primary" id="btn-save">Simpan</button>
                </div>
            </div>
        </div>
    </div>

@endsection
