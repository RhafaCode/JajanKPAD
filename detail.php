<?php
// Pastikan TIDAK ADA spasi, enter, atau teks apa pun sebelum tag <?php ini agar fungsi redirect & cookie tidak error.
date_default_timezone_set('Asia/Jakarta');

// Koneksi database
$host     = 'localhost';
$dbname   = 'db_umkm_kpad';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Koneksi gagal: " . $e->getMessage());
}

// 1. Tangkap ID UMKM dari URL
$id_umkm = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($id_umkm <= 0) {
    header("Location: index.php");
    exit;
}

$error_msg = null;

// 2. PROSES MENYIMPAN ULASAN BARU (DENGAN PROTEKSI ANTI-SPAM COOKIE)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit_ulasan'])) {
    $rating_baru   = intval($_POST['rating']);
    $komentar_baru = trim($_POST['komentar']);
    
    // Membuat nama cookie unik untuk setiap warung
    $nama_cookie = "sudah_review_" . $id_umkm;

    if (isset($_COOKIE[$nama_cookie])) {
        $error_msg = "Anda sudah pernah memberikan ulasan untuk warung ini sebelumnya.";
    } elseif ($rating_baru >= 1 && $rating_baru <= 5 && !empty($komentar_baru)) {
        // Simpan ke DB
        $stmt_insert = $pdo->prepare("INSERT INTO ulasan (id_umkm, rating, komentar) VALUES (:id_umkm, :rating, :komentar)");
        $stmt_insert->execute([
            ':id_umkm'  => $id_umkm,
            ':rating'   => $rating_baru,
            ':komentar' => $komentar_baru
        ]);

        // Set Cookie berlaku 30 hari
        setcookie($nama_cookie, 'true', time() + (86400 * 30), "/");

        header("Location: detail.php?id=" . $id_umkm . "&success=1");
        exit;
    } else {
        $error_msg = "Pastikan Anda memilih bintang dan mengisi komentar.";
    }
}

// 3. AMBIL DATA UMKM UTAMA
$stmt_umkm = $pdo->prepare("SELECT * FROM umkm WHERE id_umkm = :id_umkm");
$stmt_umkm->execute([':id_umkm' => $id_umkm]);
$umkm = $stmt_umkm->fetch(PDO::FETCH_ASSOC);

if (!$umkm) {
    die("Data UMKM tidak ditemukan.");
}

