import 'package:belajar_flutter_get_x/dependencies_manajement/controllers/count_controller_depen.dart';
import 'package:get/get.dart';

class BindingDepen extends Bindings {
  @override
  // nah jadi dia akna kita taurh di main.dart lalu di bagian binding

  // atau bisa juga sebeernya itu di getPages nah nanti di widget GetPage itu kita masukan bindingny

  // atua aklo ga masu masuin class bindingnya bsia juga kita masukin controllernya langsung
  void dependencies() {
    Get.lazyPut<CountControllerDepen>(() => CountControllerDepen());
  }
}
