@php
function penyebut($nilai) {
		$nilai = abs($nilai);
		$huruf = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
		$temp = "";
		if ($nilai < 12) {
			$temp = " ". $huruf[$nilai];
		} else if ($nilai <20) {
			$temp = penyebut($nilai - 10). " belas";
		} else if ($nilai < 100) {
			$temp = penyebut($nilai/10)." puluh". penyebut($nilai % 10);
		} else if ($nilai < 200) {
			$temp = " seratus" . penyebut($nilai - 100);
		} else if ($nilai < 1000) {
			$temp = penyebut($nilai/100) . " ratus" . penyebut($nilai % 100);
		} else if ($nilai < 2000) {
			$temp = " seribu" . penyebut($nilai - 1000);
		} else if ($nilai < 1000000) {
			$temp = penyebut($nilai/1000) . " ribu" . penyebut($nilai % 1000);
		} else if ($nilai < 1000000000) {
			$temp = penyebut($nilai/1000000) . " juta" . penyebut($nilai % 1000000);
		} else if ($nilai < 1000000000000) {
			$temp = penyebut($nilai/1000000000) . " milyar" . penyebut(fmod($nilai,1000000000));
		} else if ($nilai < 1000000000000000) {
			$temp = penyebut($nilai/1000000000000) . " trilyun" . penyebut(fmod($nilai,1000000000000));
		}     
		return $temp;
	}
 
	function terbilang($nilai) {
		if($nilai<0) {
			$hasil = "minus ". trim(penyebut($nilai));
		} else {
			$hasil = trim(penyebut($nilai));
		}     		
		return $hasil.' rupiah';
	}
@endphp
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
            <span>Kasir : {{ $user['name'] }}</span>
            <span>Kepada Yth:</span>
            <span>{{ $data[0]['nama_pembeli'] }}</span>
            <span>{{ $data[0]['alamat_pembeli'] }}</span>
            <span>{{ $data[0]['telepon_pembeli'] }}</span>
        </div>
        <div style="display: flex; flex-direction: column; gap: 8px">
            <span>No Invoice : {{ $data[0]['invoice_number'] }}</span>
            <span>Tanggal Pembelian : {{ $data[0]['tgl_pembelian'] }}</span>
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
    <div>
        <p>Terbilang : <i><strong>{{ Str::upper(terbilang($subtotal)) }}</strong></i></p>
    </div>
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