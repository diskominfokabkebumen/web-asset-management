<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\KategoriModel;
use App\Models\SubKategoriModel;

class KategoriController extends BaseController
{
    protected $kategoriModel;
    protected $subKategoriModel;

    public function __construct()
    {
        $this->kategoriModel = new KategoriModel();
        $this->subKategoriModel = new SubKategoriModel();
    }

    public function index()
    {
        $dataPerPage = 10;

        $data = [
            'sub_kategori' => $this->subKategoriModel->getWithKategori()->paginate($dataPerPage),
            'pager' => $this->subKategoriModel->pager
        ];

        return view('Datamaster/kategori/kategori', $data);
    }
}
