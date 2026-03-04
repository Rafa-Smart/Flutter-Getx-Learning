// jadi gini kalo pake GetxService itu 100 persen sama kaa yag ada di GetxController
// hanya ada bedanya yat=itukalo service ii sudh menggunakna permanent true

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoragePutAsyncService extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<StoragePutAsyncService> initDb() async {
    // /disni kit mau inisialisasi sharedPreferences
    sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }

final textC = TextEditingController();
  void simpanNama(String nama){
    sharedPreferences.setString('nama', nama);
  }

  void resetNama(){
    sharedPreferences.remove('nama');
  }

  String ambilNama(){
    return sharedPreferences.getString('nama') ?? "tidak ada nama";
  }
}

// inidia return this karena seharusnya bisa kan kita pake consturctor tapi di dart
// itu ga boleh constructior menggunakan async jadi kita buat method initDb yang mengembalikan future dengan tipe data StoragePutAsyncService

// jadi kita panggil aja fungsi yang mengembalikan obje isntance dari class ini di main.dart dengan menggunakan await dan pastikan main.dart menggunakan async juga
