<?php
// 1. Hubungkan ke database
$conn = mysqli_connect("localhost", "root", "", "db_umkm_kpad");

// 2. Ambil ID dari URL (id_umkm)
$id = $_GET['id'];

// 3. Jalankan query DELETE
$delete = mysqli_query($conn, "DELETE FROM UMKM WHERE id_umkm = '$id'");

// 4. Kembali ke halaman utama otomatis
if ($delete) {
    header("Location: umkm_kpad.php");
} else {
    echo "Gagal menghapus data: " . mysqli_error($conn);
}
?>