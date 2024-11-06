# eshop-pbp-mobile
<details>
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
<details open>
<summary><h2>Tugas 8</h2></summary>

## 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
Const berguna untuk membuat widget atau objek yang immutable atau tidak dapat diubah-ubah setelah dibuat. Dengan const, inisialisasi objek cukup sekali sehingga hemat memori dan cepat untuk di-retrieve karena sifatnya yang tidak akan berubah. Const berguna untuk membuat widget stateless atau statis dengan nilai yang sudah diketahui. Sebaiknya const tidak digunakan dalam widget yang stateful dan memerlukan perubahan data secara dinamis.

## 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Column mengatur widget secara vertikal, sedangkan row mengatur widget secara horizontal. 
Contoh column:
```
Column(
  children: [
    Text("A"),
    Text("B"),
    Text("C"),
  ],
)
```
Contoh row:
```
Row(
  children: [
    Text("A"),
    Text("B"),
    Text("C"),
  ],
)
```

## 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
### Elemen input yang saya gunakan adalah:
- TextFormField: diimplementasikan untuk menerima input name, price, dan description
- ElevatedButton: diimplementasikan untuk membuat save button
### Terdapat beberapa elemen input flutter lain yang tidak saya implementasikan pada tugas ini yaitu:
- Checkbox: berguna untuk membuat input berupa opsi yang bisa dipilih lebih dari satu
- DropdownButton: berguna untuk membuat input berupa opsi dengan maksimal pilihan 1, dan terdapat banyak pilihan
- Radio: berguna untuk membuat input berupa opsi dengan maksimal pilihan 1, dan terdapat sedikit pilihan
- Slider: berguna untuk membuat input dengan range tertentu

## 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Tema dapat diatur secara global di MaterialApp pada main.dart:
```
return MaterialApp(
      title: 'YumYum Bakeshop',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ).copyWith(
          primary: Colors.red.shade900,
          secondary: Colors.red.shade700,
        ),  
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
```
Pada pengaturan ini, saya mengimplementasikan warna merah gelap atau maroon sebagai warna utama dari aplikasi ini. Pengaturan ini diimplementasi pada aplikasi melalui kode berikut pada menu.dart:
```
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
```

## 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Navigasi page dapat dilakukan melalui Navigator dan MaterialPageRoute. Navigator akan memungkinkan push untuk menambahkan halaman baru ke stack,atau pop untuk kembali ke halaman sebelumnya. MaterialPageRoute membuat koneksi kepada halaman yang dituju dengan transisi untuk memperhalus pergantian halaman. Berikut implementasinya dalam kode saya:
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => BakesEntryFormPage(),
  ),
);

```

</details>