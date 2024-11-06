# eshop-pbp-mobile
<details open>
<summary><h2>Tugas 7</h2></summary>

## 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Stateless widget adalah widget yang tidak dapat menyimpan state sehingga tidak dapat diubah tanpa di-build ulang. Umumnya stateless widget digunakan pada data static. Sebaliknya, stateful widget menyimpan state dan dapat berubah sewaktu-waktu. Widget ini dapat merespons terhadap perubahan data dan memperbarui tampilan.

## 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
- Scaffold: Dasar untuk membuat tampilan halaman lainnya
- AppBar: Banner di atas untuk menampilkan judul aplikasi
- SnackBar: Popup message di bawah layar untuk memberi feedback ketika user menekan tombol
- Card: Menyimpan teks berupa informasi NPM, Nama, dan Kelas secara individu, tersusun, dan rapih
## 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() berfungsi untuk melakukan update pada tampilan aplikasi, umumnya digunakan pada stateful widget. Semua variabel yang terikat pada state tersebut akan terpengaruhi.
## 4. Jelaskan perbedaan antara const dengan final.
Const dan final keduanya memiliki nilai yang tidak bisa diubah, namun perbedaannya terletak pada inisiasi variabel. Pada const, kita harus tau nilai dari variabel tersebut sebelum di kompilasi, sehingga perlu nilai pasti. Pada final, kita bisa mendapatkan nilai tersebut saat runtime, misal berupa jam program tersebut dijalankan.
## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
### Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
Menjalankan ```flutter create eshop_pbp``` untuk membuat project flutter baru.

### Membuat tiga tombol sederhana dengan ikon dan teks untuk: Melihat daftar produk (Lihat Daftar Produk), Menambah produk (Tambah Produk), Logout (Logout)

Membuat items yaitu button dengan warna spesifik untuk setiap button:
```
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.cake, Colors.yellow.shade800),
    ItemHomepage("Tambah Produk", Icons.add, Colors.green.shade600),
    ItemHomepage("Logout", Icons.logout, Colors.red.shade400),
  ];
```
Buat item homepage untuk menerima 3 variabel:
```
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
```

### Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
Membuat dan memasukkan variabel color pada setiap item dalam list ItemHomepage seperti ```Colors.yellow.shade800```
dan memprosesnya dalam penampilan 
```
return Material(
      color: item.color, 
      ...
```

### Memunculkan Snackbar dengan tulisan: "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan. "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan. "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
Membuat button menampilkan pesan ketika diketuk:
```
onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
```

</details>