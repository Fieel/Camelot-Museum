<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


//quando viene caricata l'homepage
//Richima il metodo Index del pagesController
Route::get('/', 'pagesController@Index');

//ritorna la pagina about
Route::get('/about', 'pagesController@About');

//ritorna la pagina services
Route::get('/services', 'pagesController@Services');
