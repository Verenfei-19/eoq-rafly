<script src="{{ asset('assets/libs/jquery/jquery.min.js') }}"></script>
<script src="{{ asset('assets/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('assets/libs/metismenu/metisMenu.min.js') }}"></script>
<script src="{{ asset('assets/libs/simplebar/simplebar.min.js') }}"></script>
<script src="{{ asset('assets/libs/node-waves/waves.min.js') }}"></script>
<script src="{{ asset('assets/js/app.js') }}"></script>
<script src="{{ asset('assets/libs/sweetalert2/sweetalert2.min.js') }}"></script>
<script src="{{ asset('assets/js/pages/sweet-alerts.init.js') }}"></script>
<script>
    @if ($user->role == 'gudang' || $user->role == 'admin')

        var checkROP = function() {
            $.ajax({
                type: "GET",
                url: "{{ route('barang.checkROP') }}",
                success: function(response) {
                    $("#count-notif").text(response.jumlah);
                    let html = '';
                    // NOTIFIKASI
                    response.barangs.forEach(element => {
                        html +=
                            " <a href='{{ route('pemesanan.createfromnotif') }}' class='text-reset notification-item'>" +
                            "<div class='d-flex'>" +
                            " <div class='avatar-xs me-3'>" +
                            " <span class='avatar-title bg-primary rounded-circle font-size-16'>" +
                            "<i class='bx bx-cart'></i>" +
                            "</span>" +
                            "  </div>" +
                            "<div class='flex-grow-1'>" +
                            " <h6 class='mb-1' key='t-your-order'>Barang yang harus dipesan</h6>" +
                            "   <div class='font-size-12 text-muted'>" +
                            "  <p class='mb-1' key='t-grammer'>" + element.nama_barang +
                            "    </p>" +
                            " </div>" +
                            "</div>" +
                            "</div>" +
                            "</a>"
                    });
                    $(".parentNotif").remove();
                    $(".out-simple").after(
                        '<div data-simplebar style="max-height: 230px;" class="parentNotif">' +
                        html +
                        '</div>'
                    );
                }
            });
        }

        checkROP();
        
    @endif
</script>
