<?= $this->extend('layouts/main'); ?>

<?= $this->section('content') ?> 
<div class="my-3 p-3 bg-body rounded shadow-sm">
  <div class="d-flex justify-content-between border-bottom py-2">
    <h3 class="pb-2 mb-0">Detail Barang Modal</h3>
    <a href="<?= base_url('/barangmodal') ?>" class="btn btn-primary">Kembali</a>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered table-striped">
        <thead class="bg-light">
          <tr>
            <th>No</th>
            <th>Nama Barang</th>
            <th>Kode Unik</th>
            <th>Harga</th>
            <th>Tanggal Masuk</th>
            <th>Status</th>
            <th>Nama Pengguna</th>
            <th>Lokasi</th>
            <th>Aksi</th>
          </tr>
        </thead>
        <tbody>
        <?php if (!empty($barang)) : ?>
            <?php foreach ($barang as $key => $asset) : ?>
              <tr>
                <td><?= $key + 1 + (10 * ($pager->getCurrentPage() - 1)) ?></td>
                <td><?= esc($asset['nama_barang']) ?></td>
                <td><?= esc($asset['kode_unik']) ?></td>
                <td><?= number_format($asset['harga_barang'], 2, ',', '.') ?></td>
                <td><?= esc($asset['tanggal_masuk']) ?></td>
                <td>
                  <span class="badge <?= $asset['status'] === 'tersedia' ? 'bg-success' : 'bg-secondary' ?>">
                    <?= esc($asset['status']) ?>
                  </span>
                </td>
                <td><?= esc($asset['nama_pengguna'] ?? '-') ?></td>
                <td><?= esc($asset['nama_lokasi'] ?? '-') ?></td>
                <td>
                    <a href="<?= base_url('/barangmodal/edit/' . $asset['id']) ?>" class="btn btn-sm btn-primary">update</a>
                </td>
              </tr>
            <?php endforeach; ?>
            <?php else : ?>
            <tr>
              <td colspan="9" class="text-center">Tidak ada data untuk sub kategori ini.</td>
            </tr>
          <?php endif; ?>
        </tbody>
      </table>
    </div>

    <!-- Pagination -->
    <div class="d-flex justify-content-end">
      <?= $pager->links('default', 'bootstrap_pagination') ?>
    </div>
  </div>
</div> 
<?= $this->endSection(); ?>
