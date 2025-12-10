# Health Online

Aplikasi **Health Online** adalah aplikasi konsultasi kesehatan sederhana berbasis Flutter.  
Aplikasi ini dibuat sebagai tugas project Flutter dengan fitur utama seperti daftar dokter, jadwal konsultasi, rekam medis, serta profil pasien.

---

## 1. Nama Aplikasi

**Health Online – Aplikasi Konsultasi Kesehatan Online**

---

## 2. Deskripsi Singkat

Health Online membantu pengguna (pasien) untuk:

- Melihat ringkasan kesehatan dan tips kesehatan harian.
- Melihat daftar dokter yang tersedia beserta spesialisasi, rating, dan pengalaman.
- Melihat jadwal konsultasi yang sudah dibuat.
- Melihat rekam medis secara ringkas.
- Mengelola informasi profil pasien.

Aplikasi ini juga dilengkapi **Dark Mode** dan **Navigation Drawer** untuk pengalaman penggunaan yang lebih nyaman.

---

## 3. Fitur

### a. Beranda
- Menampilkan sapaan “Pasien Sehat”.
- Kartu **Ringkasan Kesehatan**.
- **Layanan Cepat**:
  - Chat Dokter (navigasi ke tab Dokter).
  - Video Call (menampilkan SnackBar “dalam pengembangan”).
- Daftar **Tips Kesehatan Hari Ini**.

### b. Dokter
- Menampilkan daftar dokter:
  - Nama dokter.
  - Spesialisasi.
  - Rating.
  - Tahun pengalaman.
- Foto dokter menggunakan asset lokal (`assets/dokter1.jpg`, `assets/dokter2.jpeg`, `assets/dokter3.jpg`).
- Tombol **Booking** (menampilkan SnackBar ketika ditekan).

### c. Jadwal
- Menampilkan list jadwal konsultasi:
  - Nama dokter.
  - Tanggal.
  - Jam.
  - Tipe konsultasi (Chat / Video Call).
- Tap item jadwal akan menampilkan detail singkat melalui SnackBar.

### d. Rekam Medis
- Menampilkan daftar riwayat rekam medis:
  - Tanggal kunjungan.
  - Nama dokter.
  - Diagnosa singkat.

### e. Profil
- Menampilkan informasi profil pasien:
  - Foto profil dari asset (`assets/profile.jpg`).
  - Nama pasien.
  - Email.
  - Nomor rekam medis.
- Menu:
  - Pengaturan Akun.
  - Privasi & Keamanan.
  - Keluar (SnackBar “logout dummy”).

### f. Navigation Drawer
- Akses lewat ikon ☰ di AppBar.
- Menu navigasi ke:
  - Beranda
  - Dokter
  - Jadwal Konsultasi
  - Rekam Medis
  - Profil
- Switch **Dark Mode** (on/off) yang mengubah tema seluruh aplikasi.

### g. Bottom Navigation Bar
- 5 menu utama:
  1. Beranda
  2. Dokter
  3. Jadwal
  4. Rekam
  5. Profil (paling kanan)

---

## 4. Cara Menjalankan Project

### Prasyarat

- Flutter SDK terinstal (disarankan **Flutter 3.x** atau yang lebih baru).
- Android Studio / VS Code dengan plugin Flutter & Dart.
- Device:
  - Emulator Android / iOS, atau
  - Perangkat fisik yang sudah diaktifkan mode developer.

### Langkah-langkah

1. **Clone repository**
   https://github.com/Dico19/Apk-Health-Mesti.git
   cd Apk-Health-Mesti

2. **Install dependencies**
    flutter pub get

3. **Jalankan aplikasi**
    flutter run

4. **Pilih emulator atau device yang tersedia, lalu aplikasi akan berjalan dengan halaman Beranda sebagai tampilan awal**

---

## 5. Screenshot Halaman Utama

---

## 6. Contoh Commit Message yang Jelas
    git commit -m "feat: tambah bottom navigation 5 tab dan halaman rekam medis"
