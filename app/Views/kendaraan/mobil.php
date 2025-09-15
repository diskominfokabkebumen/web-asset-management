<?= $this->extend('layouts/main'); ?>
<?= $this->section('content'); ?>

<div class="my-3 p-3 bg-body rounded shadow-sm">
    <h3 class="pb-2 mb-3">Data Kendaraan - Mobil</h3>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Kendaraan</th>
                <th>No Polisi</th>
                <th>Pengguna</th>
                <th>Warna</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php if (!empty($kendaraan)) : ?>
                <?php foreach ($kendaraan as $key => $row) : ?>
                    <tr>
                        <td><?= $key + 1 ?></td>
                        <td><?= esc($row['nama_kendaraan']) ?></td>
                        <td><?= esc($row['no_polisi']) ?></td>
                        <td><?= esc($row['id_pengguna']) ?></td>
                        <td><?= esc($row['warna']) ?></td>
                        <td>
                            <a href="/kendaraan/edit/<?= $row['id'] ?>" class="btn btn-warning btn-sm">Edit</a>
                            <form action="/kendaraan/delete/<?= $row['id'] ?>" method="post" class="d-inline">
                                <?= csrf_field() ?>
                                <input type="hidden" name="_method" value="DELETE">
                                <button type="submit" class="btn btn-danger btn-sm">Hapus</button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            <?php else : ?>
                <tr>
                    <td colspan="6" class="text-center">Tidak ada data kendaraan mobil.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>

<?= $this->endSection(); ?>