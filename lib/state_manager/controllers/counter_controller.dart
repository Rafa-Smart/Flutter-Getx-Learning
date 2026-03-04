import 'package:get/get.dart';

class CounterController211 extends GetxController {
  final count = 0.obs;

  void increment() {
    count.value++;
  }

  void reset() {
    count.value = 0;
  }
}