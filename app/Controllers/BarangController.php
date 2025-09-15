<?php

namespace App\Controllers;

use App\Models\SubKategoriModel;
use App\Models\BarangModel;
use App\Controllers\BaseController;

class BarangController extends BaseController
{
    public function barangModal()
    {
        $subKategoriModel = new SubKategoriModel();

        // Ambil data sub kategori untuk Barang Modal
        $data['sub_kategori'] = $subKategoriModel->getSubKategoriWithKategori('Barang Modal');

        return view('Dataasset/Barangmodal/barangmodal', $data);
    }

    public function detailBarangModal($kode_sub_kategori)
    {
        $barangModel = new BarangModel();

        // Ambil data barang dengan pagination
        $barangWithAssetLocationPengguna = $barangModel->select('barang.*, asset.kode_barang, asset.nama_barang, asset.kode_kategori, asset.kode_sub_kategori, pengguna.nama_pengguna, lokasi.nama_lokasi')
                                       ->join('asset', 'asset.id = barang.id_asset')
                                       ->join('pengguna', 'pengguna.id = barang.id_pengguna', 'left')
                                       ->join('lokasi', 'lokasi.id = barang.id_lokasi', 'left')
                                       ->where('asset.kode_sub_kategori', $kode_sub_kategori)
                                       ->orderBy('asset.nama_barang', 'ASC')
                                       ->paginate(10);

        $data = [
            'barang' => $barangWithAssetLocationPengguna,
            'kode_sub_kategori' => $kode_sub_kategori,
            'pager' => $barangModel->pager,
           
        ];

        return view('Dataasset/Barangmodal/detailbarangmodal', $data);
    }

    public function editBarangModal($id) 
{
    $barangModel = new BarangModel();
    $lokasiModel = new \App\Models\LokasiModel();
    $penggunaModel = new \App\Models\PenggunaModel();

    $barang = $barangModel->select('barang.*, asset.kode_sub_kategori')
                          ->join('asset', 'asset.id = barang.id_asset')
                          ->where('barang.id', $id)
                          ->first();

    if (!$barang) {
        return redirect()->to('/barangmodal')->with('error', 'Data tidak ditemukan.');
    }

    $data = [
        'barang' => $barang,
        'lokasi' => $lokasiModel->findAll(),
        'pengguna' => $penggunaModel->findAll(),
    ];
    
    return view('Dataasset/Barangmodal/editbarangmodal', $data);
}
    public function updateBarangModal($id)
    {
        $barangModel = new BarangModel();
    
        // Validasi input   
        $this->validate([
            'status' => 'required',
            'id_lokasi' => 'required',
            'id_pengguna' => 'required',

        ]);
    
        // Ambil data barang berdasarkan ID
        $barang = $barangModel->select('barang.*, asset.kode_sub_kategori')
                              ->join('asset', 'asset.id = barang.id_asset')
                              ->where('barang.id', $id)
                              ->first();
    
        if (!$barang) {
            return redirect()->to('/barangmodal')->with('error', 'Data barang tidak ditemukan.');
        }
    
        // Data yang akan diupdate
        $data = [
            'status' => $this->request->getPost('status'),
            'id_lokasi' => $this->request->getPost('id_lokasi'),
            'id_pengguna' => $this->request->getPost('id_pengguna'),
        ];
    
        $barangModel->update($id, $data);
    
        // Redirect ke detailbarangmodal/{kode_sub_kategori}
        return redirect()->to('/detailbarangmodal/' . $barang['kode_sub_kategori'])->with('success', 'Data barang berhasil diperbarui.');
    }
    public function barangHabisPakai()
    {
        $subKategoriModel = new SubKategoriModel();

        // Ambil data sub kategori untuk Barang Habis Pakai
        $data['sub_kategori'] = $subKategoriModel->getSubKategoriWithKategori('Habis Pakai');

        return view('Dataasset/Baranghabispakai/baranghabispakai', $data);
    }

    public function detailBarangHabisPakai($kode_sub_kategori)
    {
        $barangModel = new BarangModel();

        // Ambil data barang dengan pagination
        $barangWithAssetLocationPengguna = $barangModel->select('barang.*, asset.kode_barang, asset.nama_barang, asset.kode_kategori, asset.kode_sub_kategori, pengguna.nama_pengguna, lokasi.nama_lokasi')
                                       ->join('asset', 'asset.id = barang.id_asset')
                                       ->join('pengguna', 'pengguna.id = barang.id_pengguna', 'left')
                                       ->join('lokasi', 'lokasi.id = barang.id_lokasi', 'left')
                                       ->where('asset.kode_sub_kategori', $kode_sub_kategori)
                                       ->orderBy('asset.nama_barang', 'ASC')
                                       ->paginate(10);

        $data = [
            'barang' => $barangWithAssetLocationPengguna,
            'kode_sub_kategori' => $kode_sub_kategori,
            'pager' => $barangModel->pager

        ];

        return view('Dataasset/Baranghabispakai/detailbaranghabispakai', $data);
    }

    public function editBarangHabisPakai($id) 
    {
        $barangModel = new BarangModel();
        $lokasiModel = new \App\Models\LokasiModel();
        $penggunaModel = new \App\Models\PenggunaModel();

        // Ambil data barang berdasarkan ID
        $barang = $barangModel->select('barang.*, asset.kode_sub_kategori')
                              ->join('asset', 'asset.id = barang.id_asset')
                              ->where('barang.id', $id)
                              ->first();

        // Ambil data barang , lokasi dan pengguna
        $data = [
            'barang' => $barang,
            'lokasi' => $lokasiModel->findAll(),
            'pengguna' => $penggunaModel->findAll(),
        ];
        return view('Dataasset/Baranghabispakai/editbaranghabispakai', $data);
    }

    public function updateBarangHabisPakai($id)
    {
        $barangModel = new BarangModel();
    
        // Validasi input   
        $this->validate([
            'status' => 'required',
            'id_lokasi' => 'required',
            'id_pengguna' => 'required',
        ]);
    
        // Ambil data barang berdasarkan ID
        $barang = $barangModel->select('barang.*, asset.kode_sub_kategori')
                              ->join('asset', 'asset.id = barang.id_asset')
                              ->where('barang.id', $id)
                              ->first();
    
        if (!$barang) {
            return redirect()->to('/baranghabispakai')->with('error', 'Data barang tidak ditemukan.');
        }
    
        // Data yang akan diupdate
        $data = [
            'status' => $this->request->getPost('status'),
            'id_lokasi' => $this->request->getPost('id_lokasi'),
            'id_pengguna' => $this->request->getPost('id_pengguna'),
        ];
    
        $barangModel->update($id, $data);
    
        // Redirect ke detailbarangmodal/{kode_sub_kategori}
        return redirect()->to('/detailbaranghabispakai/' . $barang['kode_sub_kategori'])->with('success', 'Data barang berhasil diperbarui.');
    }
}
