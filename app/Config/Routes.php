<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */

 // login
$routes->get('/login', 'AuthController::login');   
$routes->post('/auth/authenticate', 'AuthController::authenticate');
$routes->get('/auth/logout', 'AuthController::logout');


 


$routes->get('/', 'Home::index');
$routes->get('/dashboard', 'Home::dashboard', ['filter' => 'auth']);


/* Route Data Master */

$routes->get('/lokasi', 'LokasiController::lokasi'); 
$routes->get('/lokasi/create', 'LokasiController::create');
$routes->post('/lokasi/store', 'LokasiController::store');
$routes->get('/lokasi/edit/(:num)', 'LokasiController::edit/$1');
$routes->post('/lokasi/update/(:num)', 'LokasiController::update/$1');
$routes->delete('/lokasi/delete/(:num)', 'LokasiController::delete/$1');    


$routes->get('/pengguna', 'PenggunaController::pengguna');  
$routes->get('/pengguna/create', 'PenggunaController::create');
$routes->post('/pengguna/store', 'PenggunaController::store');
$routes->get('/pengguna/edit/(:num)', 'PenggunaController::edit/$1');
$routes->post('/pengguna/update/(:num)', 'PenggunaController::update/$1');
$routes->delete('/pengguna/delete/(:num)', 'PenggunaController::delete/$1');


// Route Untuk CRUD ASSET
$routes->group('asset', ['filter' => 'auth'], function($routes) {
$routes->get('/', 'AssetController::index');
$routes->get('/Datamaster/createasset', 'DataMasterController::createasset');
//$routes->delete('/asset/delete/(:num)', 'AssetController::delete/$1');
$routes->get('create', 'AssetController::create');
$routes->post('store', 'AssetController::store');
$routes->get('edit/(:num)', 'AssetController::edit/$1');
$routes->delete('delete/(:num)', 'AssetController::delete/$1');
$routes->get('show/(:num)', 'AssetController::show/$1');
$routes->post('update/(:num)', 'AssetController::update/$1');
});
/*
$routes->get('/asset', 'AssetController::index');
$routes->get('/Datamaster/createasset', 'DataMasterController::createasset');
$routes->delete('/asset/delete/(:num)', 'AssetController::delete/$1');
$routes->get('/asset/create', 'AssetController::create');
$routes->post('/asset/store', 'AssetController::store');
$routes->get('/asset/edit/(:num)', 'AssetController::edit/$1');
$routes->post('/asset/delete/(:num)', 'AssetController::delete/$1');
$routes->get('/asset/show/(:num)', 'AssetController::show/$1');
$routes->post('/asset/update/(:num)', 'AssetController::update/$1');
*/

// Route untuk crud kendaraan
$routes->group('kendaraan', ['filter' => 'auth'], function($routes) {
$routes->get('/', 'KendaraanController::kendaraan');
$routes->get('create', 'KendaraanController::create');
$routes->post('store', 'KendaraanController::store');
$routes->get('edit/(:num)', 'KendaraanController::edit/$1');
$routes->post('update/(:num)', 'KendaraanController::update/$1');
$routes->delete('delete/(:num)', 'KendaraanController::delete/$1');
$routes->get('show/(:num)', 'KendaraanController::show/$1');
$routes->get('mobil', 'KendaraanController::mobil');
$routes->get('motor', 'KendaraanController::motor');
});
// Route untuk  kendaraan dinas


// Route untuk crud katgori
$routes->group('kategori', ['filter' => 'auth'], function($routes) {
$routes->get('/', 'SubKategoriController::index');
$routes->delete('delete/(:num)', 'SubKategoriController::delete/$1');
$routes->get('show/(:num)', 'SubKategoriController::show/$1');
$routes->get('create', 'SubKategoriController::create');
$routes->post('store', 'SubKategoriController::store');
$routes->get('edit/(:num)', 'SubKategoriController::edit/$1');
$routes->post('update/(:num)', 'SubKategoriController::update/$1');
$routes->post('delete/(:num)', 'SubKategoriController::delete/$1');
});



// Route untuk Data Aset
// $routes->get('/Barangmodal', 'BarangModalController::barangmodal');
// $routes->get('/baranghabispakai','BarangModalController::baranghabispakai');

//$routes->get('/Barangmodal/barangmodal', 'BarangModalController::barangmodal');
//$routes->post('detailbarangmodal/updateStatus/(:num)', 'BarangModalController::updateStatus/$1');
//$routes->get('detailbarangmodal/', 'BarangModalController::detailbarangmodal'); 
//$routes->get('detailbarangmodal/(:segment)', 'BarangModalController::detailbarangmodal/$1');
//$routes->delete('/detailbarangmodal/delete/(:num)', 'BarangModalController::deleteDetail/$1');
//$routes->get('Baranghabispakai/baranghabispakai', 'BarangHabisPakaiController::baranghabispakai');
//$routes->get('/Barangmodal', 'BarangModalController::barangmodal');

$routes->post('/barang/update/(:num)', 'BarangController::update/$1'); // Untuk Update Barang
$routes->get('/barangmodal', 'BarangController::barangModal'); // Untuk Barang Modal
$routes->get('/detailbarangmodal/(:segment)', 'BarangController::detailbarangmodal/$1'); // Untuk Detail Barang Modal
$routes->get('/barangmodal/edit/(:num)', 'BarangController::editBarangModal/$1'); // Untuk Edit Barang Modal
$routes->post('/barangmodal/update/(:num)', 'BarangController::updateBarangModal/$1'); // Untuk Update Barang Modal


$routes->get('/baranghabispakai', 'BarangController::baranghabispakai'); // Untuk Barang Habis Pakai
$routes->get('/detailbaranghabispakai/(:segment)', 'BarangController::detailbaranghabispakai/$1'); // Untuk Detail Barang Habis Pakai
$routes->get('/baranghabispakai/edit/(:num)', 'BarangController::editBarangHabisPakai/$1'); // Untuk Edit Barang Habis Pakai
$routes->post('/baranghabispakai/update/(:num)', 'BarangController::updateBarangHabisPakai/$1'); // Untuk Update Barang Habis Pakai


