<?php
// 1. Koneksi ke Database
$conn = mysqli_connect("localhost", "root", "", "db_umkm_kpad");

// 2. Tangkap ID UMKM yang mau diedit dari URL
if (!isset($_GET['id'])) {
    header("Location: umkm_kpad.php");
    exit;
}

$id_umkm = $_GET['id'];

// 3. Ambil data lama dari database berdasarkan ID
$result = mysqli_query($conn, "SELECT * FROM UMKM WHERE id_umkm = '$id_umkm'");
$data = mysqli_fetch_assoc($result);

// Jika data tidak ditemukan di database, kembalikan ke dashboard
if (!$data) {
    header("Location: umkm_kpad.php");
    exit;
}

// 4. PROSES UPDATE (Ketika tombol "Simpan Perubahan" diklik)
if (isset($_POST['update'])) {
    $nama_umkm        = mysqli_real_escape_string($conn, $_POST['nama_umkm']);
    $status_halal     = mysqli_real_escape_string($conn, $_POST['status_halal']);
    $patokan          = mysqli_real_escape_string($conn, $_POST['patokan']);
    $lokasi           = mysqli_real_escape_string($conn, $_POST['lokasi']);
    $deskripsi_umkm   = mysqli_real_escape_string($conn, $_POST['deskripsi_umkm']);
    
    // Default memakai nama file/link yang lama
    $link_dokumentasi = $data['link_dokumentasi']; 

    // Cek apakah user memilih file foto baru
    if (isset($_FILES['foto_warung']) && $_FILES['foto_warung']['name'] != '') {
        $error_file = $_FILES['foto_warung']['error'];
        
        // Jika tidak ada error saat upload
        if ($error_file === 0) {
            $nama_file   = $_FILES['foto_warung']['name'];
            $tmp_name    = $_FILES['foto_warung']['tmp_name'];
            
            // Bersihkan nama file dari spasi agar tidak error di URL
            $nama_file_bersih = str_replace(' ', '_', $nama_file);
            // Tambahkan timestamp unik di depan nama file agar tidak bentrok
            $nama_file_baru   = time() . '_' . $nama_file_bersih;

            // Tentukan folder tujuan penyimpanan
            $folder_tujuan = 'gambar_umkm/';

            // Buat folder otomatis jika belum ada di laptopmu
            if (!is_dir($folder_tujuan)) {
                mkdir($folder_tujuan, 0777, true);
            }

            // Pindahkan file dari folder sementara laptop ke folder gambar_umkm
            if (move_uploaded_file($tmp_name, $folder_tujuan . $nama_file_baru)) {
                $link_dokumentasi = $nama_file_baru; // Set nama file baru untuk disimpan ke DB
            } else {
                echo "<script>alert('Gagal memindahkan file! Periksa izin akses (permission) folder gambar_umkm Anda.');</script>";
            }
        } else {
            // Jika terjadi error bawaan PHP saat upload file (Misal file keseringan kebesaran)
            if ($error_file === 1 || $error_file === 2) {
                echo "<script>alert('Gagal Upload: Ukuran file foto terlalu besar! Gunakan foto berukuran di bawah 2MB atau kompres terlebih dahulu.');</script>";
            } else {
                echo "<script>alert('Gagal upload foto dengan kode error PHP: " . $error_file . "');</script>";
            }
        }
    }

    // Query SQL untuk memperbarui data
    $sql_update = "UPDATE UMKM SET 
                    nama_umkm = '$nama_umkm', 
                    status_halal = '$status_halal', 
                    patokan = '$patokan', 
                    lokasi = '$lokasi', 
                    deskripsi_umkm = '$deskripsi_umkm', 
                    link_dokumentasi = '$link_dokumentasi' 
                  WHERE id_umkm = '$id_umkm'";

    if (mysqli_query($conn, $sql_update)) {
        echo "<script>
                alert('Data & Foto UMKM berhasil diperbarui!');
                window.location.href = 'umkm_kpad.php';
              </script>";
    } else {
        echo "<script>alert('Gagal memperbarui database: " . mysqli_error($conn) . "');</script>";
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Data UMKM - Admin Panel</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f4f7f6;
            padding: 40px 0;
        }
        .form-card {
            background: #fff;
            border-radius: 12px;
            border: none;
            box-shadow: 0 4px 15px rgba(0,0,0,0.04);
            padding: 30px;
        }
        .form-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .form-label {
            font-weight: 600;
            color: #4a5568;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            
            <a href="umkm_kpad.php" class="btn btn-sm btn-secondary mb-3 shadow-sm">
                <i class="bi bi-arrow-left"></i> Kembali ke Dashboard
            </a>

            <div class="form-card">
                <div class="form-title">
                    <i class="bi bi-pencil-square text-warning"></i> Form Edit Data UMKM
                </div>

                <form action="" method="POST" enctype="multipart/form-data">
                    
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Nama Warung / UMKM</label>
                            <input type="text" name="nama_umkm" class="form-control" 
                                   value="<?= htmlspecialchars($data['nama_umkm']); ?>" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Status Sertifikasi Halal</label>
                            <select name="status_halal" class="form-select" required>
                                <option value="Ada" <?= ($data['status_halal'] == 'Ada') ? 'selected' : ''; ?>>Ada</option>
                                <option value="Proses" <?= ($data['status_halal'] == 'Proses') ? 'selected' : ''; ?>>Proses</option>
                                <option value="Tidak Ada" <?= ($data['status_halal'] == 'Tidak Ada' || $data['status_halal'] == 'Tidak') ? 'selected' : ''; ?>>Tidak Ada</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Patokan Singkat (Contoh: Dekat Lapangan)</label>
                            <input type="text" name="patokan" class="form-control" 
                                   value="<?= htmlspecialchars($data['patokan'] ?? ''); ?>">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Upload Foto UMKM Baru</label>
                            <input type="file" name="foto_warung" class="form-control" accept="image/*">
                            <div class="form-text text-truncate text-muted">
                                File saat ini: <strong><?= htmlspecialchars($data['link_dokumentasi'] ?? 'Belum ada foto'); ?></strong>
                            </div>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Alamat Lengkap</label>
                            <textarea name="lokasi" class="form-control" rows="2" required><?= htmlspecialchars($data['lokasi']); ?></textarea>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Deskripsi Warung & Menu Unggulan</label>
                            <textarea name="deskripsi_umkm" class="form-control" rows="3"><?= htmlspecialchars($data['deskripsi_umkm'] ?? ''); ?></textarea>
                        </div>
                        
                        <div class="col-12 mt-4 border-top pt-3 d-flex gap-2 justify-content-end">
                            <a href="umkm_kpad.php" class="btn btn-light fw-bold">Batal</a>
                            <button type="submit" name="update" class="btn btn-warning fw-bold px-4 shadow-sm">
                                <i class="bi bi-save"></i> Simpan Perubahan
                            </button>
                        </div>
                    </div>

                </form>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>