<?php
// 1. SETTING WAKTU & HARI REAL-TIME (WIB)
date_default_timezone_set('Asia/Jakarta');
$waktu_sekarang = date('H:i:s'); 
$hari_sekarang  = date('N');     

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

// ── FUNGSI MENGUBAH LINK GOOGLE DRIVE MENJADI DIRECT LINK GAMBAR ──
function konversi_link_drive($url) {
    if (empty($url)) return '';
    if (preg_match('/\/d\/([a-zA-Z0-9-_]+)/', $url, $matches)) {
        return "https://docs.google.com/uc?export=view&id=" . $matches[1];
    }
    return $url;
}

// Ambil keyword pencarian dan filter jika ada
$search      = isset($_GET['search']) ? trim($_GET['search']) : '';
$filter_buka = isset($_GET['filter_buka']) ? trim($_GET['filter_buka']) : 'semua';
$fitur       = isset($_GET['fitur']) ? trim($_GET['fitur']) : '';
$range_opt   = isset($_GET['range_opt']) ? trim($_GET['range_opt']) : '';
$platform    = isset($_GET['platform']) ? trim($_GET['platform']) : '';
$metode      = isset($_GET['metode']) ? trim($_GET['metode']) : '';

// Definisikan batas harga jika filter range harga aktif
$min_harga = 0;
$max_harga = 9999999;
if ($range_opt === '1') {
    $max_harga = 15000;
} elseif ($range_opt === '2') {
    $min_harga = 15000;
    $max_harga = 30000;
} elseif ($range_opt === '3') {
    $min_harga = 30000;
}

