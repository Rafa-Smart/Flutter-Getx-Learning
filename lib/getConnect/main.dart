import 'package:belajar_flutter_get_x/getConnect/binding/todo_getConnect_binding.dart';
import 'package:belajar_flutter_get_x/getConnect/pages/Todo_get_page.dart';
import 'package:belajar_flutter_get_x/getConnect/viewmodels/todo_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(TodoViewModelGet());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: TodoGetconnectBinding(),
      home: TodoGetPage());
  }
}
