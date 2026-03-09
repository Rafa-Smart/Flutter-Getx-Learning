import 'package:belajar_flutter_get_x/getConnect/viewmodels/todo_viewmodel.dart';
import 'package:get/get.dart';

class TodoGetconnectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoViewModelGet>(() => TodoViewModelGet());
  }
}
