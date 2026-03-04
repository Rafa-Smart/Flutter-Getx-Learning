 
import 'package:get/get.dart';

class CounterController extends GetxController {
  // RxInt adalah variabel reaktif bawaan GetX untuk tipe integer.
  // ".obs" (observable) adalah ekstensi GetX untuk mengubah tipe biasa (int) menjadi reaktif (RxInt).
  RxInt count = 0.obs;

  // atua bisa juga gini
  final count2 = RxInt(0);

  // atau gini
  final count3 = Rx<int>(0);

  final isDark = false.obs;

  void increment(){
    count.value++; // Kita harus menggunakan .value untuk mengubah atau membaca nilai dari tipe Rx
  }

  void decrement(){
    count.value--;
  }

  void reset(){
    count.value = 0;
  }

  void changeTheme(){
    isDark.value = !isDark.value;
  }

}

// jadi gni kenapa kita selalu harus pake .value, karena Rx itu adalah pembngkus dan .value adalah property
// yang menyyimpan nilai yang sebenernya

// Tanpa .value, kita tidak akan bisa membedakan mana kelas pembungkusnya (yang berisi sistem alarm/Stream) dan mana data aslinya (angka/teksnya).

// karena kalo count = 25 ini sm aja kaya kita ganti pembungkusnya dengna 25 dan bukan gnti valuenya

// nah bisa juga pake ()
// Catatan: Cara kurung () ini hanya bisa untuk membaca (Get), tidak bisa untuk mengubah data (Set). Untuk mengubah data, kamu wajib memakai .value. Jadi sebagai fondasi yang kuat, saya menyarankan kamu selalu menggunakan .value terlebih dahulu agar terbiasa.