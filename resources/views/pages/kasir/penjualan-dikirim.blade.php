@extends('layouts.app')

@section('title')
    History Transaksi Penjualan Dikirim
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
        <style>
            .dataTables_paginate {
                display: none;
            }
            table#tabeltotalharga>thead .sorting::before,
            table#tabeltotalharga>thead .sorting_asc::before,
            table#tabeltotalharga>thead .sorting_desc::before,
            table#tabeltotalharga>thead .sorting_asc_disabled::before,
            table#tabeltotalharga>thead .sorting_desc_disabled::before {
                right: 0 !important;
                content: "" !important;
            }
            
            table#tabeltotalharga>thead .sorting::after,
            table#tabeltotalharga>thead .sorting_asc::after,
            table#tabeltotalharga>thead .sorting_desc::after,
            table#tabeltotalharga>thead .sorting_asc_disabled::after,
            table#tabeltotalharga>thead .sorting_desc_disabled::after {
                right: 0 !important;
                content: "" !important;
            }
            
            table#tabeltotalharga>thead>tr>th:not(.sorting_disabled),
            table#tabeltotalharga>thead>tr>td:not(.sorting_disabled) {
                padding-right: 0px !important;
                padding-left: 0px !important;
            }
            
            table#tabeltotalharga>thead>tr>th,
            table#tabeltotalharga>thead>tr>td {
                padding-right: 0px !important;
                padding-left: 0px !important;
            }
        </style>
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
        let mainTable = $('#datatable').DataTable({
            serverSide: true,
            ajax: {
                url: "{{ route('penjualan.dikirim') }}",
                data:function (d) {
                    d.start_date = $('#start_date').val();
                    d.end_date = $('#end_date').val();
                }
            },
            columns: [
                {
                    data: 'invoice_number',
                    name: 'invoice_number',
                    orderable: false
                },
                {
                    data: 'nama_pembeli',
                    name: 'Nama pembeli'
                },
                {
                    data: 'tgl_pembelian',
                    name: 'Created at'
                },
                {
                    data: 'status',
                    name: 'Status'
                },
                {
                    data: 'tgl_pengiriman',
                    name: 'Tanggal dikirim'
                },
                {
                    data: 'total_penjualan',
                    name: 'Total Penjualan',
                    render: function(data, type, row) {
                        return formatRupiah(data);
                    }
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },
            ]
        });

        function formatRupiah(angka) {
            return new Intl.NumberFormat('id-ID', {
                style: 'currency',
                currency: 'IDR'
            }).format(angka);
        }
            
        $(document).ready(function() {
            mainTable.on('xhr', function() {
                var json = mainTable.ajax.json();
                let total_penjualan_dikirim = json.data[0].total_penjualan_dikirim;
                $('#total_transaksi_penjualan_dikirim').text(formatRupiah(total_penjualan_dikirim)); 
                
            });
        });


        $("#filter_table").click(function(){
                // mainTable.destroy();
                $('#filter_table').attr('disabled',true)
                mainTable.draw();
                setTimeout(() => {
                    $('#filter_table').attr('disabled',false)
                }, 2000);
                $('#start_date').val(null);
                $('#end_date').val(null);
        });
        $('#filter_stable').on('click', (e) => {

            $('#filter_table').attr('disabled',false)
            $('#start_date').val(null);
            $('#end_date').val(null);
        })

        $('#datatable').on('click', '.btn-detail', function() {
            let selectedData = '';
            let invoice = '';
            let links = '';
            let indexRow = mainTable.rows().nodes().to$().index($(this).closest('tr'));
            selectedData = mainTable.row(indexRow).data();
            invoice = selectedData.invoice_number;
            link_print = selectedData.links;

            let nama_pembeli, tgl_pembelian,tgl_pengiriman,telepon_pembeli,alamat_pembeli;  
            nama_pembeli = selectedData.nama_pembeli;
            tgl_pembelian = selectedData.tgl_pembelian;
            telepon_pembeli = selectedData.telepon_pembeli;
            alamat_pembeli = selectedData.alamat_pembeli;
            link_print = selectedData.links;
            $("#get_nama_pembeli").text(selectedData.nama_pembeli);
            $("#get_tgl_pembelian").text(selectedData.tgl_pembelian);
            $("#get_tgl_pengiriman").text(selectedData.tgl_pengiriman);
            $("#get_alamat_pembeli").text(selectedData.alamat_pembeli);
            $("#get_telepon_pembeli").text(selectedData.telepon_pembeli);

            $("#invoice_id").text(selectedData.invoice_number);
            $('#detail-datatable').DataTable().clear();
            $('#detail-datatable').DataTable().destroy();
            $('#detail-datatable').DataTable({
                ajax: {
                    "type": "POST",
                    "url": "{{ route('penjualan.tabelditerima') }}",
                    "data": {
                        '_token': "{{ csrf_token() }}",
                        'invoice': invoice
                    }
                },
                lengthMenu: [5],
                columns: [{
                        data: "nama_barang",
                        name: "nama_barang"
                    },
                    {
                        data: "harga_barang",
                        name: "harga_barang"
                    },
                    {
                        data: "quantity",
                        name: "quantity"
                    },
                    {
                        data: "total",
                        name: "total"
                    }
                ],
                "searching": false,
                "lengthChange": false,
                "info": false
            });

            $('#tabeltotalharga').DataTable().clear();
            $('#tabeltotalharga').DataTable().destroy();
            $('#tabeltotalharga').DataTable({
                ajax: {
                    "type": "POST",
                    "url": "{{ route('penjualan.singlerow') }}",
                    "data": {
                        '_token': "{{ csrf_token() }}",
                        'invoice': invoice,
                    }
                },
                columns: [
                    {
                        data: "text",
                        name: "subtotal",
                        orderable: false,
                    },
                    {
                        data: "total",
                        name: "subtotal",
                        orderable: false,
                    }
                ],
                "info": false,
                "searching": false,
                "lengthChange": false,
            });
            
            $('#linkcetak').attr('href', link_print)
        });
    </script>
