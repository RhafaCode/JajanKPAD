<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah UMKM Baru</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <nav class="navbar navbar-dark bg-dark mb-4">
        <div class="container">
            <a class="navbar-brand" href="umkm_kpad.php">🍕 Admin UMKM Streetfood KPAD</a>
        </div>
    </nav>

    <div class="container">
        <div class="card col-md-6 mx-auto shadow">
            <div class="card-header bg-success text-white">
                <h4 class="mb-0">Form Tambah UMKM Baru</h4>
            </div>
            <div class="card-body">
                
                <form action="" method="POST">
                    <div class="mb-3">
                        <label class="form-label font-weight-bold">Nama UMKM</label>
                        <input type="text" name="nama_umkm" class="form-control" placeholder="Contoh: Seblak Jeletot" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Lokasi / Alamat</label>
                        <textarea name="lokasi" class="form-control" rows="3" placeholder="Nama Jalan, Gegerkalong..." required></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Status Halal</label>
                        <select name="status_halal" class="form-select" required>
                            <option value="Ada">Ada</option>
                            <option value="Tidak Ada">Tidak Ada</option>
                            <option value="Proses">Proses</option>
                        </select>
                    </div>
                    
                    <div class="d-flex justify-content-between">
                        <a href="umkm_kpad.php" class="btn btn-secondary">Kembali</a>
                        <button type="submit" name="simpan" class="btn btn-success">Simpan Data</button>
                    </div>
                </form>

                <?php
                // PROSES INSERT KE DATABASE
                if (isset($_POST['simpan'])) {
                    $conn = mysqli_connect("localhost", "root", "", "db_umkm_kpad");
                    
                    $nama   = $_POST['nama_umkm'];
                    $lokasi = $_POST['lokasi'];
                    $halal  = $_POST['status_halal'];

                    // Query Insert
                    $insert = mysqli_query($conn, "INSERT INTO UMKM (nama_umkm, lokasi, status_halal) VALUES ('$nama', '$lokasi', '$halal')");

                    if ($insert) {
                        echo "<script>
                                alert('Data berhasil ditambahkan!');
                                window.location='umkm_kpad.php';
                              </script>";
                    } else {
                        // SUDAH DIPERBAIKI: Menggunakan kutip satu ('') pada class Bootstrap agar tidak bentrok
                        echo "<div class='alert alert-danger mt-3'>Gagal menambah data: " . mysqli_error($conn) . "</div>";
                    }
                }
                ?>

            </div>
        </div>
    </div>

</body>
</html>