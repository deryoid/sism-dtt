<?php
include '../../config/config.php';
include '../../config/koneksi.php';

$no = 1;

if (isset($_POST['cetak'])) {
    $tgl1 = $_POST['tgl1'];
    $tgl2 = $_POST['tgl2'];

    $data = $koneksi->query("SELECT * FROM
    surat_keluar AS sk 
    LEFT JOIN pegawai AS p ON sk.id_peg = p.id_peg
    LEFT JOIN kategori AS k ON sk.id_kategori = k.id_kategori
    WHERE sk.tgl_kirim BETWEEN '$tgl1' AND '$tgl2' ORDER BY sk.tgl_kirim ASC");
}

if (isset($_POST['c1'])) {
    $kategori = $_POST['id_kategori'];

    $data = $koneksi->query("SELECT * FROM
    surat_keluar AS sk 
    LEFT JOIN pegawai AS p ON sk.id_peg = p.id_peg
    LEFT JOIN kategori AS k ON sk.id_kategori = k.id_kategori
    WHERE sk.id_kategori = '$kategori'");
}


$bln = array(
    '01' => 'Januari',
    '02' => 'Februari',
    '03' => 'Maret',
    '04' => 'April',
    '05' => 'Mei',
    '06' => 'Juni',
    '07' => 'Juli',
    '08' => 'Agustus',
    '09' => 'September',
    '10' => 'Oktober',
    '11' => 'November',
    '12' => 'Desember'
);

?>

<script type="text/javascript">
    window.print();
</script>

<!DOCTYPE html>
<html>

<head>
    <title>LAPORAN DATA </title>
</head>

<body>
<img src="<?= base_url('assets/dist/img/logo2.png') ?>" align="left" width="90" height="90">
    <p align="center"><b>
        <font size="5" align="center">DEWAN PERWAKILAN RAKYAT DAERAH </font> <br>
        <font size="5" align="center">KABUPATEN KOTABARU</font><br>
        <font size="2">Jl. H. AGUSSALIM NO. 01</font><br>
        <font size="2">Telpon (0518) 22898, 22899, (0518) 23655</font><br>
        <hr size="2px" color="black">
        </b></p>

    <div class="row">
        <div class="col-sm-12">
            <div class="card-box table-responsive">
                <table border="1" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nomor Surat keluar</th>
                            <th>Tanggal Terima</th>
                            <th>Nama Pegawai</th>
                            <th>Kategori</th>
                            <th>Keterangan Surat</th>
                            <th>Status</th>
                            <th>Tanggapan</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php while ($row = mysqli_fetch_array($data)) { ?>
                            <tr>
                                <td align="center"><?= $no++ ?></td>
                                <td><?= $row['no_surat'] ?></td>
                                <td><?= tgl_indo($row['tgl_kirim']) ?></td>
                                <td><?= $row['nama'] ?></td>
                                <td><?= $row['nama_kategori'] ?></td>
                                <td><?= $row['ket_surat'] ?></td>
                                <td>Verifikasi Admin : <?=  $row['status_admin'] ?><br>
                                Verifikasi Pimpinan :<?=  $row['status_pimpinan'] ?></td>
                                <td><?= $row['tanggapan'] ?></td>
                            </tr>
                        <?php } ?>
                    </tbody>

                </table>

            </div>
        </div>
    </div>
    <br>

    </div>


</body>

</html>

<script>
    <?php
    function tgl_indo($tanggal)
    {
        $bulan = array(
            1 =>   'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Agustus',
            'September',
            'Oktober',
            'November',
            'Desember'
        );
        $pecahkan = explode('-', $tanggal);

        // variabel pecahkan 0 = tanggal
        // variabel pecahkan 1 = bulan
        // variabel pecahkan 2 = tahun

        return $pecahkan[2] . ' ' . $bulan[(int) $pecahkan[1]] . ' ' . $pecahkan[0];
    }

    ?>
</script>