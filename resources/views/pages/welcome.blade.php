<!-- estendo il file che uso come template -->
@extends('layout.app')

<!-- il file template inietterà il codice seguente dove ha inserito
il codice yield('content') -->
@section('content')
    <!-- uso dati/variabili passati dal controller -->
    <h1>{{$titolo}}</h1>

    @if(count($paragrafi) > 0)
        <ul class="list-group">
            @foreach($paragrafi as $paragrafo)
                <li>{{$paragrafo}}</li>
            @endforeach
        </ul>
    @endif
@endsection('content')