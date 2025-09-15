<?php

namespace App\Controllers;
use App\Models\PenggunaModel;
use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class KendaraanController extends BaseController
{
    public function kendaraan()
    {
        $model = model('KendaraanModel');
        $data['kendaraan'] = $model->getKendaraanWithPengguna()->paginate(10);
        $data['pager'] = $model->pager;
        return view('Datamaster/kendaraan/kendaraan', $data);
    }
    public function create()
{
    // Memuat model kendaraan dan pengguna
    $kendaraanModel = model('KendaraanModel');
    $penggunaModel = model('PenggunaModel');
    
    // Mengambil data pengguna
    $data['pengguna'] = $penggunaModel->findAll();  // Ambil semua data pengguna
    
    // Kirim data pengguna ke view
    return view('Datamaster/kendaraan/createkendaraan', $data);
}


    public function store()
    {
        $penggunaModel = model('PenggunaModel');
        $model = model('KendaraanModel');
        $data = [
            'id_pengguna' => $this->request->getPost('id_pengguna'),
            'nama_kendaraan' => $this->request->getPost('nama_kendaraan'),
            'no_polisi' => $this->request->getPost('no_polisi'),
            'nomor_polisi_sebelumnya' => $this->request->getPost('nomor_polisi_sebelumnya'),
            'model_kendaraan' => $this->request->getPost('model_kendaraan'),
            'warna' => $this->request->getPost('warna'),
            'merk_kendaraan' => $this->request->getPost('merk_kendaraan'),
            'tipe_kendaraan' => $this->request->getPost('tipe_kendaraan'),
            'harga' => $this->request->getPost('harga'),
            'tahun_kendaraan' => $this->request->getPost('tahun_kendaraan'),
            'no_rangka' => $this->request->getPost('no_rangka'),
            'no_mesin' => $this->request->getPost('no_mesin'),
            'no_bpkb' => $this->request->getPost('no_bpkb'),
            'no_stnk' => $this->request->getPost('no_stnk'),
            'pembayaran_pajak' => $this->request->getPost('pembayaran_pajak'),
            'masa_berlaku' => $this->request->getPost('masa_berlaku')
        ];

        if ($model->insert($data)) {
            return redirect()->to('/kendaraan')->with('success', 'Data kendaraan berhasil ditambahkan.');
        } else {
            return redirect()->back()->withInput()->with('error', 'Gagal menambahkan data kendaraan.');
        }
    }

    public function edit($id)
    {
        $model = model('KendaraanModel');
        $penggunaModel = model('PenggunaModel');
        
        // Mengambil data kendaraan berdasarkan ID
        $data['kendaraan'] = $model->find($id);
        
        // Mengambil data pengguna
        $data['pengguna'] = $penggunaModel->findAll();  // Ambil semua data pengguna
        
        return view('Datamaster/kendaraan/editkendaraan', $data);
    }
    public function update($id)
    {
        $model = model('KendaraanModel');
        $data = [
            'id_pengguna' => $this->request->getPost('id_pengguna'),
            'nama_kendaraan' => $this->request->getPost('nama_kendaraan'),
            'no_polisi' => $this->request->getPost('no_polisi'),
            'nomor_polisi_sebelumnya' => $this->request->getPost('nomor_polisi_sebelumnya'),
            'model_kendaraan' => $this->request->getPost('model_kendaraan'),
            'warna' => $this->request->getPost('warna'),
            'merk_kendaraan' => $this->request->getPost('merk_kendaraan'),
            'tipe_kendaraan' => $this->request->getPost('tipe_kendaraan'),
            'harga' => $this->request->getPost('harga'),
            'tahun_kendaraan' => $this->request->getPost('tahun_kendaraan'),
            'no_rangka' => $this->request->getPost('no_rangka'),
            'no_mesin' => $this->request->getPost('no_mesin'),
            'no_bpkb' => $this->request->getPost('no_bpkb'),
            'no_stnk' => $this->request->getPost('no_stnk'),
            'pembayaran_pajak' => $this->request->getPost('pembayaran_pajak'),
            'masa_berlaku' => $this->request->getPost('masa_berlaku')
           

        ];

        if ($model->update($id, $data)) {
            return redirect()->to('/kendaraan')->with('success', 'Data kendaraan berhasil diperbarui.');
        } else {
            return redirect()->back()->withInput()->with('error', 'Gagal memperbarui data kendaraan.');
        }
    }

    public function show($id)
    {
        $model = model('KendaraanModel');
        
        // Ambil satu kendaraan + pengguna-nya berdasarkan ID
        $data['kendaraan'] = $model->getKendaraanWithPengguna()
                                    ->where('kendaraan.id', $id)
                                    ->first();
    
        // Cek jika data tidak ditemukan
        if (!$data['kendaraan']) {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound("Kendaraan dengan ID $id tidak ditemukan");
        }
    
        return view('Datamaster/kendaraan/detailkendaraan', $data);
    }
    
    public function delete($id)
    {
        $model = model('KendaraanModel');
        if ($model->delete($id)) {
            return redirect()->to('/kendaraan')->with('success', 'Data kendaraan berhasil dihapus.');
        } else {
            return redirect()->back()->with('error', 'Gagal menghapus data kendaraan.');
        }
    }

    public function mobil()
    {
        $model = model('KendaraanModel');
        $data['kendaraan'] = $model->getKendaraanWithPengguna()->where('model_kendaraan', 'mobil')->paginate(10);
        $data['pager'] = $model->pager;
        return view('kendaraan/mobil', $data);
    }

    public function motor()
    {
        $model = model('KendaraanModel');
        $data['kendaraan'] = $model->getKendaraanWithPengguna()->where('model_kendaraan', 'motor')->paginate(10);
        $data['pager'] = $model->pager;
        return view('kendaraan/motor', $data);
    }
    
    
}
