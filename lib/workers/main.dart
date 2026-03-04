import 'package:belajar_flutter_get_x/workers/controllers/my_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final myController = Get.put(MyControllerWorker());

  final textC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Workers")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Workers"),
            Divider(height: 7, color: Colors.grey),
            Obx(() => Text("count: ${myController.count.value}"),),
            Divider(height: 1, color: Colors.grey),
            TextField(
              onChanged: (value) {
                myController.klikTombol();
              },
              controller: textC,
              
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Masukkan sesuatu",
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            textC.clear();
            myController.reset();
          },
          child: Icon(Icons.refresh),
        ),
      ),
      
    );
  }
}
