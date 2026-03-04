// Get.put (Beli Langsung): Kamu menyuruh manajer membeli Palu sekarang juga dan menaruhnya di meja. Memakan tempat (RAM) langsung, tapi langsung siap pakai. (Sifat: Singleton - hanya ada 1 palu yang dipakai bergantian).
// Get.lazyPut (Taruh Katalog): Kamu tidak membeli bor listrik, kamu hanya menaruh Brosur Bor Listrik di meja. Saat teknisi butuh bor (Get.find), barulah manajer lari ke toko membeli bor sesuai brosur itu. (Sifat: Lazy Singleton - hemat RAM).
// Kapan dipakai: Saat kelas yang ingin kamu simpan membutuhkan proses await (waktu tunggu) untuk dibuat. Sangat wajib untuk menginisialisasi SharedPreferences, Database SQLite, atau Firebase di awal aplikasi.

// Get.putAsync (Barang Pre-Order): Kamu butuh mesin impor dari luar negeri yang butuh waktu pengiriman (Asynchronous/Future). Manajer memesannya dan menunggu. Aplikasi akan "menunggu" sampai barang itu tiba di gudang sebelum melanjutkan.
// Get.create (Mesin Cetak 3D): Berbeda dengan put yang barangnya cuma satu, create itu seperti menaruh mesin cetak di gudang. Setiap kali teknisi minta obeng (Get.find), mesin ini akan mencetak Obeng Baru. (Sifat: Factory - menghasilkan objek baru/berbeda setiap kali dipanggil).

// Di belakang layar, GetX memiliki struktur data berupa Map<Type, Object> (Kamus).
// Saat Get.put<LoginController>(LoginController()) dipanggil, GetX menulis: {'LoginController': Alamat_RAM_0x111}. Saat Get.find dipanggil, GetX sekadar mencari kunci tersebut di kamusnya.

import 'package:belajar_flutter_get_x/dependencies_manajement/bindings/binding_depen.dart';
import 'package:belajar_flutter_get_x/dependencies_manajement/controllers/count_controller_depen.dart';
import 'package:belajar_flutter_get_x/dependencies_manajement/pages/count_depen_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final myc = Get.put(CountControllerDepen());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      // nanti aja lah ini mah untuk yang binding itu nanti aja pas materi binding
      // initialBinding: BindingDepen(),
      home: Scaffold(
        appBar: AppBar(title: Text('DEPENDENCIES MANAJEMENT'), centerTitle: true, actions: [
          IconButton(onPressed: (){
            Get.to(CountDepenPages());
          }, icon: Icon(Icons.refresh))
        ],),
        body: Center(
          child: Text("HOME PAGE", style: TextStyle(fontSize: 25),),
        ),
      ),
    );
  }
}



// keren banget ada fitur getview
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'home_controller.dart';

// // PERHATIKAN: Kita mengubah StatelessWidget menjadi GetView<HomeController>
// class HomeView extends GetView<HomeController> {
  
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // KITA TIDAK PERLU LAGI MENULIS Get.put() ATAU Get.find()!
//     // GetView sudah otomatis menyediakan variabel bernama "controller" 
//     // yang langsung terhubung ke RAM GetX. Kodenya sangat bersih!

//     return Scaffold(
//       appBar: AppBar(title: const Text('Arsitektur Bindings')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children:[
//             Obx(() => Text(
//               controller.judul.value, // Memanggil 'controller' bawaan GetView
//               style: const TextStyle(fontSize: 20),
//             )),
//             ElevatedButton(
//               onPressed: controller.ubahJudul,
//               child: const Text('Ubah Judul'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }