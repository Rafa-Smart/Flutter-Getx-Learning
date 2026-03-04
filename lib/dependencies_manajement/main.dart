// Get.put (Beli Langsung): Kamu menyuruh manajer membeli Palu sekarang juga dan menaruhnya di meja. Memakan tempat (RAM) langsung, tapi langsung siap pakai. (Sifat: Singleton - hanya ada 1 palu yang dipakai bergantian).
// Get.lazyPut (Taruh Katalog): Kamu tidak membeli bor listrik, kamu hanya menaruh Brosur Bor Listrik di meja. Saat teknisi butuh bor (Get.find), barulah manajer lari ke toko membeli bor sesuai brosur itu. (Sifat: Lazy Singleton - hemat RAM).
// Kapan dipakai: Saat kelas yang ingin kamu simpan membutuhkan proses await (waktu tunggu) untuk dibuat. Sangat wajib untuk menginisialisasi SharedPreferences, Database SQLite, atau Firebase di awal aplikasi.

// Get.putAsync (Barang Pre-Order): Kamu butuh mesin impor dari luar negeri yang butuh waktu pengiriman (Asynchronous/Future). Manajer memesannya dan menunggu. Aplikasi akan "menunggu" sampai barang itu tiba di gudang sebelum melanjutkan.
// Get.create (Mesin Cetak 3D): Berbeda dengan put yang barangnya cuma satu, create itu seperti menaruh mesin cetak di gudang. Setiap kali teknisi minta obeng (Get.find), mesin ini akan mencetak Obeng Baru. (Sifat: Factory - menghasilkan objek baru/berbeda setiap kali dipanggil).

// Di belakang layar, GetX memiliki struktur data berupa Map<Type, Object> (Kamus).
// Saat Get.put<LoginController>(LoginController()) dipanggil, GetX menulis: {'LoginController': Alamat_RAM_0x111}. Saat Get.find dipanggil, GetX sekadar mencari kunci tersebut di kamusnya.

import 'package:belajar_flutter_get_x/dependencies_manajement/controllers/count_controller_depen.dart';
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
      home: Scaffold(
        appBar: AppBar(title: Text('DEPENDENCIES MANAJEMENT')),
        body: Center(
          child: Column(
            children: [
              Obx(() => Text('count: ${myc.count}'),),
              Obx(() => Text('nama: ${myc.nama}'),),
              TextField(
                onChanged: (value) {
                  myc.nama.value = value;
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      myc.increment();
                    },
                    child: Text('increment'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      myc.reset();
                    },
                    child: Text('reset name'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
