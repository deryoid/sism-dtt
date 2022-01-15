-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 15 Jan 2022 pada 08.42
-- Versi server: 5.7.34
-- Versi PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_sismrdtt`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(25) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `ket`) VALUES
(1, 'Penting', 'Kategori ini ditujukan untuk surat yang penting dan harus segera di tanggapi.'),
(2, 'Undangan', 'Kategori ini ditujukan untuk surat yang berjenis undangan.'),
(3, 'Perjalanan Dinas', 'Kategori ini ditujukan untuk surat yang berjenis perjalanan dinas.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_peg` int(11) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jabatan` varchar(25) NOT NULL,
  `golongan` varchar(25) NOT NULL,
  `jk` varchar(16) NOT NULL,
  `agama` varchar(17) NOT NULL,
  `tmp_lhr` varchar(25) NOT NULL,
  `tgl_lhr` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_peg`, `nip`, `nama`, `jabatan`, `golongan`, `jk`, `agama`, `tmp_lhr`, `tgl_lhr`) VALUES
(1, '62410000823777', 'H. Amrin H.Maming', 'KASI', 'III D', 'Laki - Laki', 'Islam', 'Batu Licin', '1965-05-01'),
(2, '12414512512333', 'H. Jumai Dzalal', 'Sekertaris ', 'III D', 'Laki - Laki', 'Islam', 'Bati Bati', '1966-11-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `id_sk` int(11) NOT NULL,
  `no_surat` varchar(100) NOT NULL,
  `tgl_kirim` date NOT NULL,
  `tujuan` varchar(150) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `ket_surat` text NOT NULL,
  `status_admin` varchar(18) NOT NULL,
  `status_pimpinan` varchar(18) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id_sm` int(11) NOT NULL,
  `no_surat` varchar(100) NOT NULL,
  `tgl_terima` date DEFAULT NULL,
  `pengirim` varchar(150) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `ket_surat` text NOT NULL,
  `status_admin` varchar(18) DEFAULT NULL,
  `status_pimpinan` varchar(18) DEFAULT NULL,
  `tanggapan` text,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_pd`
--

CREATE TABLE `surat_pd` (
  `id_spd` int(11) NOT NULL,
  `no_surat` varchar(100) NOT NULL,
  `tgl_pd` date NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `ket_spd` text NOT NULL,
  `tujuan_pd` varchar(50) NOT NULL,
  `keperluan_pd` varchar(200) NOT NULL,
  `status_admin` varchar(18) NOT NULL,
  `status_pimpinan` varchar(18) NOT NULL,
  `tanggapan` text NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `role`) VALUES
(1, 'Ilham', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Super Admin'),
(2, 'H. Gaffar', 'kepala', '870f669e4bbbfa8a6fde65549826d1c4', 'Kepala'),
(3, 'Rukayah', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'User');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_peg`);

--
-- Indeks untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id_sk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id_sm`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `surat_pd`
--
ALTER TABLE `surat_pd`
  ADD PRIMARY KEY (`id_spd`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_peg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  MODIFY `id_sk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id_sm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `surat_pd`
--
ALTER TABLE `surat_pd`
  MODIFY `id_spd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD CONSTRAINT `surat_keluar_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD CONSTRAINT `surat_masuk_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `surat_pd`
--
ALTER TABLE `surat_pd`
  ADD CONSTRAINT `surat_pd_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
