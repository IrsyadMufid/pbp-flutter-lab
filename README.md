# counter_7

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
