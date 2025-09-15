<?= $this->extend('layouts/main'); ?>

<?= $this->section('content') ?>
<div class="my-3 p-3 bg-body rounded shadow-sm">
    <div class="d-flex justify-content-between border-bottom py-2">
        <h3 class="pb-2 mb-0">Data Asset</h3>
        <a href="/asset/create" class="btn btn-primary">Tambah Asset</a>
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
                    <th>Nama Barang</th>
                    <th>Kode Barang</th>
                    <th>Kategori</th>
                    <th>Sub Kategori</th>
                    <th>Deskripsi</th>
                    <th>Jumlah</th>
                    <th>Harga</th>
                    <th>Harga Total</th>
                    <th>Tanggal Masuk</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($assets)) : ?>
                    <?php foreach ($assets as $key => $asset) : ?>
                        <tr>
                            <td><?= $key + 1 + (10 * ($pager->getCurrentPage() - 1)) ?></td>
                            <td><?= esc($asset['nama_barang']) ?></td>
                            <td><?= esc($asset['kode_barang']) ?></td>
                            <td><?= esc($asset['kode_kategori']) ?></td>
                            <td><?= esc($asset['kode_sub_kategori']) ?> - <?= esc($asset['nama_sub_kategori']) ?></td>
                            <td><?= esc($asset['deskripsi_barang']) ?></td>
                            <td><?= esc($asset['jumlah_barang']) ?></td>
                            <td><?= number_format($asset['harga_barang'], 2, ',', '.') ?></td>
                            <td><?= number_format($asset['total_harga_barang'], 2, ',', '.') ?></td>
                            <td><?= esc($asset['tanggal_masuk']) ?></td>
                            <td>
                                <a href="/asset/show/<?= $asset['id'] ?>" class="btn btn-info btn-sm">Detail</a>
                                <a href="/asset/edit/<?= $asset['id'] ?>" class="btn btn-warning btn-sm">Edit</a>
                                
                                <form action="/asset/delete/<?= $asset['id'] ?>" method="post" class="d-inline form-delete">
                                    <?= csrf_field() ?>
                                    <input type="hidden" name="_method" value="DELETE">
                                    <button type="submit" class="btn btn-danger btn-sm">Hapus</button>
                                </form>

                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else : ?>
                    <tr>
                        <td colspan="11" class="text-center">Tidak ada data</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>

        <!-- Paginasi -->
        <div class="d-flex justify-content-end">
            <?= $pager->links('default', 'bootstrap_pagination') ?>
        </div>

    </div>
</div>

<!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    // SweetAlert untuk konfirmasi hapus
    document.querySelectorAll('.form-delete').forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault(); // Mencegah submit langsung
            Swal.fire({
                title: 'Yakin ingin menghapus?',
                text: "Data yang dihapus tidak bisa dikembalikan!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Ya, hapus!'
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                }
            })
        });
    });

    // SweetAlert untuk flash message
    const flashMessage = document.getElementById('flash-message');
    if (flashMessage) {
        const message = flashMessage.getAttribute('data-message');
        const type = flashMessage.getAttribute('data-type');

        Swal.fire({
            toast: true,
            position: 'top-end',
            icon: type,
            title: message,
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
        });
    }
</script>
<?= $this->endSection() ?>
