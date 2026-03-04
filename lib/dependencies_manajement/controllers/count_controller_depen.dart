import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountControllerDepen extends GetxController {
  RxInt count = 0.obs;
  TextEditingController textC = TextEditingController();
  RxString nama = "".obs;

  void increment() {
    count.value++;
  }

  void reset() {
    nama.value = '';
  }
}
// // Menghapus paksa dari RAM (Bahkan yang permanent sekalipun)
// Get.delete<LoginController>(); 

// // Mengganti kelas yang ada di RAM dengan yang baru (Misal saat user ganti akun)
// Get.replace<UserController>(UserController(nama: "Akun Baru"));