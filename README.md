# counter_7

#Tugas 9

# Assignment 9: Web Service Integration in Flutter

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Hal tersebut mungkin untuk dilakukan yang mana kita membuat dynamic map dari JSON dan mengakses nilainya seperti dictionary dengan python ('data[key]'). Hal tersebut tidak disarankan dikarenakan ada kemungkinan fields yang hilang atau field yang tidak digunakan maupun diharapkan sehingga ada kemungkinan sulitnya dalam pengelolaan dan timbulnya kesalahan. Akan tetapi, hal itu tidak lebih baik daripada membuat model terlebih dahulu.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- ListTile: Berfungsi menampung teks sebagai leading dan trailing dalam bentuk row
- Checkbox: berfungsi untuk membuat checkbox
- TextButton: berfungsi untuk membuat button
- FutureBuilder: berfungsi untuk menampilkan data yang diambil dari API

##  Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
Fungsi fetchWatchlist() mengambil data menggunakan HTTP dan pemanggilan fungsi get dengan instance HTTP.  Fungsi mengembalikan daftar objek 'Mywatchlist'. Pemanggilan fungsi dan penungguan respon oleh FutureBuilder dan ketika pengambilan data telah dilakukan FutureBuilder' mengembalikan 'ListView.builder' yang membangun 'ListTiles' yang mana berisi data yang dipetakan dengan didapatkan dari fungsi 'fetchWatchlist'


## Implementation
1. Buat 'mywatchlist.dart' dan buat kelas 'Mywatchlist'.
2. Buat 'fetch.dart' dan buat fungsi seperti ini untuk mengambil data dari API.
   ```dart
   // fetch.dart
	Future<List<Mywatchlist>> fetchWatchlist() async {
		var url = Uri.parse('https://mocki.io/v1/9c50014e-7061-4f35-9852-d50a9a640dc6');
		var response = await http.get(
				url,
				headers: {
					"Access-Control-Allow-Origin": "*",
					"Content-Type": "application/json",
			},
		);

		// decode response menjadi bentuk json
		var data = jsonDecode(utf8.decode(response.bodyBytes));

		// konversi data json menjadi object MyWatchlist
		List<Mywatchlist> listMyWatchlist = [];

		for (var d in data) {
			if (d != null) {
				listMyWatchlist.add(Mywatchlist.fromJson(d));
			}
		}

		return listMyWatchlist;
	}
	```
3. Buat 'watchlist.dart' dan buat 'MyWatchlistPage StatefulWidget' yang berisi 'FutureBuilder' yang berfungsi untuk pengambilan data menggunakan fungsi 'fetchWatchlist'.
4. Buat 'detail.dart' dan buat 'MyWatchlistDetailPage StatelessWidget' yang berfungsi untuk penampilan data yang akan diteruskan dari 'MyWatchlistPage'.
5. Penerusan data dari 'MyWatchlistPage' ke 'MyWatchlistDetailPage' menggunakan 'Navigator.push'.
    ```dart
	Navigator.push(
		context,
		MaterialPageRoute(
		  builder: (context) =>
			  MyWatchlistDetailPage(
			movie: snapshot.data![index],
		  ),
		));
	```
6. Buat widget 'CheckBox' dan fungsi 'onChanged' untuk Bonus.
    ```dart
	Checkbox(
		activeColor: Colors.limeAccent,
		checkColor: Colors.black,
		focusColor: Colors.lightGreenAccent,
		value: snapshot.data![index].fields.watched,
		onChanged: (bool? value) {
		  setState(() {
			snapshot.data![index].fields.watched =
				value!;
		  });
		},
	)
	```

7. Buat fungsi conditionalWatch untuk menentukan apakah sudah ditonton atau belum (bonus)
  ```conditialWatch(){
    // Apabila movie.fields.watched == true , Maka udah ditonton, selain itu menujukkan belum nonton
  if( movie.fields.watched == true){
        return const Text("Watched",style: TextStyle(fontSize: 16));
  } else{
        return const Text("Not Watched", style: TextStyle(fontSize: 16));
  }
  }
  ```

#Tugas 8
## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement
- Navigator.push: menambahkan route lain ke atas stack dari Navigator
- Navigator.pushReplacement: Mengganti ke route lain yang berada di atas stack setelah ditambah sehingga menghilangkan route lama

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Scaffold: Scaffold merupakan widget yang berfungsi sebagai pengatur struktur tata letak visual desain (layout utama) dari aplikasi
- Appbar: appbar merupakan widget yang berfungsi sebagai header dari aplikasi terletak di bagian atas widget Scaffold dan merupakan bagian utama dari widget Scaffold dan ditampilkan di bagian atas layar
- Center: Center merupakan widget yang berfungsi mengatur child widget ke bagian tengah layar  
- Row & Column: row merupakan widget yang berisi beberapa widget yang diatur secara horizontal, sedangkan column merupakan widget yang berisi widget yang diatur secara vertikal
- Text: text merupakan widget yang digunakan untuk menampilkan teks dalam satu baris di dalam aplikasi
- Form: Containter untuk melakukan grouping terhadap beberapa form field widget
- TextFormField: Input dalam berbentuk field text
- InputDecoration: styling pada input
- DropdownButtonFormField: Memunculkan menu dropdown
- TextButton: Membuat button dengan text di dalamnya

## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed)
- onPressed: Merupakan fungsi ketika user selesai menekan widget maka akan dijalankan
- onSaved: Merupakan fungsi ketika user selesai menyimpan form maka akan dijalankan
- onChanged: Ketika terjadi perubahan pada event

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
Navigator menggunakan `Last In First Out` yang diterapkan pada suatu stack ketika mengganti halaman. Pada nantinya setelah melakukan push, halaman yang berada paling atas atau top of the stack yang akan ditampilkan

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
1. Membuat file drawer.dart yang berisi drawer menu dengan widget drawer yang di route ke counter_7, 
2. Membuat file budget_form.dart untuk membuat form yang berisi elemen input dan dropdown dengan tipe data input masing-masing (String:judul,  int: nominal, dan Datetime: tanggal)
3. Membuat file all.dart yang berisi list budget dalam bentuk global dan menyimpan data yang di-input ke dalam list yang telah dibuat
4. Menampilkan data ke halaman Data Budget dengan melakukan iterasi list












# Tugas7
## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya
  - Widget yang statusnya tidak dapat diubah setelah dibuat atau bersifat immutable selama runtime application disebut sebagai widget stateless. Widget tidak dapat berubah ketika aplikasi berjalan dan properti hanya dapat berubah ketika kita mengatur instance baru untuk widget tertentu. Apabila tidak dilakukan secara demikian, perubahan widget tidak ada terjadi akibat perubahan nilai dari state yang ada selama runtime aplication.
  - Stateful widget propertis nya bersifat mutable, artinya properti dapat diubah dan dapat digambar selama aplikasi sedang berjalan. Hal ini dikarenakan mutable stated disimpan secara terpisah dalam state object yang mana status aplikasi dapat berubah beberapa kali dengan set variabel, input, data yang berbeda. Nilai dari state juga dapat berubah berdasarkan nilai state yang ada selama aplikasi berjalan ketika pengguna berinteraksi dengannya.  

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya
    - Scaffold: Scaffold merupakan widget yang berfungsi sebagai pengatur struktur tata letak visual desain (layout utama) dari aplikasi
    - Appbar: appbar merupakan widget yang berfungsi sebagai header dari aplikasi terletak di bagian atas widget Scaffold dan merupakan bagian utama dari widget Scaffold dan ditampilkan di bagian atas layar
    - Center: Center merupakan widget yang berfungsi mengatur child widget ke bagian tengah layar  
    - Row & Column: row merupakan widget yang berisi beberapa widget yang diatur secara horizontal, sedangkan column merupakan widget yang berisi widget yang diatur secara vertikal
    - Text: text merupakan widget yang digunakan untuk menampilkan teks dalam satu baris di dalam aplikasi
    - Visibility: Visibility merupakan widget untuk menampilkan widget lainnya apabila memenuhi kondisi tertentu.
    - FloatingActionButton: FloatingActionButtons merupakan widget yang berfungsi untuk menambahkan tombol ikon melingkar yang dapat di klik yang biasanya melayang pada layar aplikasi dan mengarahkan pada suatu tindakan terentu.


## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut   
    - fungsi dari setState() adalah untuk memberitahu framework Flutter bahwa sesuatu telah berubah dalam suatu state tersebut sehingga terjadi pembangungan kembali widget dan turunannya dengan menjalankan kembali metode build di bawah sehingga tampilan dapat mencerminkan nilai yang diperbarui.
    - Pada projek ini apabila setState() tidak dipanggil ketika _counter ingin diubah, maka tidak terjadi apa-apa dikarenakan method build tidak dipanggil lagi.
## Jelaskan perbedaan antara const dengan final
    - const: nilai yang tidak dapat diubah 
    - final: nilai yang dapat diubah. 

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
    1. Membuat fungsi _decrementCounter() untuk mengurangi counter
        void _decrementCounter() {
        setState(() {
          
          if (_counter != 0) {
            _counter--;
          }else{
            return; 
          }
          
        });
      }

    2. Menambahkan FloatingActionButton, - pada kiri layar dan + pada kanan layar dan mengatur visibility(bonus) serta melakukan layouting button tersebut 
    floatingActionButton: 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Visibility(
            visible: _counter > 0,
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),

          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          
        ],
        )

    3. Menambahkan fungsi conditialNumber untuk menambahkan Text() yang berisi warna merah pada angka genap dan biru pada angka ganjil. Implementasi code sebagai berikut.
        conditialNumber(){
        // Apabila_counter % 2 == 0, Maka akan menunjukkan "Genap"  dengan warna merah , selain itu menujukkan "Ganjil" dengan warna biru
        if(_counter % 2 == 0){
              return const Text("GENAP",style: TextStyle(color: Colors.red,));
        } else{
              return const Text("GANJIL", style: TextStyle(color: Colors.blue,),);
        }
      }
