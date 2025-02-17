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
        const chartkain = new Chart(kainno1, {
            type: 'bar',
            data: {
                labels: ['Barang','EOQ','ROP','SS'],
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

        $('#pilihbarang').on('change', function(e){
            // console.log(e.target.value);
            $.ajax({
                type: "get",
                url: "{{ route('dashboard') }}",
                data: {
                    'barang_id': e.target.value,
                },
                success: function(response) {
                    console.log(response[0].nama_barang);
                    chartkain.data.datasets[0].label = `Data ${response[0].nama_barang}`
                    chartkain.data.datasets[0].data[0] = response[0].stok_masuk; // Would update the first dataset's value of 'March' to be 50
                    chartkain.data.datasets[0].data[1] = response[0].eoq; // Would update the first dataset's value of 'March' to be 50
                    chartkain.data.datasets[0].data[2] = response[0].rop; // Would update the first dataset's value of 'March' to be 50
                    chartkain.data.datasets[0].data[3] = response[0].ss; // Would update the first dataset's value of 'March' to be 50
                    chartkain.update();
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
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <select class="form-control form-select" name="pilihbarang" id="pilihbarang">
                        @foreach ($listbarang as $item)
                            <option value="{{ $item->barang_id }}">{{ $item->nama_barang }}</option>
                        @endforeach
                    </select>
                    <div>
                        <canvas id="kainno1" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
        {{-- <div class="col-md-6">
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
        </div> --}}

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
