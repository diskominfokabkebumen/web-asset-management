<?= $this ->extend('layouts/main'); ?>

<?= $this->section('content') ?>
<div class="my-3 p-3 bg-body rounded shadow-sm">
    <h3 class="border-bottom pb-2 mb-3">Detail Kategori</h3>
    <table class="table table-bordered">
        <tr>
            <th>Kode Kategori</th>
            <td><?= $sub_kategori['kode_kategori'] ?></td>
        </tr>
        <tr>
            <th>Kode Sub Kategori</th>
            <td><?= $sub_kategori['kode_sub_kategori'] ?></td>
        </tr>
        <tr>
            <th>Nama Kategori</th>
            <td><?= $sub_kategori['nama_sub_kategori'] ?></td>
        </tr>
        <tr>
            <th>Deskripsi</th>
            <td><?= $sub_kategori['deskripsi_sub_kategori'] ?></td>
       
    </table>
    <a href="/kategori" class="btn btn-secondary">Kembali</a>
</div>

<?= $this->endSection() ?>
