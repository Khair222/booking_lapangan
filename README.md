🌐 Booking Lapangan

Aplikasi untuk manajemen pemesanan lapangan olahraga.

🍽️ Sport Arena Management

Aplikasi Booking Lapangan ini merupakan sebuah sistem pemesanan lapangan berbasis mobile yang dikembangkan menggunakan Flutter dan Dart, serta menggunakan REST API berbasis PHP dan MySQL untuk komunikasi data antara aplikasi dan server. Aplikasi ini dirancang untuk memudahkan pengguna dalam melakukan pemesanan lapangan untuk berbagai kegiatan olahraga.

🎨 Booking Lapangan

Aplikasi untuk manajemen pemesanan lapangan olahraga.

🍽️ Sport Arena Management

Aplikasi Booking Lapangan ini merupakan sebuah sistem pemesanan lapangan berbasis mobile yang dikembangkan menggunakan Flutter dan Dart, serta menggunakan REST API berbasis PHP dan MySQL untuk komunikasi data antara aplikasi dan server. Aplikasi ini dirancang untuk memudahkan pengguna dalam melakukan pemesanan lapangan untuk berbagai kegiatan olahraga.

Aplikasi ini dikembangkan sebagai bagian dari praktikum Mobile Programming dengan tujuan untuk:

Membuat sistem pemesanan lapangan yang efisien dan user-friendly.

Mengintegrasikan berbagai fitur yang memudahkan pengguna dalam melakukan pemesanan dan pengelolaan lapangan.

Membangun aplikasi yang mengutamakan UI/UX modern, dengan desain yang bersih dan mudah digunakan.

Mengimplementasikan manajemen state yang terstruktur menggunakan konsep yang sesuai dalam Flutter.

Menerapkan sistem integrasi data real-time melalui REST API untuk memastikan informasi pemesanan dapat dikelola secara efisien.

📁 Struktur Repositori

Repositori ini terdiri dari dua bagian utama: frontend Flutter dan backend REST API.

1️⃣ Flutter Mobile App (/flutter_app/)

Komponen aplikasi mobile yang dibangun menggunakan Flutter.

Berisi folder-folder berikut:

lib/
 ├── screens/
 │    ├── about_app_screen.dart
 │    ├── all_fields_screen.dart
 │    ├── booking_screen.dart
 │    ├── check_booking_screen.dart
 │    ├── help_support_screen.dart
 │    ├── history_screen.dart
 │    ├── home_screen.dart
 │    ├── login_screen.dart
 │    ├── main_screen.dart
 │    ├── payment_screen.dart
 │    ├── profile_screen.dart
 │    ├── registration_screen.dart
 │    ├── settings_screen.dart
 │    ├── splash_screen.dart
 │    ├── topup_screen.dart
 ├── components/
 │    ├── booking_repository.dart
 │    ├── dummy_data.dart
 │    ├── widgets.dart
 ├── api/
 │    ├── api_service.dart
 ├── models/
 │    ├── models.dart
 ├── theme/
 │    ├── theme.dart
 └── main.dart

2️⃣ REST API Backend (/api/)

Backend PHP yang wajib ditempatkan di:

C:/xampp/htdocs/booking_lapangan_api/


Isi folder:

connection-pdo.php — koneksi database

login.php — Menangani proses login pengguna

register.php — Mengelola pendaftaran pengguna baru, menyimpan data pengguna ke dalam database.

create_booking.php — Digunakan untuk menangani pembuatan pemesanan lapangan baru

get_fields.php — Mengambil data lapangan yang tersedia, seperti jenis lapangan, waktu, dan ketersediaan

dll.

Server dijalankan melalui XAMPP (Apache + MySQL). Frontend Flutter mengakses backend melalui IPv4 / localhost.

🎨 Prinsip UI/UX yang Digunakan
✔ Visual Hierarchy

Pemisahan informasi dengan warna dan ukuran berbeda, seperti nama pengguna dan tombol kategori olahraga, memudahkan pengguna untuk fokus pada elemen yang penting.

✔ Recognition Over Recall

Ikon-ikon seperti pencarian, profil, riwayat, dan notifikasi mudah dikenali tanpa memerlukan penjelasan teks tambahan.

✔ Consistency

Elemen desain seperti tombol dan kategori olahraga memiliki tampilan yang seragam di seluruh aplikasi, memberikan pengalaman pengguna yang konsisten.

✔ Efficient Workflow

Navigasi yang sederhana dan tombol aksi yang terjangkau memastikan alur yang cepat dan efisien.

✔ Feedback

