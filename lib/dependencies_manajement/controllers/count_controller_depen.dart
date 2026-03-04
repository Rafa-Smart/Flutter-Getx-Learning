import 'package:get/get.dart';

class CountControllerDepen extends GetxController {
  RxInt count = 0.obs;

  RxString nama = "".obs;

  void increment() {
    count.value++;
  }

  void reset() {
    nama.value = '';
  }
}
