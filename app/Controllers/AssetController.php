<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\AssetModel;
use App\Models\SubKategoriModel;
use App\Models\KategoriModel;
use CodeIgniter\HTTP\ResponseInterface;
use Config\Database;

class AssetController extends BaseController
{
    protected $modelAsset;

    public function __construct()
    {
        $this->modelAsset = new AssetModel();
    }

    public function index()
    {
        $data = [
            'assets' => $this->modelAsset->getAssetWithKategoriPaginated(10),
            'pager'  => $this->modelAsset->pager,
        ];
        return view('Datamaster/asset/asset', $data);
    }

    public function show($id)
    {
        $data['asset'] = $this->modelAsset->getAssetWithKategoriWhere($id);
        return view('Datamaster/asset/detailasset', $data);
    }

    public function create()
    {
        $modelSubKategori = new SubKategoriModel();
        $modelKategori = new KategoriModel();

        $data['sub_kategori'] = $modelSubKategori->findAll();
        $data['kategori'] = $modelKategori->findAll();

        return view('Datamaster/asset/createasset', $data);
    }
    private function generateKodeAsset()
    {
        // Ambil asset terakhir berdasarkan kode_barang
        $lastAsset = $this->modelAsset
            ->orderBy('kode_barang', 'DESC')
            ->first();

        if ($lastAsset) {
            // Ambil angka dari kode terakhir: KSK01 => 1
            $lastNumber = (int) str_replace('KB', '', $lastAsset['kode_barang']);
            $newNumber = $lastNumber + 1;
        } else {
            $newNumber = 1;
        }

        return 'KB' . str_pad($newNumber, 2, '0', STR_PAD_LEFT);
    }
    public function store()
    {
        $jumlah = $this->request->getPost('jumlah_barang');
        $harga = $this->request->getPost('harga_barang');
        $totalHarga = $jumlah * $harga;

        $data = [
            'kode_kategori' => $this->request->getPost('kode_kategori'),
            'kode_barang' => $this->generateKodeAsset(),
            'kode_sub_kategori' => $this->request->getPost('kode_sub_kategori'),
            'nama_barang' => $this->request->getPost('nama_barang'),
            'deskripsi_barang' => $this->request->getPost('deskripsi_barang'),
            'jumlah_barang' => $jumlah,
            'harga_barang' => $harga,
            'total_harga_barang' => $totalHarga,
            'tanggal_masuk' => $this->request->getPost('tanggal_masuk'),
        ];

        // Simpan ke tabel asset
        $this->modelAsset->save($data);
        $idAsset = $this->modelAsset->getInsertID();

        // Ambil variabel yang dibutuhkan untuk kode unik
        $kodeBarang = $data['kode_barang'];
        $kodeKategori = $data['kode_kategori'];
        $kodeSubKategori = $data['kode_sub_kategori'];
        $tanggalMasuk = $data['tanggal_masuk'];

        // Simpan item barang ke tabel barang
        $db = Database::connect();

        for ($i = 0; $i < $jumlah; $i++) {
            $kodeUnik = $kodeBarang . '-' . $kodeKategori . '-' . $kodeSubKategori . '-' . $tanggalMasuk . '-' . str_pad($i + 1, 4, '0', STR_PAD_LEFT);

            $db->table('barang')->insert([
                'id_asset' => $idAsset,
                'nama_barang' => $data['nama_barang'],
                'kode_unik' => $kodeUnik,
                'harga_barang' => $harga,
                'tanggal_masuk' => $tanggalMasuk,
                'status' => 'tersedia',
            ]);
        }

        return redirect()->to('/asset')->with('message', 'Data asset dan barang berhasil disimpan');
    }

    public function edit($id)
    {
        $modelSubKategori = new SubKategoriModel();
        $modelKategori = new KategoriModel();

        $data['sub_kategori'] = $modelSubKategori->findAll();
        $data['kategori'] = $modelKategori->findAll();
        $data['asset'] = $this->modelAsset->getAssetWithKategoriWhere($id);

        return view('Datamaster/asset/editasset', $data);
    }

    public function update($id)
    {
        $jumlah = $this->request->getPost('jumlah_barang');
        $harga = $this->request->getPost('harga_barang');
        $totalHarga = $jumlah * $harga;
    
        // Ambil data lama sebelum update
        $assetLama = $this->modelAsset->find($id);
        $jumlahLama = $assetLama['jumlah_barang'];
    
        $data = [
            'id'                 => $id,
            'kode_kategori'      => $this->request->getPost('kode_kategori'),
            'kode_sub_kategori'  => $this->request->getPost('kode_sub_kategori'),
            'nama_barang'        => $this->request->getPost('nama_barang'),
            'kode_barang'        => $this->request->getPost('kode_barang'),
            'deskripsi_barang'   => $this->request->getPost('deskripsi_barang'),
            'jumlah_barang'      => $jumlah,
            'harga_barang'       => $harga,
            'total_harga_barang' => $totalHarga,
            'tanggal_masuk'      => $this->request->getPost('tanggal_masuk')
        ];
    
        $this->modelAsset->update($id, $data);
    
        // Proses barang
        $delta = $jumlah - $jumlahLama;
        $barangModel = new \App\Models\BarangModel();
    
        if ($delta > 0) {
            for ($i = 0; $i < $delta; $i++) {
                $barangModel->save([
                    'id_asset' => $id,
                    'status' => 'Tersedia',
                    'harga_barang' => $harga,
                    'tanggal_masuk' => $data['tanggal_masuk'],
                ]);
            }
        } elseif ($delta < 0) {
            $barangUntukDihapus = $barangModel->where('id_asset', $id)
                                              ->where('status', 'Tersedia')
                                              ->limit(abs($delta))
                                              ->findAll();
    
            foreach ($barangUntukDihapus as $barang) {
                $barangModel->delete($barang['id']);
            }
        }
    
        return redirect()->to('/asset')->with('message', 'Data berhasil diupdate');
    }
    

    public function delete($id)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('barang');
    
        // Cek apakah ada barang yang terkait dengan asset ini
        $related = $builder->where('id_asset', $id)->countAllResults();
    
        if ($related > 0) {
            // Ada data terkait, tidak boleh hapus
            return redirect()->to('/asset')->with('error', 'Tidak bisa menghapus data, masih ada barang terkait. Hapus dulu data barang.');
        }
    
        // Kalau tidak ada data terkait, aman hapus
        $this->modelAsset->delete($id);
    
        return redirect()->to('/asset')->with('message', 'Data asset berhasil dihapus.');
    }
    
}