Pesan "Login berhasil!" memberi umpan balik langsung kepada pengguna mengenai status login mereka.

✔ Accessibility

Kontras warna yang cukup antara tombol, teks, dan latar belakang memudahkan pembacaan bagi semua pengguna.

🍽️ Fitur Utama Aplikasi
🔑 Autentikasi Login

Pengguna dapat mendaftar dan login menggunakan username dan password. Semua data pengguna disimpan dalam database melalui API berbasis PHP dan MySQL.

🏠 Halaman Utama

Menampilkan ringkasan lapangan yang tersedia untuk dipesan.

Ringkasan pemesanan aktif dan status lapangan saat ini (tersedia, sedang dibooking, atau tidak tersedia).

Preview aktivitas lapangan untuk memberikan informasi kepada pengguna mengenai waktu yang tersedia.

🪑 Table Layout

Menampilkan semua lapangan dengan status yang berbeda menggunakan warna yang jelas:

🟢 Available: Lapangan tersedia untuk pemesanan.

🟡 Cleaning: Lapangan sedang dibersihkan.

🔴 Booked: Lapangan sudah dibooking.

Data lapangan diambil secara real-time dari tables_view_status.php di backend.

🍜 Pemesanan Lapangan

Pengguna dapat memilih jenis lapangan, waktu, dan durasi pemesanan yang diinginkan.

Sistem akan menampilkan ketersediaan lapangan secara langsung untuk memudahkan pemilihan waktu yang tepat.

🧾 Riwayat Pemesanan

Pengguna dapat melihat riwayat pemesanan lapangan mereka sebelumnya, termasuk detail waktu dan lapangan yang dipesan.

Halaman ini juga memungkinkan pengguna untuk melakukan pembatalan atau perubahan pemesanan jika diperlukan.

💳 Pembayaran Online

Pengguna dapat melakukan pembayaran secara online untuk pemesanan lapangan melalui aplikasi.

Sistem pembayaran yang terintegrasi mendukung berbagai metode pembayaran (meskipun hanya simulasi untuk saat ini).

⭐ Rating & Ulasan

Pengguna dapat memberikan rating dan ulasan mengenai pengalaman mereka menggunakan lapangan.

Ulasan ini membantu pengguna lain dalam memilih lapangan yang paling sesuai dengan kebutuhan mereka.

🌐 Integrasi REST API

Aplikasi menggunakan HTTP GET & POST untuk komunikasi antara aplikasi mobile dan backend server.

📌 Contoh Operasi API:
1. GET Login
http://your-ip/booking_lapangan_api/login.php?username=admin&password=12345

2. GET Available Fields
http://your-ip/booking_lapangan_api/get_fields.php?category=Futsal

3. POST Update Field Availability
POST → update_field_availability.php
{
  "field_id": "F_01",
  "available": "1"
}

4. POST Create Booking

Mengirim JSON body untuk melakukan pemesanan lapangan:

{
  "user_id": "U_01",
  "field_id": "F_01",
  "booking_time": "2025-12-10 10:00",
  "duration": "2 hours",
  "payment_method": "Credit Card"
}

🧪 Testing & Debugging

Aplikasi diuji menggunakan:

📱 Perangkat Fisik

Developer Mode → USB Debugging

Menggunakan flutter run (Flutter Team, 2025)

⚡ Hot Reload / Hot Restart

r → inject perubahan ke Dart VM

R → reload aplikasi dari awal
Fitur ini mempercepat iterasi pengembangan UI (Flutter Team, 2025).

🛠️ Persyaratan Sistem

Flutter SDK 3.19+

Dart SDK 3.5+

Android Studio / VS Code

XAMPP (Apache + MySQL)

Perangkat fisik Android (opsional, rekomendasi untuk testing API)

🚀 Cara Menjalankan
1️⃣ Clone Repo
https://github.com/Khair222/booking_lapangan.git

2️⃣ Install Dependencies
flutter pub get

3️⃣ Jalankan Backend

Copy folder /api ke:
C:/xampp/htdocs/booking_lapangan_api/

Jalankan Apache + MySQL dari XAMPP

Import database .sql ke phpMyAdmin

4️⃣ Jalankan Aplikasi
flutter run

📚 Struktur Data & Database

Aplikasi menggunakan database MySQL dengan tabel:

Tables:

users

fields (lapangan)

bookings (pemesanannya)

🎉 Terima Kasih!

Selamat menggunakan dan mengembangkan aplikasi Booking Lapangan. Jika Anda membutuhkan ikon, dokumentasi PDF, atau diagram gambar, beri tahu saya!