// 2. QUERY DBMS
if ($search !== '') {
    $stmt = $pdo->prepare("
        SELECT u.id_umkm, u.nama_umkm, u.deskripsi_umkm, u.lokasi, u.patokan, u.status_halal, u.link_dokumentasi, 
        jo.hari_buka, jo.jam_buka, jo.jam_tutup,
        AVG(ul.rating) AS avg_rating,
        COUNT(ul.id_ulasan) AS total_ulasan
        FROM UMKM u
        LEFT JOIN jam_operasional jo ON u.id_umkm = jo.id_umkm
        LEFT JOIN ulasan ul ON u.id_umkm = ul.id_umkm
        WHERE u.nama_umkm LIKE :search OR u.deskripsi_umkm LIKE :search OR u.lokasi LIKE :search
        GROUP BY u.id_umkm
        ORDER BY u.nama_umkm ASC
    ");
    $stmt->execute([':search' => "%$search%"]);
} elseif ($range_opt !== '') {
    $stmt = $pdo->prepare("
        SELECT u.id_umkm, u.nama_umkm, u.deskripsi_umkm, u.lokasi, u.patokan, u.status_halal, u.link_dokumentasi, 
        jo.hari_buka, jo.jam_buka, jo.jam_tutup,
        AVG(ul.rating) AS avg_rating,
        COUNT(ul.id_ulasan) AS total_ulasan
        FROM UMKM u
        LEFT JOIN jam_operasional jo ON u.id_umkm = jo.id_umkm
        LEFT JOIN ulasan ul ON u.id_umkm = ul.id_umkm
        WHERE u.id_umkm IN (SELECT id_umkm FROM menu WHERE harga BETWEEN :min_harga AND :max_harga)
        GROUP BY u.id_umkm
        ORDER BY u.nama_umkm ASC
    ");
    $stmt->execute([':min_harga' => $min_harga, ':max_harga' => $max_harga]);
} elseif ($fitur === 'mitra_online') {
    if (!empty($platform)) {
        $stmt = $pdo->prepare("
            SELECT u.id_umkm, u.nama_umkm, u.deskripsi_umkm, u.lokasi, u.patokan, u.status_halal, u.link_dokumentasi, 
            jo.hari_buka, jo.jam_buka, jo.jam_tutup,
            AVG(ul.rating) AS avg_rating,
            COUNT(ul.id_ulasan) AS total_ulasan
            FROM UMKM u
            LEFT JOIN jam_operasional jo ON u.id_umkm = jo.id_umkm
            LEFT JOIN ulasan ul ON u.id_umkm = ul.id_umkm
            WHERE u.id_umkm IN (
                SELECT umo.id_umkm 
                FROM umkm_mitra_online umo 
                JOIN mitra_online mo ON umo.id_mitra = mo.id_mitra 
                WHERE mo.nama_platform = :platform
            )
            GROUP BY u.id_umkm
            ORDER BY u.nama_umkm ASC
        ");
        $stmt->execute([':platform' => $platform]);
    } else {
        $stmt = $pdo->query("
            SELECT u.id_umkm, u.nama_umkm, u.deskripsi_umkm, u.lokasi, u.patokan, u.status_halal, u.link_dokumentasi, 
            jo.hari_buka, jo.jam_buka, jo.jam_tutup,
            AVG(ul.rating) AS avg_rating,
            COUNT(ul.id_ulasan) AS total_ulasan
            FROM UMKM u
            LEFT JOIN jam_operasional jo ON u.id_umkm = jo.id_umkm
            LEFT JOIN ulasan ul ON u.id_umkm = ul.id_umkm
            WHERE u.id_umkm IN (SELECT id_umkm FROM umkm_mitra_online)
            GROUP BY u.id_umkm
            ORDER BY u.nama_umkm ASC
        ");
    }
} elseif ($fitur === 'metode_bayar') {
    if (!empty($metode)) {
        $stmt = $pdo->prepare("
            SELECT u.id_umkm, u.nama_umkm, u.deskripsi_umkm, u.lokasi, u.patokan, u.status_halal, u.link_dokumentasi, 
            jo.hari_buka, jo.jam_buka, jo.jam_tutup,
            AVG(ul.rating) AS avg_rating,
            COUNT(ul.id_ulasan) AS total_ulasan
            FROM UMKM u
            LEFT JOIN jam_operasional jo ON u.id_umkm = jo.id_umkm
            LEFT JOIN ulasan ul ON u.id_umkm = ul.id_umkm
            WHERE u.id_umkm IN (
                SELECT ump.id_umkm 
                FROM umkm_metode_pembayaran ump 
                JOIN metode_pembayaran mp ON ump.id_metode = mp.id_metode 
                WHERE mp.nama_metode = :metode
            )
            GROUP BY u.id_umkm
            ORDER BY u.nama_umkm ASC
        ");
        $stmt->execute([':metode' => $metode]);
    } else {
        $stmt = $pdo->query("
            SELECT u.id_umkm, u.nama_umkm, u.deskripsi_umkm, u.lokasi, u.patokan, u.status_halal, u.link_dokumentasi, 
            jo.hari_buka, jo.jam_buka, jo.jam_tutup,
            AVG(ul.rating) AS avg_rating,
            COUNT(ul.id_ulasan) AS total_ulasan
            FROM UMKM u
            LEFT JOIN jam_operasional jo ON u.id_umkm = jo.id_umkm
            LEFT JOIN ulasan ul ON u.id_umkm = ul.id_umkm
            WHERE u.id_umkm IN (SELECT id_umkm FROM umkm_metode_pembayaran)
            GROUP BY u.id_umkm
            ORDER BY u.nama_umkm ASC
        ");
    }
} elseif ($fitur === 'halal') {
    $stmt = $pdo->query("
        SELECT u.id_umkm, u.nama_umkm, u.deskripsi_umkm, u.lokasi, u.patokan, u.status_halal, u.link_dokumentasi, 
        jo.hari_buka, jo.jam_buka, jo.jam_tutup,
        AVG(ul.rating) AS avg_rating,
        COUNT(ul.id_ulasan) AS total_ulasan
        FROM UMKM u
        LEFT JOIN jam_operasional jo ON u.id_umkm = jo.id_umkm
        LEFT JOIN ulasan ul ON u.id_umkm = ul.id_umkm
        WHERE u.status_halal = 'Ada'
        GROUP BY u.id_umkm
        ORDER BY u.nama_umkm ASC
    ");
} elseif ($fitur === 'kategori_rasa') {
    $stmt = $pdo->query("
        SELECT u.id_umkm, u.nama_umkm, u.deskripsi_umkm, u.lokasi, u.patokan, u.status_halal, u.link_dokumentasi, 
        jo.hari_buka, jo.jam_buka, jo.jam_tutup,
        AVG(ul.rating) AS avg_rating,
        COUNT(ul.id_ulasan) AS total_ulasan
        FROM UMKM u
        LEFT JOIN jam_operasional jo ON u.id_umkm = jo.id_umkm
        LEFT JOIN ulasan ul ON u.id_umkm = ul.id_umkm
        WHERE u.id_umkm IN (
            SELECT m.id_umkm 
            FROM menu m 
            JOIN kategori_rasa kr ON m.id_kategori = kr.id_kategori 
            WHERE kr.nama_kategori = 'Pedas'
        )
        GROUP BY u.id_umkm
        ORDER BY u.nama_umkm ASC
    ");
} else {
    $stmt = $pdo->query("
        SELECT u.id_umkm, u.nama_umkm, u.deskripsi_umkm, u.lokasi, u.patokan, u.status_halal, u.link_dokumentasi, 
        jo.hari_buka, jo.jam_buka, jo.jam_tutup,
        AVG(ul.rating) AS avg_rating,
        COUNT(ul.id_ulasan) AS total_ulasan
        FROM UMKM u
        LEFT JOIN jam_operasional jo ON u.id_umkm = jo.id_umkm
        LEFT JOIN ulasan ul ON u.id_umkm = ul.id_umkm
        GROUP BY u.id_umkm
        ORDER BY u.nama_umkm ASC
    ");
}

$raw_umkm_list = $stmt->fetchAll(PDO::FETCH_ASSOC);
$umkm_list = [];

// 3. PROSES LOGIKA REAL-TIME
foreach ($raw_umkm_list as $umkm) {
    $is_open = false;

    if (!empty($umkm['jam_buka']) && !empty($umkm['jam_tutup'])) {
        $hari_aturan = $umkm['hari_buka'];
        $buka        = $umkm['jam_buka'];
        $tutup       = $umkm['jam_tutup'];
        $hari_cocok  = true;

        if ($hari_aturan === 'Senin-Sabtu' && $hari_sekarang == 7) {
            $hari_cocok = false;
        }

        if ($hari_cocok) {
            if ($buka <= $tutup) {
                if ($waktu_sekarang >= $buka && $waktu_sekarang <= $tutup) {
                    $is_open = true;
                }
            } else {
                if ($waktu_sekarang >= $buka || $waktu_sekarang <= $tutup) {
                    $is_open = true;
                }
            }
        }
    } else {
        $is_open = true; 
    }

    $umkm['is_open'] = $is_open;

    if ($filter_buka === 'buka' && !$is_open) {
        continue; 
    }

    $umkm_list[] = $umkm;
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jajan KPAD — Temukan Kuliner Hits di KPAD Bandung</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        * { font-family: 'Plus Jakarta Sans', sans-serif; }

        .navbar {
            background: rgba(255,255,255,0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 16px rgba(0,0,0,0.07);
            padding: 14px 0;
        }
        .navbar-brand {
            font-weight: 800;
            font-size: 1.3rem;
            color: #e8500a !important;
            letter-spacing: -0.5px;
        }
        .navbar-brand span { color: #222; }

        .hero {
            position: relative;
            min-height: 88vh;
            display: flex;
            align-items: center;
            overflow: hidden;
            background: #1a0a00;
        }
        .hero-bg {
            position: absolute;
            inset: 0;
            background-image: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1600&q=80');
            background-size: cover;
            background-position: center;
            opacity: 0.38;
            filter: saturate(1.2);
        }
        .hero-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(135deg, rgba(20,5,0,0.82) 0%, rgba(232,80,10,0.25) 100%);
        }
        .hero-content { position: relative; z-index: 2; }
        .hero-eyebrow {
            display: inline-block;
            background: rgba(232,80,10,0.18);
            border: 1px solid rgba(232,80,10,0.5);
            color: #ff9966;
            font-size: 0.78rem;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            padding: 5px 14px;
            border-radius: 50px;
            margin-bottom: 20px;
        }
        .hero h1 {
            font-size: clamp(2.2rem, 5vw, 4rem);
            font-weight: 800;
            color: #fff;
            line-height: 1.15;
            letter-spacing: -1px;
            margin-bottom: 18px;
        }
        .hero h1 span { color: #ff6b2b; }
        .hero p {
            font-size: 1.1rem;
            color: rgba(255,255,255,0.75);
            max-width: 520px;
            margin-bottom: 30px;
            line-height: 1.7;
        }

        .search-wrap {
            background: #fff;
            border-radius: 16px;
            padding: 6px 6px 6px 20px;
            display: flex;
            align-items: center;
            box-shadow: 0 8px 32px rgba(0,0,0,0.18);
            max-width: 480px;
        }
        .search-wrap input {
            border: none;
            outline: none;
            font-size: 1rem;
            flex: 1;
            color: #333;
            background: transparent;
        }
        .search-wrap input::placeholder { color: #aaa; }
        .search-wrap button {
            background: #e8500a;
            color: #fff;
            border: none;
            border-radius: 12px;
            padding: 10px 24px;
            font-weight: 700;
            font-size: 0.95rem;
            transition: background 0.2s;
            white-space: nowrap;
        }
        .search-wrap button:hover { background: #c4400a; }

        /* DESAIN FILTER BARU (TUMPUK/STACK) */
        .filter-stack {
            max-width: 480px;
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 20px;
        }
        .filter-box {
            background: rgba(0, 0, 0, 0.4);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            padding: 8px 14px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            backdrop-filter: blur(4px);
        }
        .filter-box .form-select {
            background-color: #fff;
            border: none;
            font-weight: 600;
            font-size: 0.85rem;
            color: #333;
            border-radius: 8px;
            padding: 6px 30px 6px 12px;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        }

        .stats-strip {
            background: #fff;
            border-bottom: 1px solid #f0f0f0;
            padding: 18px 0;
        }
        .stat-item { text-align: center; }
        .stat-item .num {
            font-size: 1.6rem;
            font-weight: 800;
            color: #e8500a;
            line-height: 1;
        }
        .stat-item .label {
            font-size: 0.78rem;
            color: #888;
            font-weight: 500;
            margin-top: 2px;
        }

        .section-label {
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 2.5px;
            text-transform: uppercase;
            color: #e8500a;
            margin-bottom: 6px;
        }
        .section-title {
            font-size: 1.85rem;
            font-weight: 800;
            color: #1a1a1a;
            letter-spacing: -0.5px;
        }

        .umkm-card {
            border: none;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 2px 12px rgba(0,0,0,0.07);
            transition: transform 0.22s ease, box-shadow 0.22s ease;
            height: 100%;
            background: #fff;
        }
        .umkm-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 32px rgba(232,80,10,0.13);
        }
        .card-img-wrap {
            position: relative;
            height: 190px;
            overflow: hidden;
            background: #f5ede8;
        }
        .card-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.35s ease;
        }
        .umkm-card:hover .card-img-wrap img { transform: scale(1.06); }
        .card-img-placeholder {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #fde8dc, #ffd0b5);
            color: #e8500a;
            font-size: 2.5rem;
        }
        
        .status-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            font-size: 0.68rem;
            font-weight: 800;
            padding: 4px 10px;
            border-radius: 50px;
            text-transform: uppercase;
            z-index: 2;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        .halal-badge {
            position: absolute;
            top: 12px;
            right: 12px;
            font-size: 0.7rem;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 50px;
            z-index: 2;
        }
        .badge-halal { background: #16a34a; color: #fff; }
        .badge-proses { background: #d97706; color: #fff; }
        .badge-tidak { background: #6b7280; color: #fff; }

        .umkm-card .card-body { padding: 16px 18px 18px; }
        .umkm-card .card-title {
            font-size: 1rem;
            font-weight: 800;
            color: #1a1a1a;
            margin-bottom: 4px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .card-rating {
            display: flex;
            align-items: center;
            gap: 4px;
            font-size: 0.82rem;
            font-weight: 700;
            margin-bottom: 10px;
        }
        .card-rating i { color: #ffb800; }
        .card-rating .rating-score { color: #222; }
        .card-rating .rating-count { color: #888; font-weight: 400; }

        .umkm-card .card-desc {
            font-size: 0.82rem;
            color: #777;
            margin-bottom: 10px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        .umkm-card .card-loc {
            font-size: 0.78rem;
            color: #555;
            display: flex;
            align-items: flex-start;
            gap: 5px;
        }
        .umkm-card .card-loc i { color: #e8500a; margin-top: 1px; flex-shrink: 0; }

        .card-operasional {
            font-size: 0.75rem;
            color: #666;
            margin-top: 6px;
            padding-top: 6px;
            border-top: 1px dashed #eee;
        }
        .card-operasional div {
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 2px;
        }
        .card-operasional i { color: #e8500a; font-size: 0.85rem; }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #aaa;
        }
        .empty-state i { font-size: 3rem; margin-bottom: 14px; color: #ddd; }
        .empty-state p { font-size: 1rem; }

        footer {
            background: #111;
            color: #888;
            padding: 32px 0;
            font-size: 0.85rem;
            text-align: center;
        }
        footer span { color: #e8500a; }
    </style>
</head>
<body style="background:#f8f8f6;">

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="index.php">🍜 Jajan<span>KPAD</span></a>
        <div class="ms-auto d-flex gap-2 align-items-center">
            <span class="text-muted small">WIB Real-Time: <strong class="text-dark"><?= date('H:i') ?></strong></span>
        </div>
    </div>
</nav>

<section class="hero">
    <div class="hero-bg"></div>
    <div class="hero-overlay"></div>
    <div class="container hero-content py-5">
        <div class="row">
            <div class="col-lg-8">
                <div class="hero-eyebrow">📍 Kawasan KPAD Bandung</div>
                <h1>Laper di KPAD?<br>Cari makanan <span>ter-hits</span><br>di sini!</h1>
                <p>Dari seblak pedas sampai kopi kekinian — semua UMKM kuliner di kawasan KPAD Gegerkalong ada di sini.</p>

                <form method="GET" action="index.php">
                    <?php if(!empty($fitur)): ?>
                        <input type="hidden" name="fitur" value="<?= htmlspecialchars($fitur) ?>">
                    <?php endif; ?>

                    <div class="search-wrap">
                        <i class="bi bi-search text-secondary me-2"></i>
                        <input type="text" name="search" placeholder="Cari warung, menu, atau kategori..." value="<?= htmlspecialchars($search) ?>" autocomplete="off">
                        <button type="submit">Cari</button>
                    </div>

                    <div class="filter-stack">
                        <div class="filter-box">
                            <span class="text-white-50 small"><i class="bi bi-clock-fill text-warning me-1"></i> Jam Operasional</span>
                            <select name="filter_buka" class="form-select form-select-sm w-auto" onchange="this.form.submit()">
                                <option value="semua" <?= $filter_buka === 'semua' ? 'selected' : '' ?>>🌐 Tampilkan Semua</option>
                                <option value="buka" <?= $filter_buka === 'buka' ? 'selected' : '' ?>>🟢 Hanya yang Buka</option>
                            </select>
                        </div>

                        <div class="filter-box">
                            <span class="text-white-50 small"><i class="bi bi-tags-fill text-warning me-1"></i> Range Harga Menu</span>
                            <select name="range_opt" class="form-select form-select-sm w-auto" onchange="this.form.submit()">
                                <option value="" <?= $range_opt === '' ? 'selected' : '' ?>>🌐 Semua Harga</option>
                                <option value="1" <?= $range_opt === '1' ? 'selected' : '' ?>>💰 Murah (< 15rb)</option>
                                <option value="2" <?= $range_opt === '2' ? 'selected' : '' ?>>💰 Sedang (15 - 30rb)</option>
                                <option value="3" <?= $range_opt === '3' ? 'selected' : '' ?>>💰 Premium (> 30rb)</option>
                            </select>
                        </div>

                        <?php if ($fitur === 'mitra_online'): ?>
                        <div class="filter-box">
                            <span class="text-white-50 small"><i class="bi bi-phone-vibrate-fill text-warning me-1"></i> Opsi Platform</span>
                            <select name="platform" class="form-select form-select-sm w-auto" onchange="this.form.submit()">
                                <option value="" <?= $platform === '' ? 'selected' : '' ?>>🛵 Semua Platform</option>
                                <option value="GoFood" <?= $platform === 'GoFood' ? 'selected' : '' ?>>🔴 GoFood</option>
                                <option value="GrabFood" <?= $platform === 'GrabFood' ? 'selected' : '' ?>>🟢 GrabFood</option>
                                <option value="ShopeeFood" <?= $platform === 'ShopeeFood' ? 'selected' : '' ?>>🟠 ShopeeFood</option>
                            </select>
                        </div>
                        <?php endif; ?>

                        <?php if ($fitur === 'metode_bayar'): ?>
                        <div class="filter-box">
                            <span class="text-white-50 small"><i class="bi bi-credit-card-2-front-fill text-warning me-1"></i> Opsi Pembayaran</span>
                            <select name="metode" class="form-select form-select-sm w-auto" onchange="this.form.submit()">
                                <option value="" <?= $metode === '' ? 'selected' : '' ?>>📱 Semua Pembayaran</option>
                                <option value="QRIS" <?= $metode === 'QRIS' ? 'selected' : '' ?>>⚡ QRIS E-Wallet</option>
                                <option value="Cash" <?= $metode === 'Cash' ? 'selected' : '' ?>>💵 Tunai / Cash</option>
                                <option value="Transfer" <?= $metode === 'Transfer' ? 'selected' : '' ?>>🏦 Transfer Bank</option>
                            </select>
                        </div>
                        <?php endif; ?>
                    </div>
                </form>

                <?php if ($search !== '' || $filter_buka !== 'semua' || $fitur !== '' || $range_opt !== '' || $platform !== '' || $metode !== ''): ?>
                <p class="mt-3 text-warning small">
                    <i class="bi bi-funnel-fill me-1"></i> Menampilkan hasil filter aktif — <a href="index.php" class="text-warning text-decoration-underline">Reset Filter</a>
                </p>
                <?php endif; ?>

                <div class="mt-4 pt-3 border-top border-secondary border-opacity-25">
                    <div class="d-flex flex-wrap gap-2">
                        <a href="index.php?fitur=mitra_online" class="btn btn-sm btn-outline-light rounded-pill <?= $fitur=='mitra_online'?'active':'' ?>">🛵 Platform Online</a>
                        <a href="index.php?fitur=metode_bayar" class="btn btn-sm btn-outline-light rounded-pill <?= $fitur=='metode_bayar'?'active':'' ?>">📱 Pembayaran</a>
                        <a href="index.php?fitur=halal" class="btn btn-sm btn-outline-light rounded-pill <?= $fitur=='halal'?'active':'' ?>">✓ Halal</a>
                        <a href="index.php?fitur=kategori_rasa" class="btn btn-sm btn-outline-light rounded-pill <?= $fitur=='kategori_rasa'?'active':'' ?>">🌶️ Rasa Pedas</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="stats-strip">
    <div class="container">
        <div class="row g-3 justify-content-center">
            <?php
            $total     = $pdo->query("SELECT COUNT(*) FROM UMKM")->fetchColumn();
            $halal     = $pdo->query("SELECT COUNT(*) FROM UMKM WHERE status_halal = 'Ada'")->fetchColumn();
            $online    = 0; 
            try { $online = $pdo->query("SELECT COUNT(DISTINCT id_umkm) FROM UMKM_MITRA_ONLINE WHERE status = 'Aktif'")->fetchColumn(); } catch(Exception $e) {}
            ?>
            <div class="col-4 col-md-3 stat-item">
                <div class="num"><?= $total ?></div>
                <div class="label">Total UMKM</div>
            </div>
            <div class="col-4 col-md-3 stat-item">
                <div class="num"><?= $halal ?></div>
                <div class="label">Bersertifikat Halal</div>
            </div>
            <div class="col-4 col-md-3 stat-item">
                <div class="num"><?= $online ?></div>
                <div class="label">Tersedia Online</div>
            </div>
        </div>
    </div>
</div>

<section class="py-5">
    <div class="container">
        <div class="d-flex flex-column flex-md-row align-items-md-end justify-content-between mb-4 gap-2">
            <div>
                <div class="section-label">Direktori Kuliner</div>
                <h2 class="section-title mb-0">
                    <?= $filter_buka === 'buka' ? 'Warung yang Sedang Buka' : ($search !== '' ? 'Hasil Pencarian' : 'Semua UMKM di KPAD') ?>
                </h2>
            </div>
            <span class="text-muted small"><?= count($umkm_list) ?> warung ditemukan</span>
        </div>

        <?php if (empty($umkm_list)): ?>
        <div class="empty-state">
            <i class="bi bi-emoji-frown d-block"></i>
            <p>Tidak ada warung kuliner yang cocok dengan filter pencarian Anda saat ini.<br></p>
            <a href="index.php" class="btn btn-outline-secondary btn-sm mt-2">Lihat Semua</a>
        </div>
        <?php else: ?>
        <div class="row g-4">
            <?php foreach ($umkm_list as $umkm): ?>
            <div class="col-6 col-md-4 col-lg-3">
                <a href="detail.php?id=<?= $umkm['id_umkm'] ?>" class="text-decoration-none text-dark d-block h-100">
                    <div class="umkm-card card">
                        <div class="card-img-wrap">
                            <?php if (!empty($umkm['jam_buka']) && !empty($umkm['jam_tutup'])): ?>
                                <?php if ($umkm['is_open']): ?>
                                    <span class="status-badge bg-success text-white">● Buka</span>
                                <?php else: ?>
                                    <span class="status-badge bg-danger text-white">● Tutup</span>
                                <?php endif; ?>
                            <?php else: ?>
                                <span class="status-badge bg-secondary text-white">Jam N/A</span>
                            <?php endif; ?>
                            <?php if (!empty($umkm['link_dokumentasi'])): ?>
                                <?php if (strpos($umkm['link_dokumentasi'], 'http') !== false): ?>
                                    <img src="<?= konversi_link_drive($umkm['link_dokumentasi']) ?>" class="card-img-top" alt="<?= htmlspecialchars($umkm['nama_umkm']) ?>" onerror="this.onerror=null; this.src='https://placehold.co/600x400?text=Akses+Drive+Terbatas';">
                                <?php else: ?>
                                    <img src="gambar_umkm/<?= htmlspecialchars($umkm['link_dokumentasi']) ?>" class="card-img-top" alt="<?= htmlspecialchars($umkm['nama_umkm']) ?>" onerror="this.onerror=null; this.src='https://placehold.co/600x400?text=Foto+Tidak+Ditemukan';">
                                <?php endif; ?>
                            <?php else: ?>
                                <div class="card-img-placeholder"><i class="bi bi-shop"></i><small style="font-size:0.65rem; margin-top:6px; color:#b84a00; font-weight:600;"><?= htmlspecialchars($umkm['nama_umkm']) ?></small></div>
                            <?php endif; ?>

                            <?php
                            $status = $umkm['status_halal'];
                            if ($status === 'Ada'):
                            ?>
                            <span class="halal-badge badge-halal">✓ Halal</span>
                            <?php elseif ($status === 'Proses'): ?>
                            <span class="halal-badge badge-proses">⏳ Proses</span>
                            <?php else: ?>
                            <span class="halal-badge badge-tidak">Belum Halal</span>
                            <?php endif; ?>
                        </div>

                        <div class="card-body">
                            <div class="card-title"><?= htmlspecialchars($umkm['nama_umkm']) ?></div>
                            <div class="card-rating">
                                <?php if ($umkm['total_ulasan'] > 0): ?>
                                    <i class="bi bi-star-fill"></i>
                                    <span class="rating-score"><?= number_format($umkm['avg_rating'], 1) ?></span>
                                    <span class="rating-count">(<?= $umkm['total_ulasan'] ?> ulasan)</span>
                                <?php else: ?>
                                    <i class="bi bi-star text-muted"></i>
                                    <span class="rating-count text-muted">Belum ada ulasan</span>
                                <?php endif; ?>
                            </div>
                            <div class="card-desc"><?= htmlspecialchars($umkm['deskripsi_umkm']) ?></div>
                            <div class="card-loc">
                                <i class="bi bi-geo-alt-fill"></i><span><?= htmlspecialchars($umkm['patokan']) ?></span>
                            </div>
                            <div class="card-operasional text-muted">
                                <div><i class="bi bi-calendar3"></i><span><?= htmlspecialchars($umkm['hari_buka'] ?? 'Jam belum diatur') ?></span></div>
                                <?php if (!empty($umkm['jam_buka']) && !empty($umkm['jam_tutup'])): ?>
                                <div><i class="bi bi-clock"></i><span><?= date('H:i', strtotime($umkm['jam_buka'])) ?> - <?= date('H:i', strtotime($umkm['jam_tutup'])) ?> WIB</span></div>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <?php endforeach; ?>
        </div>
        <?php endif; ?>
    </div>
</section>

<footer>
    <div class="container">
        <p class="mb-1">🍜 <span>JajanKPAD</span> — Direktori Kuliner Kawasan KPAD Gegerkalong, Bandung</p>
        <p class="mb-0">Dibuat dengan ❤️ untuk Tugas Besar DBMS</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>