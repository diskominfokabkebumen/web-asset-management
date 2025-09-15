<?php

namespace App\Models;

use CodeIgniter\Model;

class BarangModel extends Model
{
    protected $table            = 'barang';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        'id_asset',
        'nama_barang',
        'kode_unik',
        'harga_barang',
        'tanggal_masuk',
        'status',
        'id_pengguna',
        'id_lokasi',
    ];

    // Fungsi untuk mendapatkan data barang beserta informasi asset, pengguna, dan lokasi
    public function getBarangWithAssetLocationPenggunaBySubKategori($kode_sub_kategori)
    {
        return $this->select('barang.*, asset.kode_barang, asset.nama_barang, asset.kode_kategori, asset.kode_sub_kategori, pengguna.nama_pengguna, lokasi.nama_lokasi')
                    ->join('asset', 'asset.id = barang.id_asset')
                    ->join('pengguna', 'pengguna.id = barang.id_pengguna', 'left')
                    ->join('lokasi', 'lokasi.id = barang.id_lokasi', 'left')
                    ->where('asset.kode_sub_kategori', $kode_sub_kategori)
                    ->orderBy('asset.nama_barang', 'ASC')
                    ->paginate(10);
    }
}
