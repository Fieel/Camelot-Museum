<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//controller principale
class pagesController extends Controller
{
    //richiamato a caricamento homepage
    public function Index(){
        //salvo dei dati che passerò alla view!
        $contenuto = array(
            'titolo' => 'Camelot Museum',
            'paragrafi' => ['Prima pagina di testing usando Laravel.',
                            'Questo è un paragrafo secondario',
                            'Un\'altro paragrafo casuale']
        );
        //carica la view welcome.blade.php
        //->with() passa una variabile che potrà essere usata nella view!
        return View('pages.welcome')->with($contenuto);
    }

    public function About(){
        return View('pages.about');
    }

    public function Services(){
        return View('pages.services');
    }

}