// 4. AMBIL SEMUA DATA MENU (Tanpa Pemisahan Kategori)
$stmt_menu = $pdo->prepare("
    SELECT m.*, kr.nama_kategori AS rasa, ad.nama_daerah AS asal 
    FROM menu m 
    LEFT JOIN kategori_rasa kr ON m.id_kategori = kr.id_kategori 
    LEFT JOIN asal_daerah ad ON m.id_asal = ad.id_asal 
    WHERE m.id_umkm = :id_umkm 
    ORDER BY m.nama_menu ASC
");
$stmt_menu->execute([':id_umkm' => $id_umkm]);
$daftar_menu = $stmt_menu->fetchAll(PDO::FETCH_ASSOC);

// 5. AMBIL ULASAN
$stmt_ulasan = $pdo->prepare("SELECT * FROM ulasan WHERE id_umkm = :id_umkm ORDER BY id_ulasan DESC");
$stmt_ulasan->execute([':id_umkm' => $id_umkm]);
$daftar_ulasan = $stmt_ulasan->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($umkm['nama_umkm']) ?> - Jajan KPAD</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        * { font-family: 'Plus Jakarta Sans', sans-serif; }
        body { background: #f8f8f6; color: #222; }
        
        /* HERO BANNER BARU: DENGAN FOTO TRANSPARAN & OVERLAY GRADIENT */
        .hero-detail {
            position: relative;
            padding: 55px 0;
            background: #140500;
            overflow: hidden;
            border-bottom: 4px solid #e8500a;
        }
        .hero-detail-bg {
            position: absolute;
            inset: 0;
            background-image: url('https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=1600&q=80');
            background-size: cover;
            background-position: center;
            opacity: 0.25; /* Transparansi Foto */
            filter: blur(1px);
        }
        .hero-detail-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(135deg, rgba(20,5,0,0.9) 0%, rgba(232,80,10,0.3) 100%);
        }
        .hero-detail-content {
            position: relative;
            z-index: 2;
        }
        .hero-detail h1 {
            font-size: 2.4rem;
            font-weight: 800;
            letter-spacing: -0.5px;
            color: #fff;
        }

        /* DESAIN KARTU MENU */
        .menu-card {
            background: #fff;
            border-radius: 14px;
            padding: 16px;
            box-shadow: 0 4px 14px rgba(0,0,0,0.04);
            border: 1px solid #eee;
            height: 100%;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .menu-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.07);
        }
        .menu-price {
            font-weight: 800;
            color: #e8500a;
            font-size: 1.1rem;
            white-space: nowrap;
        }
        
        /* AREA ULASAN & SIDEBAR */
        .review-card {
            background: #fff;
            border-left: 4px solid #e8500a;
            padding: 16px;
            border-radius: 12px;
            margin-bottom: 14px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        }
        .star-filled { color: #ffb800; }
        .sidebar-box {
            background: #fff;
            border-radius: 16px;
            border: 1px solid #eee;
            box-shadow: 0 4px 14px rgba(0,0,0,0.04);
        }
    </style>
</head>
<body>

<div class="hero-detail">
    <div class="hero-detail-bg"></div>
    <div class="hero-detail-overlay"></div>
    <div class="container hero-detail-content">
        <a href="index.php" class="btn btn-sm btn-outline-light rounded-pill mb-3">
            <i class="bi bi-arrow-left me-1"></i> Kembali ke Beranda
        </a>
        <h1><?= htmlspecialchars($umkm['nama_umkm']) ?></h1>
        <div class="d-flex flex-wrap gap-3 mt-2 text-white-50 small">
            <div><i class="bi bi-geo-alt-fill text-warning me-1"></i> Patokan: <strong><?= htmlspecialchars($umkm['patokan']) ?></strong></div>
            <div><i class="bi bi-shield-check text-success me-1"></i> Status Halal: <strong><?= htmlspecialchars($umkm['status_halal']) ?></strong></div>
        </div>
        <p class="mt-3 mb-0 text-white-50 max-width-600 font-serif opacity-90" style="font-size:0.95rem; line-height:1.6;">
            <?= htmlspecialchars($umkm['deskripsi_umkm']) ?>
        </p>
    </div>
</div>

<div class="container py-5">
    <div class="row g-4">
        
        <div class="col-lg-8">
            <div class="d-flex align-items-center justify-content-between mb-4 border-bottom pb-2">
                <h3 class="fw-bold mb-0"><i class="bi bi-journal-text text-warning me-2"></i>Daftar Menu</h3>
                <span class="badge bg-secondary rounded-pill"><?= count($daftar_menu) ?> Items</span>
            </div>

            <?php if (empty($daftar_menu)): ?>
                <div class="alert alert-light text-center py-5 border border-dashed rounded-4">
                    <i class="bi bi-egg text-muted d-block h1 mb-2"></i>
                    <span class="text-muted">Warung ini belum mengunggah daftar menu digitalnya.</span>
                </div>
            <?php else: ?>
                <div class="row g-3">
                    <?php foreach ($daftar_menu as $menu): ?>
                    <div class="col-md-6">
                        <div class="menu-card d-flex justify-content-between align-items-center">
                            <div class="pe-2">
                                <h6 class="mb-1 fw-bold text-dark"><?= htmlspecialchars($menu['nama_menu']) ?></h6>
                                <div class="d-flex flex-wrap gap-1 mt-1">
                                    <?php if (!empty($menu['rasa'])): ?>
                                        <span class="badge bg-danger-subtle text-danger rounded-pill px-2" style="font-size:0.68rem;">🌶️ <?= htmlspecialchars($menu['rasa']) ?></span>
                                    <?php endif; ?>
                                    <?php if (!empty($menu['asal'])): ?>
                                        <span class="badge bg-secondary-subtle text-secondary rounded-pill px-2" style="font-size:0.68rem;">📍 Khas <?= htmlspecialchars($menu['asal']) ?></span>
                                    <?php endif; ?>
                                </div>
                            </div>
                            <div class="menu-price">Rp <?= number_format($menu['harga'], 0, ',', '.') ?></div>
                        </div>
                    </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </div>

        <div class="col-lg-4">
            
            <div class="sidebar-box p-4 mb-4">
                <h5 class="fw-bold mb-3"><i class="bi bi-pencil-square me-2 text-warning"></i>Beri Ulasan</h5>
                
                <?php if ($error_msg): ?>
                    <div class="alert alert-danger small py-2"><?= htmlspecialchars($error_msg) ?></div>
                <?php endif; ?>
                
                <?php if (isset($_GET['success'])): ?>
                    <div class="alert alert-success small py-2"><i class="bi bi-check-circle-fill me-1"></i>Ulasan berhasil disimpan!</div>
                <?php endif; ?>

                <form method="POST">
                    <div class="mb-3">
                        <label class="form-label small fw-bold text-muted">Beri Rating</label>
                        <select name="rating" class="form-select form-select-sm fw-600" required>
                            <option value="">Pilih Bintang...</option>
                            <option value="5">⭐⭐⭐⭐⭐ (5) Sangat Enak</option>
                            <option value="4">⭐⭐⭐⭐ (4) Enak</option>
                            <option value="3">⭐⭐⭐ (3) Lumayan</option>
                            <option value="2">⭐⭐ (2) Kurang Cocok</option>
                            <option value="1">⭐ (1) Tidak Rekomen</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-bold text-muted">Pendapat Anda</label>
                        <textarea name="komentar" class="form-control form-control-sm" rows="3" required placeholder="Tulis rasa makanan, porsi, atau keramahan penjual..."></textarea>
                    </div>
                    <button type="submit" name="submit_ulasan" class="btn btn-dark btn-sm w-100 fw-bold rounded-3">Kirim Review</button>
                </form>
            </div>

            <div class="d-flex align-items-center justify-content-between mb-3">
                <h5 class="fw-bold mb-0">Ulasan Pengunjung</h5>
                <span class="text-muted small fw-bold">(<?= count($daftar_ulasan) ?>)</span>
            </div>

            <?php if (empty($daftar_ulasan)): ?>
                <div class="text-center py-4 text-muted bg-white rounded-4 border border-dashed small">
                    <i class="bi bi-chat-heart text-black-50 d-block h3 mb-1"></i>
                    Belum ada ulasan. Jadilah yang pertama!
                </div>
            <?php else: ?>
                <?php foreach ($daftar_ulasan as $ulasan): ?>
                    <div class="review-card">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <div>
                                <?php for($i=1; $i<=5; $i++): ?>
                                    <i class="bi <?= $i <= $ulasan['rating'] ? 'bi-star-fill star-filled' : 'bi-star text-muted' ?> small"></i>
                                <?php endfor; ?>
                            </div>
                            <span class="text-muted" style="font-size:0.65rem;">#<?= $ulasan['id_ulasan'] ?></span>
                        </div>
                        <p class="mb-0 text-dark small fst-italic">"<?= htmlspecialchars($ulasan['komentar']) ?>"</p>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>