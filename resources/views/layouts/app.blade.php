<!DOCTYPE html>
<html lang="en">

<head>
    @include('includes.meta')
    <title>STAR PURNAMA ID - @yield('title')</title>

    @stack('before-app-style')
    @include('includes.style')
    @stack('after-app-style')

</head>

<body data-sidebar="dark" data-layout-mode="light">
    <div id="preloader">
        <div id="status">
            <div class="spinner-chase">
                <div class="chase-dot"></div>
                <div class="chase-dot"></div>
                <div class="chase-dot"></div>
                <div class="chase-dot"></div>
                <div class="chase-dot"></div>
                <div class="chase-dot"></div>
            </div>
        </div>
    </div>

    <div id="layout-wrapper">

        @include('includes.header')

        @include('includes.sidebar')

        <div class="main-content">

            <div class="page-content">

                <div class="container-fluid">
                    @yield('content')
                </div>

            </div>

        </div>

    </div>

    @stack('before-app-script')
    @include('includes.script')
    @stack('after-app-script')

</body>

</html>