@endpush

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">@yield('title')</h4>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="mb-3 hstack gap-3 align-items-end">
                        <div class="">
                            <label for="start_date">Tanggal Awal</label>
                            <input type="date" class="form-control" name="start_date" id="start_date">
                        </div>
                        <div class="">
                            <label for="end_date">Tanggal Akhir</label>
                            <input type="date" class="form-control" value="{{ date('Y-m-d') }}" name="end_date" id="end_date">
                        </div>
                        <div>
                            <button class="btn btn-primary waves-effect waves-light" id="filter_table">
                                <i class="bx bx-search align-middle me-2 font-size-18"></i>Filter
                            </button>
                            <a href="{{ route('rekap.index') }}" class="btn btn-info waves-effect waves-light" id="filter_table">Rekap Penjualan Bulanan</a>
                        </div>
                    </div>
                    <table id="datatable" class="table table-bordered dt-responsive  nowrap w-100">
                        <thead>
                            <tr>
                                <th>INVOICE</th>
                                <th>Nama Pembeli</th>
                                <th>Tanggal Beli</th>
                                <th>Status</th>
                                <th>Tanggal Dikirim</th>
                                {{-- <th>Total Harga</th> --}}
                                <th>Total Penjualan</th>
                                <th class="col-md-1">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <div class="mt-5 vstack gap-3">
                        <div class="d-flex justify-content-between">
                            <h3>Total Transaksi Penjualan Dikirim</h3>
                            <span class="fs-3" id="total_transaksi_penjualan_dikirim"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- diterima -->
    <div class="modal modal-lg fade" id="lihatdetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">INVOICE <span id="invoice_id"></span> </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="hstack justify-content-between align-items-start">
                        <div>
                            <h5>Nama Kasir : {{ $user->name }}</h5>
                        </div>
                        <div>
                            <h6>Nama Pembeli : <span id="get_nama_pembeli"></span></h6>
                            <h6>Tanggal Pembelian : <span id="get_tgl_pembelian"></span></h6>
                            <h6>Tanggal Pengiriman : <span id="get_tgl_pengiriman"></span></h6>
                            <h6>Alamat : <span id="get_alamat_pembeli"></span></h6>
                            <h6>Telepon : <span id="get_telepon_pembeli"></span></h6>
                        </div>
                    </div>
                    <table id="detail-datatable" class="table table-bordered dt-responsive  nowrap w-100">
                        <thead>
                            <tr>
                                <th>Nama Item</th>
                                <th>Harga Item</th>
                                <th>Jumlah Item</th>
                                <th>Total Harga</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <table id="tabeltotalharga" class="table dt-responsive nowrap w-100">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody style="text-align: right">
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <a target="_blank" href="#" id="linkcetak" type="button" class="btn btn-primary">Cetak</a>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                </div>
            </div>
        </div>
    </div>

@endsection
