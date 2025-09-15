<?= $this->extend('layouts/main'); ?>

<?= $this->section('content') ?>
<div class="my-3 p-3 bg-body rounded shadow-sm">
    <h3 class="border-bottom pb-2 mb-3">Detail Asset</h3>
    <table class="table table-bordered">
        <tr>
            <th>Nama Asset</th>
            <td><?= $asset['nama_barang'] ?></td>
        </tr>
        <tr>
            <th>Kategori</th>
            <td><?= $asset['kode_kategori'] ?></td> 
        <tr>
            <th>Sub Kategori</th>
            <td><?= $asset['kode_sub_kategori'] ?></td>
        </tr>
        <tr>
            <th>Deskripsi</th>
            <td><?= $asset['deskripsi_barang'] ?></td>
        </tr>
        <tr>
            <th>Jumlah</th>
            <td><?= $asset['jumlah_barang'] ?></td>
        </tr>
        <tr>
            <th>Harga</th>
            <td><?= number_format($asset['harga_barang'], 2, ',', '.') ?></td>
        </tr>
        <tr>
            <th>Total Harga</th>
            <td><?= number_format($asset['total_harga_barang'], 2, ',', '.') ?></td>
        </tr>
        <tr>
            <th>Tanggal Masuk</th>
            <td><?= $asset['tanggal_masuk'] ?></td>
        </tr>
    </table>
    <a href="/asset" class="btn btn-secondary">Kembali</a>
</div>
<?= $this->endSection() ?>