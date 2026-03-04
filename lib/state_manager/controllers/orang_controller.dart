import 'package:belajar_flutter_get_x/state_manager/models/orang.dart';
import 'package:get/get.dart';

class OrangController extends GetxController {
  // disni kita ambil yang orang mode yang propertinya kita buat obs bukan modenya

  final orang = Orang();

  void chageNamaUpper() {
    orang.nama.value = orang.nama.value.toUpperCase();
  }
}
