@extends('layouts.app')

@section('title')
    Rekapitulasi Penjualan 
    {{-- {{ \Carbon\Carbon::parse(date('F'))->locale('id')->isoFormat('MMMM') }} --}}
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
                url: "{{ route('rekap.index') }}",
                data:function (d) {
                    d.start_date = $('#start_date').val();
                    d.end_date = $('#end_date').val();
                }
            },
            columns: [
                {
                    data: 'id_barang',
                    name: 'id_barang',
                    orderable: false,
                    searchable: false
                },
                {
                    data: 'nama_barang',
                    name: 'nama_barang',
                },
                {
                    data: 'total_quantity',
                    name: 'item_terjual'
                },
                
                // {
                //     data: 'harga_barang',
                //     name: 'harga_barang',
                //     render: function(data, type, row) {
                //         return formatRupiah(data);
                //     }
                // }
                // {
                //     data: 'tgl_pembelian',
                //     name: 'tgl_pembelian'
                // },
                {
                    data: 'total_harga',
                    name: 'Total Penjualan',
                    render: function(data, type, row) {
                        return formatRupiah(data);
                    }
                }   
            ],
            "searching": false,
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
                // let total_harga_item = json.data[0].total_harga_item;
                let total_harga_penjualan = json.data[0].total_harga_item;
                // $('#total_harga_item').text(formatRupiah(total_harga_item)); 
                $('#total_penjualan').text(formatRupiah(total_harga_penjualan));    
            });
        });

        $("#filter_table").click(function(){
                // mainTable.destroy();
                $('#filter_table').attr('disabled',true)
                $('#reset_btn').removeClass('d-none');
                mainTable.draw();
                setTimeout(() => {
                    $('#filter_table').attr('disabled',false)
                }, 2000);
                // $('#start_date').val(null);
                // $('#end_date').val(null);
        });
        $("#reset_btn").click(function(){
                // mainTable.destroy();
                mainTable.ajax.reload();
                $('#reset_btn').addClass('d-none');
                setTimeout(() => {
                    $('#reset_btn').attr('disabled',false)
                }, 2000);
                $('#start_date').val(null);
                $('#end_date').val(null);
        });
        $('#filter_table').on('click', (e) => {

            $('#filter_table').attr('disabled',false)
            // $('#start_date').val(null);
            // $('#end_date').val(null);
        })

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
                            <input type="date" class="form-control" name="end_date" id="end_date">
                        </div>
                        <div>
                            <button class="btn btn-primary waves-effect waves-light" id="filter_table">
                                <i class="bx bx-search align-middle me-2 font-size-18"></i>Rekap
                            </button>
                            <a type="reset" class="btn btn-warning waves-effect waves-light d-none" id="reset_btn">
                               Reset
                            </a>
                        </div>
                    </div>
                    <table id="datatable" class="table table-bordered dt-responsive  nowrap w-100">
                        <thead>
                            <tr>
                                <th>ID Barang</th>
                                <th>Nama Barang</th>
                                <th>Total Item Terjual</th>
                                {{-- <th>Harga Item</th> --}}
                                {{-- <th>Tanggal Pembelian</th> --}}
                                <th>Total Penjualan</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <div class="mt-5 vstack gap-3">
                        {{-- <div class="d-flex justify-content-between">
                            <h3>Total Harga Item</h3>
                            <span class="fs-3" id="total_harga_item"></span>
                        </div> --}}
                        <div class="d-flex justify-content-between">
                            <h3>Total Harga Penjualan</h3>
                            <span class="fs-3" id="total_penjualan"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
