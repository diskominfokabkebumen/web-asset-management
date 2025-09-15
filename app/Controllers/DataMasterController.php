<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class DataMasterController extends BaseController
{

    //  kategori
    public function kategori()  {
        return view('Datamaster/kategori/kategori');
    }
    public function createkategori()
    {
        return view('Datamaster/kategori/createkategori');
    }
    //asset
    public function Asset() {
        return view('Datamaster/asset/asset');   
    }
    public function Lokasi()  {
        return view('Datamaster/lokasi/lokasi');
    }
    public function User() {
        return view('Datamaster/user/user');
    }

    public function baranghabispakai() {
        return view('Dataasset/Baranghabispakai/baranghabispakai');
    }
    public function Barangmodal() {
        return view('Dataasset/Barangmodal/barangmodal');   
    }
}
