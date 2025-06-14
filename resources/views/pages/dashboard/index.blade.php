@extends('layouts.app')

@section('title')
    Dashbooard
@endsection

@push('after-app-script')
    <!-- apexcharts -->
    {{-- <script src="{{ asset('assets/libs/apexcharts/apexcharts.min.js') }}"></script> --}}
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- dashboard blog init -->
    <script src="{{ asset('assets/js/pages/dashboard-blog.init.js') }}"></script>
    <script src="{{ asset('assets/libs/datatables.net/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <!-- Responsive examples -->
    <script src="{{ asset('assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js') }}"></script>

    <!-- Datatable init js -->
    <script src="{{ asset('assets/js/pages/datatables.init.js') }}"></script>
    <script>
        $('#stokPersediaan').DataTable({
            ordering: false,
            ajax: "{{ route('stoktersisa') }}",
            columns: [
                {
                    data: "barang_id"
                },
                {
                    data: "nama_barang"
                },
                {
                    data: "stok_masuk"
                }
            ],
        });
    </script>
    <script>
        const ctx = document.getElementById('myChart');
        const kainno1 = document.getElementById('kainno1');
        const kainno2 = document.getElementById('kainno2');
        
        new Chart(ctx, {
          type: 'bar',
          data: {
            // labels: {{ Js::from($dataBulan) }},
            labels: {{ Js::from($listnamabarang) }},
            datasets: [{
                label : 'Stok Barang',
                data: {{ Js::from($liststokbarang) }},
                borderWidth: 1
            }
            ]
          },
          options: {
            plugins: {
                legend: {
                position: 'top',
                },
                title: {
                    display: true,
                    text: 'Data Stok Barang'
                }
            },
            scales: {
              y: {
                beginAtZero: true
              }
            }
          }
        });
        // 
        const optionsChart = {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'OXFORD PUTIH'
                }
            },
        }
        let datasets = [
            {
                label: ['Pesanan'],
                data: {{ Js::from($arrayChart['stok_masuk']) }},
            },
            {
                label: ['EOQ'],
                data: {{ Js::from($arrayChart['eoq']) }},
            },
            {
                label: ['ROP'],
                data: {{ Js::from($arrayChart['rop']) }},
            },
            {
                label: ['SS'],
                data: {{ Js::from($arrayChart['ss']) }},
            }
        ];

        const chartkainold = new Chart(kainno2, {
            type: 'bar',
            data: {
                labels: {{ Js::from($arrayChart['nama']) }},
                datasets: datasets
            },
            options: {
                optionsChart
            }
        });

        $('#pilihbarang').on('change', function(e){
            // console.log(e.target.value);
            $.ajax({
                type: "get",
                url: "{{ route('dashboard') }}",
                data: {
                    'barang_id': e.target.value,
                },
                success: function(response) {
                    console.log(response[0]);
                    chartkainold.data.datasets = [datasets[0]]; 
                    chartkainold.data.labels = ['Pesanan','EOQ','ROP','SS']
                    chartkainold.data.datasets[0].label = `Data ${response[0].nama_barang}`
                    chartkainold.data.datasets[0].data[0] = response[0].stok_masuk; 
                    chartkainold.data.datasets[0].data[1] = response[0].eoq; 
                    chartkainold.data.datasets[0].data[2] = response[0].rop; 
                    chartkainold.data.datasets[0].data[3] = response[0].ss; 

                    // BG
                    chartkainold.data.datasets[0].backgroundColor = [
                        'rgba(255, 99, 132, 0.5)',
                        'rgba(255, 159, 64, 0.5)',
                        'rgba(75, 192, 192, 0.5)',
                        'rgba(54, 162, 235, 0.5)',
                    ]
                    chartkainold.data.datasets[0].borderColor = [
                        'rgb(255, 99, 132)',
                        'rgb(255, 159, 64)',
                        'rgb(75, 192, 192)',
                        'rgb(54, 162, 235)',
                    ]
                    chartkainold.data.datasets[0].borderWidth = 1;
                    chartkainold.update();
                }
            })
            
        })
      </script>
@endpush

@section('content')
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">Dashboard</h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>
    <!-- end page title -->

    <div class="row">

        {{-- GRAFIK --}}
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div>
                        <canvas id="myChart" width="400" height="100"></canvas>
                    </div>
                </div>
            </div>
        </div>

        {{-- KAIN --}}
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <select class="form-control form-select" name="pilihbarang" id="pilihbarang">
                        @foreach ($listbarang as $item)
                            <option value="{{ $item->barang_id }}">{{ $item->nama_barang }}</option>
                        @endforeach
                    </select>
                    <div>
                        <canvas id="kainno2" width="400" height="100"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-12">
            <div class="row">

                @if ($user->role == 'counter')
                <div class="col-lg-6">
                    <div class="card blog-stats-wid">
                        <div class="card-body">
                            <div class="d-flex flex-wrap">
                                <div class="me-3">
                                    <p class="text-muted mb-2">Total Pendapatan ({{ $bulan_tahun }})</p>
                                    <h5 class="mb-0">
                                        @php
                                            $hasil_rupiah = 'Rp ' . number_format($penjualan->total_pendapatan, 0, ',', '.');
                                            echo $hasil_rupiah;
                                        @endphp
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card blog-stats-wid">
                        <div class="card-body">
                            <div class="d-flex flex-wrap">
                                <div class="me-3">
                                    <p class="text-muted mb-2">Total Penjualan Item ({{ $bulan_tahun }})</p>
                                    <h5 class="mb-0">
                                        {{ $total_item_terjual }}
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endif

                @if ($user->role == 'gudang')
                <div class="col-lg-6">
                    <div class="card blog-stats-wid">
                        <div class="card-body">
                            <div class="d-flex flex-wrap">
                                <div class="me-3">
                                    <p class="text-muted mb-2">Total Supplier</p>
                                    <h5 class="mb-0">
                                        {{ $total_supplier }}
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card blog-stats-wid">
                        <div class="card-body">
                            <div class="d-flex flex-wrap">
                                <div class="me-3">
                                    <p class="text-muted mb-2">Total Penjualan Item ({{ $bulan_tahun }})</p>
                                    <h5 class="mb-0">
                                        {{ $total_item_terjual }}
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endif

                {{-- OWNER --}}
                @if ($user->role == 'owner' || $user->role == 'admin')
                <div class="col-lg-6">
                    <div class="card blog-stats-wid">
                        <div class="card-body">
                            <div class="d-flex flex-wrap">
                                <div class="me-3">
                                    <p class="text-muted mb-2">Total Pendapatan ({{ $bulan_tahun }})</p>
                                    <h5 class="mb-0">
                                        @php
                                            $hasil_rupiah = 'Rp ' . number_format($penjualan->total_pendapatan, 0, ',', '.');
                                            echo $hasil_rupiah;
                                        @endphp
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card blog-stats-wid">
                        <div class="card-body">
                            <div class="d-flex flex-wrap">
                                <div class="me-3">
                                    <p class="text-muted mb-2">Total Supplier</p>
                                    <h5 class="mb-0">
                                        {{ $total_supplier }}
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card blog-stats-wid">
                        <div class="card-body">
                            <div class="d-flex flex-wrap">
                                <div class="me-3">
                                    <p class="text-muted mb-2">Daftar Pemesanan Barang oleh Gudang</p>
                                    @forelse ($pemesananbarang as $item)
                                    <h4>{{ $loop->iteration }} <a href="{{ route('pemesanan.detail', $item->invoice) }}">{{ $item->invoice }}</a></h4>
                                    @empty
                                        <h4>Tidak ada pemesanan</h4>
                                    @endforelse
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                @endif

            </div>
            <!-- end row -->
            
            <div class="card">
                <div class="card-body">
                    <table id="stokPersediaan" class="table table-bordered dt-responsive  nowrap w-100">
                        <thead>
                            <tr>
                                <th>ID Barang</th>
                                <th>Nama Barang</th>
                                <th style="width: 20%">Stok</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- end col -->

    </div>
    <!-- end row -->
@endsection
