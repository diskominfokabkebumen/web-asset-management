<?= $this->extend('layouts/main'); ?>

<?= $this->section('content') ?>
<div class="my-3 p-3 bg-body rounded shadow-sm">
    <h3 class="border-bottom pb-2 mb-3">Edit Barang Habis Pakai</h3>

    <form action="<?= base_url('/baranghabispakai/update/' . $barang['id']) ?>" method="post">
        <?= csrf_field() ?>

        <div class="form-group mb-3">
            <label for="status" class="form-label">Status</label>
            <select name="status" id="status" class="form-control" required>
                <option value="tersedia" <?= $barang['status'] === 'tersedia' ? 'selected' : '' ?>>Tersedia</option>
                <option value="habis terpakai" <?= $barang['status'] === 'habis terpakai' ? 'selected' : '' ?>>Habis Terpakai</option>
                <option value="terpakai" <?= $barang['status'] === 'terpakai' ? 'selected' : '' ?>>Di Pakai</option>
            </select>
        </div>

        <div class="form-group mb-3">
            <label for="id_lokasi" class="form-label">Lokasi</label>
            <select name="id_lokasi" id="id_lokasi" class="form-control" required>
                <option value="">Pilih Lokasi</option>
                <?php foreach ($lokasi as $loc) : ?>
                    <option value="<?= $loc['id'] ?>" <?= $loc['id'] == $barang['id_lokasi'] ? 'selected' : '' ?>>
                        <?= esc($loc['nama_lokasi']) ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>

        <div class="form-group mb-3">
            <label for="id_pengguna" class="form-label">Pengguna</label>
            <select name="id_pengguna" id="id_pengguna" class="form-control" required>
                <option value="">Pilih Pengguna</option>
                <?php foreach ($pengguna as $user) : ?>
                    <option value="<?= $user['id'] ?>" <?= $user['id'] == $barang['id_pengguna'] ? 'selected' : '' ?>>
                        <?= esc($user['nama_pengguna']) ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Simpan</button>
        <a href="<?= base_url('/detailbaranghabispakai/' . $barang['kode_sub_kategori']) ?>" class="btn btn-primary">Kembali</a>
        </form>
    </form>
</div>
<?= $this->endSection() ?>
