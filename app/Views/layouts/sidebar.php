<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="<?= base_url('/dashboard') ?>" class="brand-link text-center">
    <span class="brand-text font-weight-light">Asset Kominfo</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

        <!-- Dashboard -->
        <li class="nav-item">
          <a href="<?= base_url('/dashboard') ?>" class="nav-link">
            <i class="nav-icon fas fa-tachometer-alt"></i>
            <p>Dashboard</p>
          </a>
        </li>

        <!-- Data Asset -->
        <li class="nav-item has-treeview">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-boxes"></i>
            <p>Data Asset<i class="right fas fa-angle-left"></i></p>
          </a>
          <ul class="nav nav-treeview pl-3">
            <li class="nav-item">
              <a href="<?= base_url('/barangmodal') ?>" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Barang Modal</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<?= base_url('/baranghabispakai') ?>" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Barang Habis Pakai</p>
              </a>
            </li>
          </ul>
        </li>

        <!-- Keputusan Pengadaan -->
        <li class="nav-item has-treeview">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-file-signature"></i>
            <p>Kendaraan Dinas<i class="right fas fa-angle-left"></i></p>
          </a>
          <ul class="nav nav-treeview pl-3">
            <li class="nav-item">
              <a href="<?= base_url('kendaraan/mobil') ?>" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Mobil</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<?= base_url('kendaraan/motor') ?>" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Motor</p>
              </a>
            </li>
          </ul>
        </li>

        
        <!-- Data Master -->
        <li class="nav-item has-treeview">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-database"></i>
            <p>Data Master<i class="right fas fa-angle-left"></i></p>
          </a>
          <ul class="nav nav-treeview pl-3">
            <li class="nav-item">
              <a href="<?= base_url('/kategori') ?>" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Kategori Asset</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<?= base_url('/asset') ?>" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Data Pengadaan Asset</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<?= base_url('/lokasi') ?>" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Lokasi</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<?= base_url('/pengguna') ?>" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>pengguna</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<?= base_url('/kendaraan') ?>" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Kendaraan</p>
              </a>
            </li>
          </ul>
        </li>

        <!-- Peminjaman -->
        <li class="nav-item">
          <a href="<?= base_url('/peminjaman') ?>" class="nav-link">
            <i class="nav-icon fas fa-handshake"></i>
            <p>Peminjaman</p>
          </a>
        </li>

        <!-- Pengaturan -->
        <li class="nav-item">
          <a href="<?= base_url('/pengaturan') ?>" class="nav-link">
            <i class="nav-icon fas fa-cog"></i>
            <p>Pengaturan</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="<?= base_url('/auth/logout') ?>" class="nav-link">
            <i class="nav-icon fas fa-sign-out-alt"></i>
            <p>Logout</p>
          </a>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>