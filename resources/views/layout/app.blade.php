<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- link il css nella cartella public/css/app.css -->
        <!--
            npm run dev per compilare il scss in css:
                resources/assets/sass/app.scss -> public/css/app.cs
        -->
        <link rel="stylesheet" href="{{asset('css/app.css')}}" >


        <!-- Usa la variabile messa sotto 'app name' nel file .env come titolo -->
        <title>{{Config('app.name')}}</title>

    </head>


    <body>

        @include('inc.navbar')

        <div class="container">
            <!-- caricherà qua il contenuto marcato sotto section 'content' di altre
                 pagina blade.php che estendono questo file. -->
            @yield('content')
        </div>

    </body>
    <script type="text/javascript" src="{{asset('js/app.js')}}"></script>
</html>
