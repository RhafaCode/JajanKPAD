<?php
// Koneksi ke Database
$conn = mysqli_connect("localhost", "root", "", "db_umkm_kpad");

// MENGAMBIL DATA UNTUK KOTAK STATISTIK & GRAFIK
$q_total = mysqli_query($conn, "SELECT COUNT(*) as total FROM UMKM");
$total_umkm = mysqli_fetch_assoc($q_total)['total'];

$q_halal = mysqli_query($conn, "SELECT COUNT(*) as total FROM UMKM WHERE status_halal = 'Ada'");
$total_halal = mysqli_fetch_assoc($q_halal)['total'];

$q_proses = mysqli_query($conn, "SELECT COUNT(*) as total FROM UMKM WHERE status_halal = 'Proses'");
$total_proses = mysqli_fetch_assoc($q_proses)['total'];

$q_tidak = mysqli_query($conn, "SELECT COUNT(*) as total FROM UMKM WHERE status_halal = 'Tidak Ada'");
$total_tidak = mysqli_fetch_assoc($q_tidak)['total'];
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Admin - UMKM KPAD</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f4f7f6;
            overflow-x: hidden;
        }

        /* --- SIDEBAR STYLE --- */
        .sidebar {
            height: 100vh;
            background-color: #ffffff;
            box-shadow: 2px 0 10px rgba(0,0,0,0.05);
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            padding-top: 20px;
            z-index: 1000;
        }
        .sidebar-brand {
            font-size: 1.25rem;
            font-weight: 800;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            padding: 0 20px;
        }
        .sidebar-brand i { color: #3498db; }
        .nav-link {
            color: #6c757d;
            padding: 12px 25px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .nav-link:hover, .nav-link.active {
            color: #3498db;
            background-color: #f8f9fa;
            border-right: 4px solid #3498db;
        }
        .nav-link i { margin-right: 10px; font-size: 1.1rem; }

        /* --- MAIN CONTENT --- */
        .main-content {
            margin-left: 250px;
            padding: 30px;
        }
        
        /* --- CARDS & WIDGETS --- */
        .stat-card {
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            border: none;
            box-shadow: 0 4px 15px rgba(0,0,0,0.04);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: #fff;
        }
        .stat-details h3 {
            margin: 0;
            font-size: 1.8rem;
            font-weight: 800;
            color: #2c3e50;
        }
        .stat-details p {
            margin: 0;
            font-size: 0.85rem;
            color: #7f8c8d;
            font-weight: 600;
        }
        .bg-blue { background-color: #3498db; }
        .bg-green { background-color: #2ecc71; }
        .bg-orange { background-color: #f39c12; }
        .bg-red { background-color: #e74c3c; }

        /* --- CONTENT CARDS --- */
        .content-card {
            background: #fff;
            border-radius: 12px;
            border: none;
            box-shadow: 0 4px 15px rgba(0,0,0,0.04);
            padding: 20px;
            margin-bottom: 30px;
        }
        .content-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="sidebar-brand">
            <i class="bi bi-shop-window"></i> Admin KPAD
        </div>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="umkm_kpad.php">
                    <i class="bi bi-grid-1x2-fill"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="tambah.php">
                    <i class="bi bi-plus-square-fill"></i> Form Add UMKM
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.php" target="_blank">
                    <i class="bi bi-box-arrow-up-right"></i> Lihat Landing Page
                </a>
            </li>
        </ul>
    </div>

    <div class="main-content">
        <h3 class="mb-4 fw-bold" style="color: #2c3e50;">UMKM Statistics</h3>

        <div class="row g-4 mb-4">
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-details">
                        <p>Total UMKM</p>
                        <h3><?= $total_umkm; ?></h3>
                    </div>
                    <div class="stat-icon bg-blue"><i class="bi bi-shop"></i></div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-details">
                        <p>Halal Tersertifikasi</p>
                        <h3><?= $total_halal; ?></h3>
                    </div>
                    <div class="stat-icon bg-green"><i class="bi bi-check-circle"></i></div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-details">
                        <p>Sedang Proses Halal</p>
                        <h3><?= $total_proses; ?></h3>
                    </div>
                    <div class="stat-icon bg-orange"><i class="bi bi-hourglass-split"></i></div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-details">
                        <p>Belum Halal</p>
                        <h3><?= $total_tidak; ?></h3>
                    </div>
                    <div class="stat-icon bg-red"><i class="bi bi-x-circle"></i></div>
                </div>
            </div>
        </div>

        <div class="content-card">
            <div class="content-title">Grafik Status Halal UMKM KPAD</div>
            <div style="height: 300px;">
                <canvas id="halalChart"></canvas>
            </div>
        </div>

        <div class="content-card">
            <div class="d-flex justify-content-between align-items-center mb-3 border-bottom pb-3">
                <h5 class="fw-bold m-0" style="color: #2c3e50;">Table Record UMKM</h5>
                
                <form action="" method="GET" class="d-flex" style="width: 300px;">
                    <input type="text" name="cari" class="form-control form-control-sm me-2" placeholder="Cari nama warung..." value="<?php if(isset($_GET['cari'])) { echo $_GET['cari']; } ?>">
                    <button class="btn btn-primary btn-sm" type="submit">Cari</button>
                    <?php if(isset($_GET['cari'])) { ?>
                        <a href="umkm_kpad.php" class="btn btn-secondary btn-sm ms-2">Reset</a>
                    <?php } ?>
                </form>
            </div>

            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>No</th>
                            <th>Nama UMKM</th>
                            <th>Lokasi</th>
                            <th>Status Halal</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // LOGIKA PENCARIAN
                        if (isset($_GET['cari'])) {
                            $keyword = $_GET['cari'];
                            $sql = "SELECT * FROM UMKM WHERE nama_umkm LIKE '%$keyword%' OR lokasi LIKE '%$keyword%'";
                        } else {
                            $sql = "SELECT * FROM UMKM";
                        }

                        $query = mysqli_query($conn, $sql);
                        $no = 1;
                        
                        if (mysqli_num_rows($query) > 0) {
                            while($data = mysqli_fetch_assoc($query)) { 
                        ?>
                        <tr>
                            <td> <?php echo $no++; ?> </td>
                            <td class="fw-bold text-primary"> <?php echo $data['nama_umkm']; ?> </td>
                            <td> <?php echo $data['lokasi']; ?> </td>
                            <td> 
                                <?php 
                                if($data['status_halal'] == 'Ada') { echo '<span class="badge bg-success">Ada</span>'; }
                                elseif($data['status_halal'] == 'Proses') { echo '<span class="badge bg-warning text-dark">Proses</span>'; }
                                else { echo '<span class="badge bg-secondary">Tidak Ada</span>'; }
                                ?> 
                            </td>
                            <td>
                                <a href="edit.php?id=<?php echo $data['id_umkm']; ?>" class="btn btn-warning btn-sm shadow-sm"><i class="bi bi-pencil-square"></i></a>
                                <a href="hapus.php?id=<?php echo $data['id_umkm']; ?>" class="btn btn-danger btn-sm shadow-sm" onclick="return confirm('Yakin ingin menghapus data ini?')"><i class="bi bi-trash"></i></a>
                            </td>
                        </tr>
                        <?php 
                            } 
                        } else {
                            echo "<tr><td colspan='5' class='text-center text-danger fw-bold py-4'>Data pencarian tidak ditemukan!</td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

    <script>
        const ctx = document.getElementById('halalChart').getContext('2d');
        const halalChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Halal (Ada)', 'Sedang Proses', 'Belum Halal (Tidak Ada)'],
                datasets: [{
                    label: 'Jumlah UMKM',
                    data: [<?= $total_halal ?>, <?= $total_proses ?>, <?= $total_tidak ?>],
                    backgroundColor: [
                        'rgba(46, 204, 113, 0.8)', // Hijau
                        'rgba(243, 156, 18, 0.8)', // Orange
                        'rgba(231, 76, 60, 0.8)'   // Merah
                    ],
                    borderColor: [
                        'rgba(46, 204, 113, 1)',
                        'rgba(243, 156, 18, 1)',
                        'rgba(231, 76, 60, 1)'
                    ],
                    borderWidth: 1,
                    borderRadius: 5,
                    barPercentage: 0.5
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: { stepSize: 1 } // Angka di sumbu Y loncat 1 (bukan desimal)
                    }
                },
                plugins: {
                    legend: { display: false } // Sembunyikan legenda atas biar bersih
                }
            }
        });
    </script>
</body>
</html>