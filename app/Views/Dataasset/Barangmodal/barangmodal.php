<?= $this->extend('layouts/main'); ?>
<?= $this->section('content') ?>

<div class="my-3 p-3 bg-body rounded shadow-sm">
  <h3 class="pb-2 mb-3">Pilih Sub Kategori Barang  Modal</h3>

  <div class="row">
    <?php if (!empty($sub_kategori)) : ?>
      <?php foreach ($sub_kategori as $sub) : ?>
        <div class="col-md-4 mb-4">
          <a href="<?= base_url('detailbarangmodal/' . $sub['kode_sub_kategori']) ?>" class="text-decoration-none">
            <div class="card h-100 shadow-sm">
              <div class="card-body">
                <h5 class="card-title"><?= esc($sub['nama_sub_kategori']) ?></h5>
                <p class="card-text text-muted mb-0">
                  Kode: <?= esc($sub['kode_sub_kategori']) ?>
                </p>
                <p class="card-text" >
                  Kategori: <?= esc($sub['nama_kategori']) ?>
                </p> 
              </div>
            </div>
          </a>
        </div>
      <?php endforeach; ?>
    <?php else : ?>
      <div class="col-12">
        <div class="alert alert-warning text-center">
          Tidak ada data sub kategori yang tersedia.
        </div>
      </div>
    <?php endif; ?>
  </div>
</div>

<?= $this->endSection(); ?>