<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Print</title>
</head>
<body>
    <h1 style="text-align: center">CV. HAIYA LU KONTOL LA</h1>
    <h3 style="text-align: center">Jalan Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum, aliquam!</h3>
    <hr>
    <h2 style="text-align: center; text-transform: uppercase">Invoice Tagihan</h2>
    <br>
    <span>INVOICE : {{ $data[0]['invoice_number'] }}</span>
    <table border="1" style="width: 100%; margin-top: 3rem;">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Barang</th>
                {{-- <th>invoice_number</th> --}}
                {{-- <th>nama_pembeli</th>
                <th>alamat_pembeli</th>
                <th>telepon_pembeli</th> --}}
                <th>Quantity</th>
                <th>Harga Satuan</th>
                <th>Jumlah</th>
                {{-- <th>status</th>
                <th>tgl_pengiriman</th> --}}
            </tr>
        </thead>
        <tbody>
        @php
            $subtotal = 0;
        @endphp
        @foreach ($data as $item)
            <tr>
                <td style="text-align: center">{{ $loop->iteration }}</td>
                <td>{{ $item->nama_barang }}</td>
                <td style="text-align: center">{{ $item->quantity }}</td>
                <td style="text-align: right">Rp. {{ number_format($item->harga_barang, 0, '.') }}</td>
                <td style="text-align: right">Rp. {{ number_format($item->harga_barang * $item->quantity, 0, '.') }}</td>
            </tr>
            @php
                $subtotal += $item->harga_barang * $item->quantity;
            @endphp
        @endforeach
        <tr>
            <td style="text-align: right" colspan="4">Total</td>
            <td style="text-align: right">Rp. {{ number_format($subtotal, 0, '.') }}</td>
        </tr>
        </tbody>
    </table>
    <div style="width: 100%; margin-top: 1rem; gap: 1rem; display: flex; flex-direction: column; align-items: flex-end">
        <span>Hormat Kami,</span>
        <span>(ttd)</span>
        <span><strong>Admin</strong></span>
    </div>
</body>
<script>
    window.print();
</script>
</html>