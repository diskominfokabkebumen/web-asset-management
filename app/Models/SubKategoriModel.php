<?php

namespace App\Models;

use CodeIgniter\Model;

class SubKategoriModel extends Model
{
    protected $table            = 'sub_kategori';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['kode_kategori', 'kode_sub_kategori', 'nama_sub_kategori', 'deskripsi_sub_kategori'];

   public function getSubKategoriWithKategori($kategori)
    {
        return $this->select('sub_kategori.*, kategori.nama_kategori, kategori.kode_kategori')
                    ->join('kategori', 'kategori.kode_kategori = sub_kategori.kode_kategori')
                    ->where('kategori.nama_kategori', $kategori) 
                    ->findAll();
                    
    }
    

    
}

