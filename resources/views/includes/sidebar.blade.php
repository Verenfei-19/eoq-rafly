<div class="vertical-menu">

    <div data-simplebar class="h-100">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">

                    <li class="menu-title" key="t-menu">Menu</li>

                    <li>
                        <a href="{{ route('dashboard') }}">
                            <i class="bx bx-home-circle"></i>
                            <span key="t-dashboards">Dashboards</span>
                        </a>
                    </li>

                @if ($user->role == 'gudang' || $user->role == 'admin')
                <li class="menu-title" key="t-apps">Master Data</li>
                    <li>
                        <a href="{{ route('gudang') }}" class="waves-effect">
                            <i class="bx bxs-building-house"></i>
                            <span key="t-gudang">Gudang</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="{{ route('counter') }}" class="waves-effect">
                            <i class="bx bxs-store-alt"></i>
                            <span key="t-counter">Toko</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('supplier') }}" class="waves-effect">
                            <i class="bx bxs-store-alt"></i>
                            <span key="t-counter">Supplier</span>
                        </a>
                    </li>
                @endif
                @if ($user->role == 'counter' || $user->role == 'admin')
                <li>
                    <a href="{{ route('barang') }}" class="waves-effect">
                        <i class="bx bxs-component"></i>
                        <span key="t-barang">Barang</span>
                    </a>
                </li>
                @endif
                
                
                @if ($user->role == 'counter' || $user->role == 'admin')
                <li class="menu-title" key="t-pages">Utility</li>
                    <li>
                        <a href="{{ route('kasir') }}" class="waves-effect">
                            <i class="bx bxs-calculator"></i>
                            <span key="t-kasir">Kasir</span>
                        </a>
                    </li>
                @endif

                @if ($user->role == 'gudang' || $user->role == 'owner' || $user->role == 'admin')
                    <li>
                        <a href="{{ route('pemesanan') }}" class="waves-effect">
                            <i class="bx bxs-package"></i>
                            <span key="t-pemesanan">Pembelian Barang ke Supplier</span>
                        </a>
                    </li>
                @endif
                @if ($user->role == 'gudang' || $user->role == 'admin')
                    <li>
                        <a href="{{ route('persediaan-masuk') }}" class="waves-effect">
                            <i class="bx bxs-widget"></i>
                            <span key="t-pemesanan">Barang Masuk</span>
                        </a>
                    </li>
                @endif

                <li class="menu-title" key="t-components">Riwayat</li>

                <li>
                    <a href="{{ route('penjualan.diterima') }}" class="waves-effect">
                        <i class="bx bxs-spreadsheet"></i>
                        <span key="t-kasir">Transaksi Penjualan Diterima</span>
                    </a>
                </li>

                <li>
                    <a href="{{ route('penjualan.dikirim') }}" class="waves-effect">
                        <i class="bx bxs-spreadsheet"></i>
                        <span key="t-kasir">Transaksi Penjualan Dikirim</span>
                    </a>
                </li>

            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>
