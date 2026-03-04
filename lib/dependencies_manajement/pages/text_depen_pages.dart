import 'package:belajar_flutter_get_x/dependencies_manajement/controllers/count_controller_depen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextDepenPages extends StatelessWidget {
  final controller = Get.find<CountControllerDepen>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEXT CONTROLLER PAGES'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.backspace_outlined),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Obx( () => Text('nama: ${controller.nama.value}') ),
            TextField(
              controller: controller.textC,
              onChanged: (value) {
                controller.nama.value = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.reset();
                controller.textC.clear();
              },
              child: Text('reset name'),
            ),
          ],
        ),
      ),
    );
  }
}
