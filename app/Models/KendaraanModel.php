<?php

namespace App\Models;

use CodeIgniter\Model;

class KendaraanModel extends Model
{
    protected $table            = 'kendaraan';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['id_pengguna', 'nama_kendaraan', 'no_polisi','nomor_polisi_sebelumnya', 'warna', 'model_kendaraan', 'merk_kendaraan', 'tipe_kendaraan', 'harga', 'tahun_kendaraan', 'no_rangka', 'no_stnk', 'no_mesin', 'no_bpkb', 'pembayaran_pajak', 'masa_berlaku'];

    public function getKendaraanWithPengguna()
    {
        return $this->select('kendaraan.*, pengguna.nama_pengguna, pengguna.nip, pengguna.no_hp, pengguna.alamat')
                    ->join('pengguna', 'pengguna.id = kendaraan.id_pengguna', 'left');
    }
    
    
}
