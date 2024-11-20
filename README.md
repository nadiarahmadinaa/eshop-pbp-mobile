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

<details>
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
<details open>
<summary><h2>Tugas 9</h2></summary>

## 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Model diperlukan untuk mengubah data JSON menjadi objek Dart sehingga bisa diakses secara langsung, tanpa harus di-parsing ulang saat pemanggilan. Selain itu, kita dapat memvalidasi data dan mengubahnya ke tipe data yang sesuai (semisal, string akan error ketika diambil dan dilakukan operasi matematika). Dengan tipe data yang sudah sesuai, kita menghindari runtime error dalam kode-kode selanjutnya.

## 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini.
Library http berfungsi untuk melakukan pengiriman http request, mengambil data dalam format json, serta menyediakan fungsi asynchronous seperti async await agar proses dapat berjalan sembari user mengakses hal lain.

## 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest berfungsi untuk menyimpan session cookie atau cookie lainnya. Dengan fungsi ini, cookie akan otomatis masuk ke dalam header ketika melakukan request http. CookieRequest perlu dibagian ke seluruh komponen Flutter untuk menjaga session user sehingga data tersimpan dan tetap logged in meskipun pindah halaman.

## 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Dalam aplikasi Flutter, user akan memberikan input. Ketika button save atau semacamnya di-klik, input tersebut akan dikemas dalam bentuk JSON dan dikirimkan ke server Django dengan bantuan http library dari Flutter. Django akan menerima input, memvalidasi, dan memasukannya ke database. Kemudian, ketika kita membuka halaman untuk menampilkan data, kita akan melakukan request kepada Django server untuk mengambil json data dari api (dalam kasus tugas ini, secara asinkronus). Setelah itu data di-parse dan ditampilkan pada aplikasi Flutter.

## 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Ketika register, kita membuat request POST kepada server Django untuk menambahkan kredensial kita ke database. Setelah data tervalidasi, kita akan di-redirect ke halaman login. Jika tidak valid, akan ada tampilan error.

Saat login, kita mengirimkan data kembali ke server Django dimana dilakukan validasi melalui authenticate(). Jika sudah tervalidasi maka sesi baru akan terbuat dan cookies disimpan oleh CookieRequest.

Ketika logout, kita akan mengirim request ke Django server dimana akan diproses oleh modul authenticate() untuk logout.

## 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
Membuat fungsi untuk register di auth pada Django, kemudian menghubungkannya dengan interface register aplikasi pada lib/screens/register.dart
```
final response = await request.postJson(
                          "http://127.0.0.1:8000/auth/register/",
                          jsonEncode({
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                          }));
```
### Membuat halaman login pada proyek tugas Flutter.
Membuat fungsi untuk login di auth pada Django, kemudian menghubungkannya dengan interface login aplikasi pada lib/screens/login.dart
```
final response = await request
                          .login("http://127.0.0.1:8000/auth/login/", {
                        'username': username,
                        'password': password,
                      });
```

### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
Agar user tetap terautentikasi, proyek ini menerapkan penyimpanan session cookie melalui:
```
final request = context.watch<CookieRequest>();
```

### Membuat model kustom sesuai dengan proyek aplikasi Django.
Membuat model pada lib/models/bakes_entry.dart. Model ini dikustomisasi dengan fields yang digunakan dalam JSON sehingga menciptakan Dart object dengan attribute field yang sesuai.
```
class BakesEntry {
    String model;
    String pk;
    Fields fields;

    BakesEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory BakesEntry.fromJson(Map<String, dynamic> json) => BakesEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    String description;
    int price;
    DateTime productionDate;

    Fields({
        required this.name,
        required this.description,
        required this.price,
        required this.productionDate,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        productionDate: DateTime.parse(json["production_date"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "production_date": "${productionDate.year.toString().padLeft(4, '0')}-${productionDate.month.toString().padLeft(2, '0')}-${productionDate.day.toString().padLeft(2, '0')}",
    };
}
```

### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy. Tampilkan name, price, dan description dari masing-masing item pada halaman ini.
Menampilkan data melalui listview pada halaman untuk tampil:
```
return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.description}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.price}"),
                    ],
                  ),
                ),
              );
```

### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item. Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item. Tampilkan seluruh atribut pada model item kamu pada halaman ini. Tambahkan tombol untuk kembali ke halaman daftar item.
Membuat route untuk ketika dipencet akan menuju ke details di list_bakesentry.dart
```
onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BakesDetailPage(
                          bakesEntry: snapshot.data![index],
                        ),
                      ),
                    );
                  },
```
Membuat bakes_detail_page.dart yang berisi semua info:
```
children: [
            Text(
              bakesEntry.fields.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Description:",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              bakesEntry.fields.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Price: Rp ${bakesEntry.fields.price}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back to List"),
            ),
          ],
```
 
### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
Data dari /json sudah di filter berdasarkan user yang logged in sehingga data yang ditampilkan pada aplikasi Flutter juga akan menyesuaikan.
</details>