import 'package:get/get.dart';

class UniqueCountController extends GetxController {
  var count = 0;

  void add() {
    count++;

    // nah jadi hanya id yang count_pertama yang akan di update, sedangkan id yang lain tidak akan di update
    update(['count_pertama']); 
  }
}