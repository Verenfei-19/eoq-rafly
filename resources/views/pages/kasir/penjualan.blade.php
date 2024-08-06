@extends('layouts.app')

@section('title')
    History Transaksi Penjualan
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
        let mainTable = $('#datatable').DataTable({
            // lengthMenu: [5, 10, 20, 50, 100],
            ajax: "{{ route('penjualan') }}",
            columns: [
                {
                    data: 'invoice_number',
                    name: 'Invoice Barang'
                },
                {
                    data: 'nama_pembeli',
                    name: 'Nama pembeli'
                },
                {
                    data: 'created_at',
                    name: 'Created at'
                },
                {
                    data: 'status',
                    name: 'Status'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },
            ]
        });

        // let no = 1;
        // let grandTotal = 0;
        // let selectedData;
        // let keranjang = [];
        // let keranjangDatatable;

        // const rupiah = (number) => {
        //     return new Intl.NumberFormat("id-ID", {
        //         style: "currency",
        //         currency: "IDR"
        //     }).format(number);
        // }

        // $('.stok').hide();
        // $('.alert-warning').hide();
        // $('.zero').hide();
        // $('.alert-success').hide();

        // function viewKeranjangDataTable(paramOne) {
        //     $('#datatable-keranjang').DataTable().clear();
        //     $('#datatable-keranjang').DataTable().destroy();
        //     if (paramOne.length > 0) {
        //         $('#grandTotal').text(rupiah(grandTotal));
        //         return $('#datatable-keranjang').DataTable({
        //             lengthMenu: [5, 10, 20, 50, 100],
        //             data: paramOne,
        //             columns: [{
        //                     data: 'no'
        //                 },
        //                 {
        //                     data: 'nama_barang'
        //                 },
        //                 {
        //                     data: 'harga_barang',
        //                     render: function(data, type, row) {
        //                         return rupiah(data);
        //                     }
        //                 },
        //                 {
        //                     data: 'jumlah'
        //                 },
        //                 {
        //                     data: 'subtotal',
        //                     render: function(data, type, row) {
        //                         return rupiah(data);
        //                     }
        //                 },
        //                 {
        //                     data: 'id_barang',
        //                     render: function(data, type, row) {
        //                         return '<button class="btn btn-danger waves-effect waves-light btn-remove"><i class="bx bxs-trash align-middle font-size-18"></i></button>';
        //                     }
        //                 }
        //             ],
        //         });
        //     } else {
        //         $('#grandTotal').text(rupiah(grandTotal));
        //         return $('#datatable-keranjang').DataTable({
        //             lengthMenu: [5, 10, 20, 50, 100],
        //         });
        //     }
        // }

        // function changeBarangAfterAddKasir(id_barang, jumlah_pembelian) {
        //     let found = false;
        //     if (keranjang.length > 0) {
        //         for (var key in keranjang) {
        //             if (keranjang[key].id_barang == id_barang) {
        //                 grandTotal -= (keranjang[key].subtotal);
        //                 keranjang[key].jumlah = Number(jumlah_pembelian);
        //                 keranjang[key].subtotal = Number(keranjang[key].harga_barang) * Number(jumlah_pembelian);
        //                 grandTotal += keranjang[key].subtotal;
        //                 found = true;
        //                 break;
        //             }
        //             found = false;
        //         }
        //         if (found == false) {
        //             let keranjangTemp = {
        //                 "no": no++,
        //                 "id_barang": selectedData.barang_id,
        //                 // "barang_counter_id": selectedData.barang_counter_id,
        //                 // "barang_gudang_id": selectedData.barang_gudang_id,
        //                 "nama_barang": selectedData.nama_barang,
        //                 "harga_barang": selectedData.harga_barang,
        //                 "jumlah": Number(jumlah_pembelian),
        //                 "subtotal": (selectedData.harga_barang) * Number(jumlah_pembelian)
        //             }
        //             grandTotal += (selectedData.harga_barang) * Number(jumlah_pembelian);
        //             keranjang.push(keranjangTemp);
        //         }
        //     } else {
        //         let keranjangTemp = {
        //             "no": no++,
        //             "id_barang": selectedData.barang_id,
        //             // "barang_counter_id": selectedData.barang_counter_id,
        //             // "barang_gudang_id": selectedData.barang_gudang_id,
        //             "nama_barang": selectedData.nama_barang,
        //             "harga_barang": selectedData.harga_barang,
        //             "jumlah": Number(jumlah_pembelian),
        //             "subtotal": (selectedData.harga_barang) * Number(jumlah_pembelian)
        //         }
        //         grandTotal += (selectedData.harga_barang) * Number(jumlah_pembelian);
        //         keranjang.push(keranjangTemp);
        //     }
        // }

        // $('#datatable').on('click', '.btn-add', function(e) {
        //     selectedData = '';
        //     let indexRow = mainTable.rows().nodes().to$().index($(this).closest('tr'));
        //     selectedData = mainTable.row(indexRow).data();
        //     $('#label-barang').text(selectedData.nama_barang);
        //     $('#jumlah_pembelian').val("");
        // });

        // $('#btn-save-add').on('click', function(e) {
        //     let jumlah_pembelian = $('#jumlah_pembelian').val();
        //     let id_barang = selectedData.barang_id;
        //     if (jumlah_pembelian > selectedData.quantity) {
        //         $('#quantityModal').modal('toggle');
        //         $('.stok').show();
        //     } else if (jumlah_pembelian == "") {
        //         $('#quantityModal').modal('toggle');
        //         $('.zero').show();
        //     } else {
        //         changeBarangAfterAddKasir(id_barang, jumlah_pembelian);
        //         $('#quantityModal').modal('toggle');
        //         keranjangDatatable = viewKeranjangDataTable(keranjang);
        //     }
        // });

        // function changeNumberDelKasir() {
        //     no = 1;
        //     for (var key in keranjang) {
        //         keranjang[key].no = no;
        //         no++;
        //     }
        // }

        // $("#jumlah_pembelian").keypress(function(evt) {
        //     var key = String.fromCharCode(evt.which);
        //     if (!(/[0-9]/.test(key))) {
        //         evt.preventDefault();
        //     }
        // });

        // $('#datatable-keranjang').on('click', '.btn-remove', function(e) {
        //     selectedKeranjang = '';
        //     let indexRow = keranjangDatatable.rows().nodes().to$().index($(this).closest('tr'));
        //     selectedKeranjang = keranjangDatatable.row(indexRow).data();
        //     console.log(indexRow);
        //     console.log(selectedKeranjang);
        //     grandTotal -= selectedKeranjang.subtotal;
        //     keranjang.splice(indexRow, 1);
        //     changeNumberDelKasir();
        //     keranjangDatatable = viewKeranjangDataTable(keranjang);
        // });

        // $('.btn-close').on('click', function() {
        //     $('.alert').hide();
        // });

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
                    <table id="datatable" class="table table-bordered dt-responsive  nowrap w-100">
                        <thead>
                            <tr>
                                <th>INVOICE</th>
                                <th>Nama Pembeli</th>
                                <th>Tanggal Beli</th>
                                <th>Status</th>
                                <th class="col-md-1">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>

@endsection
