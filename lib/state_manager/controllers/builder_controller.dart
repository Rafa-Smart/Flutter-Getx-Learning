import 'package:get/get.dart';

class BuilderController extends GetxController {
  int count = 0;

  void increment() {
    count++;
    update(); // update() digunakan untuk memberi tahu GetBuilder bahwa ada perubahan pada state, sehingga widget yang menggunakan GetBuilder akan di-rebuild.
  }
}