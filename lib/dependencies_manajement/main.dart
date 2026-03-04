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


// jadi gini aja manual kalo mau ganti page alu ilang controllernya maka kita bsa delete

// karena get yang terbaru itu sudah pae smartmanajement jaid aga akan di hapus sampai 
// kita ke halaman yang udah sama sekali engga menggunakna rote tersebut / find tersbut


// /nah jadi ketka di disponse sebuah controller get itu ad adua hal yang biasnaya di hapus yaitu
// 1. memory data di controler itu di laptop kita
// 2. alamat controller di memory kita

// nah kalo put itu kita back tanpa kasih permanent maka akan di hapus keduanya
// TAPI kalo pake lazyput itu hanya di hapus bagian memory datanya di laptop kita
// tapi alamatnya itu masih ada jadinya keitka kita balik ke halaman tersebut masih bisa dan
// controllernya di buat ualng


class MyApp extends StatelessWidget {

  // PENTING  

  // nah kalo begini itu, ketiak saya masuk ke dalma hlaman countpage
  // maka nanti dia bisa ya nambah count, tapi ketika kita masuk lagi ke sini yaitu ke halaman homepage ini
  // maka kaetika kita balik lagi ke ount page maka datanya itu tetep ada si countnya
  // karna engga kita dispose atua hapus dri memory

  // nah tapi bsia lebih hemat aja jadi putnya akna di halaman contnnya aja

  // final myc = Get.put(CountControllerDepen());

  // nah tapi ketika kita masuk kan put ini di halaman count maka ketiak halaan put di back dan kita kembali ke halaman home maka data ang tadi di put itu akna di dispose / deete di memory dan juga didelet alamatnya dan hilang
  // maka nanti data controler ini akan di dispose dan hilang, lalu juga ketika kita masuk lagi dari halaman home ke halaman count maka tidak bisa dan erorr
  // karena meskipun di kodenya sudah kita put tapi ektika kita back ke home dari count lalu dari hoe ke count lagi maka putnya ini  sudha hilang


  // nah tapi ini udah engga terlalu berpengaruh lagi, jai kalo pake permanent false juga
  // pas kita ganti page ga akan di dispose jadi akan di dispse itu ketika sama sekali tidak di perlukan lagi, karena di text page ini kita masih pake find jadinya engga di dispose

  // kecuali kita pake binding jadi di bindingnya itu kita pake lazyput jadi ketika kita masuk ke halaman count maka dia baru di buat dan ketika kita back ke home maka dia di dispose tapi alamatnya masih ada jadi ketika kita masuk lagi ke halaman count maka dia akan di buat ulang lagi

  // dan juga pake ini 
  // Get.to(CountDepenPages(), binding: BindingDepen());

  // nah makanya bisa error

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      // nanti aja lah ini mah untuk yang binding itu nanti aja pas materi binding
      initialBinding: BindingDepen(),
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