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
        const kainno3 = document.getElementById('kainno3');
        const kainno4 = document.getElementById('kainno4');
        const kainno5 = document.getElementById('kainno5');
        const kainno6 = document.getElementById('kainno6');
        const kainno7 = document.getElementById('kainno7');
        const kainno8 = document.getElementById('kainno8');
        const kainno9 = document.getElementById('kainno9');
        
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
        new Chart(kainno1, {
            type: 'bar',
            data: {
                labels: ['Stok Barang','EOQ','ROP','SS'],
                datasets: [
                    {
                        label: `Data {{ $hasilchart[0]->nama_barang }}`,
                        data: [{{$hasilchart[0]->stok_masuk }},{{ $hasilchart[0]->eoq }},{{ $hasilchart[0]->rop }},{{ $hasilchart[0]->ss }}],
                        borderWidth: 1
                    },
                ]
            },
            options: {
                indexAxis: 'y',
                optionsChart
            }
        });
        new Chart(kainno2, {
            type: 'bar',
            data: {
                labels: ['Stok Barang','EOQ','ROP','SS'],
                datasets: [
                    {
                        label: `Data {{ $hasilchart[1]->nama_barang }}`,
                        data: [{{$hasilchart[1]->stok_masuk }},{{ $hasilchart[1]->eoq }},{{ $hasilchart[1]->rop }},{{ $hasilchart[1]->ss }}],
                        borderWidth: 1
                    },
                ]
            },
            options: {
                indexAxis: 'y',
                optionsChart
            }
        });
        new Chart(kainno3, {
            type: 'bar',
            data: {
                labels: ['Stok Barang','EOQ','ROP','SS'],
                datasets: [
                    {
                        label: `Data {{ $hasilchart[2]->nama_barang }}`,
                        data: [{{$hasilchart[2]->stok_masuk }},{{ $hasilchart[2]->eoq }},{{ $hasilchart[2]->rop }},{{ $hasilchart[2]->ss }}],
                        borderWidth: 1
                    },
                ]
            },
            options: {
                indexAxis: 'y',
                optionsChart
            }
        });
        new Chart(kainno4, {
            type: 'bar',
            data: {
                labels: ['Stok Barang','EOQ','ROP','SS'],
                datasets: [
                    {
                        label: `Data {{ $hasilchart[3]->nama_barang }}`,
                        data: [{{$hasilchart[3]->stok_masuk }},{{ $hasilchart[3]->eoq }},{{ $hasilchart[3]->rop }},{{ $hasilchart[3]->ss }}],
                        borderWidth: 1
                    },
                ]
            },
            options: {
                indexAxis: 'y',
                optionsChart
            }
        });
        new Chart(kainno5, {
            type: 'bar',
            data: {
                labels: ['Stok Barang','EOQ','ROP','SS'],
                datasets: [
                    {
                        label: `Data {{ $hasilchart[4]->nama_barang }}`,
                        data: [{{$hasilchart[4]->stok_masuk }},{{ $hasilchart[4]->eoq }},{{ $hasilchart[4]->rop }},{{ $hasilchart[4]->ss }}],
                        borderWidth: 1
                    },
                ]
            },
            options: {
                indexAxis: 'y',
                optionsChart
            }
        });
        new Chart(kainno6, {
            type: 'bar',
            data: {
                labels: ['Stok Barang','EOQ','ROP','SS'],
                datasets: [
                    {
                        label: `Data {{ $hasilchart[5]->nama_barang }}`,
                        data: [{{$hasilchart[5]->stok_masuk }},{{ $hasilchart[5]->eoq }},{{ $hasilchart[5]->rop }},{{ $hasilchart[5]->ss }}],
                        borderWidth: 1
                    },
                ]
            },
            options: {
                indexAxis: 'y',
                optionsChart
            }
        });
        new Chart(kainno7, {
            type: 'bar',
            data: {
                labels: ['Stok Barang','EOQ','ROP','SS'],
                datasets: [
                    {
                        label: `Data {{ $hasilchart[6]->nama_barang }}`,
                        data: [{{$hasilchart[6]->stok_masuk }},{{ $hasilchart[6]->eoq }},{{ $hasilchart[6]->rop }},{{ $hasilchart[6]->ss }}],
                        borderWidth: 1
                    },
                ]
            },
            options: {
                indexAxis: 'y',
                optionsChart
            }
        });
        new Chart(kainno8, {
            type: 'bar',
            data: {
                labels: ['Stok Barang','EOQ','ROP','SS'],
                datasets: [
                    {
                        label: `Data {{ $hasilchart[7]->nama_barang }}`,
                        data: [{{$hasilchart[7]->stok_masuk }},{{ $hasilchart[7]->eoq }},{{ $hasilchart[7]->rop }},{{ $hasilchart[7]->ss }}],
                        borderWidth: 1
                    },
                ]
            },
            options: {
                indexAxis: 'y',
                optionsChart
            }
        });
        new Chart(kainno9, {
            type: 'bar',
            data: {
                labels: ['Stok Barang','EOQ','ROP','SS'],
                datasets: [
                    {
                        label: `Data {{ $hasilchart[8]->nama_barang }}`,
                        data: [{{$hasilchart[8]->stok_masuk }},{{ $hasilchart[8]->eoq }},{{ $hasilchart[8]->rop }},{{ $hasilchart[8]->ss }}],
                        borderWidth: 1
                    },
                ]
            },
            options: {
                indexAxis: 'y',
                optionsChart
            }
        });
        
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
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <div>
                        <canvas id="kainno1" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <div>
                        <canvas id="kainno2" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <div>
                        <canvas id="kainno3" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <div>
                        <canvas id="kainno4" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <div>
                        <canvas id="kainno5" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <div>
                        <canvas id="kainno6" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <div>
                        <canvas id="kainno7" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <div>
                        <canvas id="kainno8" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <div>
                        <canvas id="kainno9" width="400" height="200"></canvas>
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
