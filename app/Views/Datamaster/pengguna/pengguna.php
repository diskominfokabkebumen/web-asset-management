<?= $this->extend('layouts/main'); ?>

<?php $this->section('content'); ?>

<div class="my-3 p-3 bg-body rounded shadow-sm">
<div class="d-flex justify-content-between border-bottom py-2">
    <h3 class="pb-2 mb-0">Data pengguna Asset</h3>
    <a href="<?= base_url('pengguna/create') ?>" class="btn btn-primary">Tambah Data</a>
</div>

<div class="pt-3">
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama pengguna</th>
                <th>No NIP</th>
                <th>No Telepon</th>
                <th>Unit Kerja</th>
                <th>Alamat</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php if (!empty($pengguna)) : ?>
                <?php foreach ($pengguna as $key => $peng) : ?>
                    <tr>
                        <td><?= $key + 1 + (10 * ($pager->getCurrentPage() - 1)) ?></td>
                        <td><?= $peng['nama_pengguna'] ?></td>
                        <td><?= $peng['nip'] ?></td>
                        <td><?= $peng['no_hp'] ?></td> 
                        <td><?= $peng['nama_lokasi'] ?></td>
                        <td><?= $peng['alamat'] ?></td>
                        <td>
                            <a href="/pengguna/edit/<?= $peng['id'] ?>" class="btn btn-warning btn-sm">Edit</a>
                            <form action="/pengguna/delete/<?= $peng['id'] ?>" method="post" class="d-inline">
                                <?= csrf_field() ?>
                                <input type="hidden" name="_method" value="DELETE">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Apakah Anda yakin ingin menghapus data ini?')">Hapus</button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            <?php else : ?>
                <tr>
                    <td colspan="7" class="text-center">Tidak ada data pengguna.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <!-- Pagination -->
    <div class="d-flex justify-content-center">
        <?= $pager->links('pengguna', 'bootstrap_pagination') ?>
    </div>
</div>
</div>

<?= $this->endSection(); ?>
