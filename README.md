# Integrated Decision Platform (IDP) - Jasa Marga 🛣️

Aplikasi mobile dashboard **Integrated Decision Platform (IDP)** untuk Jasa Marga. Repository ini berfokus pada **UI Slicing & Front-End Implementation** berdasarkan desain Figma resmi dengan penekanan pada akurasi visual, *component reusability*, dan antarmuka yang responsif.

---

## 📌 Deskripsi Project

Project ini merupakan hasil pekerjaan magang berupa implementasi antarmuka (*front-end*) aplikasi mobile **IDP Jasa Marga**. IDP dirancang untuk membantu pemantauan lalu lintas, analisis data real-time, serta pengambilan keputusan strategis operasional jalan tol.

### Focus & Scope Pengerjaan:
- 🎨 **Pixel-Perfect UI Slicing** dari Figma ke Flutter.
- 🧩 **Modular & Reusable Components** (Custom Cards, Charts, Status Indicators, Buttons).
- 📱 **Responsive Layout** untuk berbagai ukuran layar perangkat mobile.
- ⚡ **Mock / Dummy Data Integration** untuk simulasi tampilan data dinamis.

---

## 📁 Struktur Folder Project

Project ini menggunakan pendekatan **Feature-First Architecture** agar struktur kode rapi dan mudah di-maintenance:

```text
lib/
├── core/
│   ├── constants/       # Color palette, Typography, & Asset paths
│   ├── theme/           # Konfigurasi Light/Dark Theme
│   └── widgets/         # Komponent UI Reusable (Custom Button, Input, Card Header)
├── dummy_data/          # Mock data untuk simulasi tampilan dinamis
├── features/            # Fitur & Modul Slicing Figma
│   ├── auth/            # Halaman Login / Authentication UI
│   ├── dashboard/       # Dashboard Utama (Traffic, Alert Summary)
│   ├── monitoring/      # Halaman Monitoring & Detail Traffic
│   └── analytics/       # Halaman Laporan & Decision Analytics
└── main.dart            # Entry point aplikasi
