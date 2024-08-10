<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>invoice-{{ $data[0]['invoice_number'] }}</title>
</head>
<body>
    <h1 style="text-align: center">CV. PRASETYA</h1>
    <h3 style="text-align: center">Jalan Slompretan No 57, Bongkaaran, Surabaya</h3>
    <hr>
    <h2 style="text-align: center; text-transform: uppercase">Invoice Tagihan</h2>
    <br>
    <div style="display: flex; justify-content: space-between">
        <div style="display: flex; flex-direction: column; gap: 8px">
            <span>Kepada Yth:</span>
            <span>{{ $data[0]['nama_pembeli'] }}</span>
            <span>{{ $data[0]['alamat_pembeli'] }}</span>
            <span>{{ $data[0]['telepon_pembeli'] }}</span>
        </div>
        <div style="display: flex; flex-direction: column; gap: 8px">
            <span>No Invoice : {{ $data[0]['invoice_number'] }}</span>
            <span>Tanggal Pembelian : {{ $data[0]['tgl_pembelian'] }}</span>
            <span>Tanggal Pengiriman : {{ $data[0]['tgl_pengiriman'] }}</span>
        </div>
    </div>
    <table border="1" style="width: 100%; margin-top: 3rem;">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Barang</th>
                <th>Quantity</th>
                <th>Harga Satuan</th>
                <th>Jumlah</th>
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
    <div style="display: flex; justify-content: space-between; margin-top: 2rem">
        <div style="display: flex; flex-direction: column; gap: 3.5rem; align-items: center">
            <span>Diterima oleh,</span>
            <span>(____________________)</span>
        </div>
        <div style="display: flex; flex-direction: column; gap: 3.5rem; align-items: center">
            <span>Hormat kami,</span>
            <span>(____________________)</span>
        </div>
    </div>
</body>
<script>
    window.print();
</script>
</html>