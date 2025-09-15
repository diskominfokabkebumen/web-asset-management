<?= $this ->extend('layouts/main'); ?>

<?= $this->section('content') ?>
<div class="my-3 p-3 bg-body rounded shadow-sm">
    <div class="d-flex justify-content-between border-bottom py-2">
        <h3 class="pb-2 mb-0">Data Kendaraan</h3>
        <a href="/kendaraan/create" class="btn btn-primary">Tambah Kendaraan</a>
    </div>

    <div class="pt-3">

        <!-- Tempat untuk notifikasi success/error -->
        <?php if (session()->getFlashdata('message')) : ?>
            <div id="flash-message" data-message="<?= session()->getFlashdata('message') ?>" data-type="success"></div>
        <?php endif; ?>

        <?php if (session()->getFlashdata('error')) : ?>
            <div id="flash-message" data-message="<?= session()->getFlashdata('error') ?>" data-type="error"></div>
        <?php endif; ?>

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>No</th>
                    <th>No Polisi</th> 
                    <th>Nama Kendaraan</th>
                    <th>Warna</th>
                    <th>Merk</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($kendaraan)) : ?>
                    <?php foreach ($kendaraan as $key => $ken) : ?>
                        <tr>
                            <td><?= $key + 1 + (10 * ($pager->getCurrentPage() - 1)) ?></td>
                            <td><?= esc($ken['no_polisi']) ?></td>
                            <td><?= esc($ken['nama_kendaraan']) ?></td>
                            <td><?= esc($ken['warna']) ?></td>
                            <td><?= esc($ken['merk_kendaraan']) ?></td>
                            <td>
                                <a href="/kendaraan/show/<?= $ken['id'] ?>" class="btn btn-info btn-sm">Detail</a>
                                <a href="/kendaraan/edit/<?= $ken['id'] ?>" class="btn btn-warning btn-sm">Edit</a>
                                <form action="/kendaraan/delete/<?= $ken['id'] ?>" method="post" class="d-inline form-delete">
                                    <?= csrf_field() ?>
                                    <input type="hidden" name="_method" value="DELETE">
                                    <button type="submit" class="btn btn-danger btn-sm">Hapus</button>
                                </form>
                            </td>

                        </tr>
                    <?php endforeach; ?>
                <?php else : ?>
                    <tr>
                        <td colspan="10" class="text-center">Tidak ada data kendaraan</td>
                    </tr>

                <?php endif; ?>
            </tbody>
        </table>
        <div class="d-flex justify-content-end">
            <?= $pager->links('default', 'bootstrap_pagination') ?>
        </div>
    </div>
    
</div>




<?= $this->endSection() ?>