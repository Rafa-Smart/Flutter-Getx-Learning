import 'package:belajar_flutter_get_x/dependencies_manajement/controllers/count_controller_depen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// nah ad yng namanya getView yang akna otomatis ketika kita pake atau extends ini maka
// nnati classnya kan punya variable contrroller yang otomatis itu akan mencari controller yang sesuai dengan nama classnya

class CountDepenPages extends GetView<CountControllerDepen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('COUNT PAGES'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text('count: ${controller.count.value}')),
            Obx(() => Text('nama: ${controller.nama.value}')),
            TextField(
              controller: controller.textC,
              onChanged: (value) {
                controller.nama.value = value;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.increment();
                  },
                  child: Text('increment'),
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
          ],
        ),
      ),
    );
  }
}
