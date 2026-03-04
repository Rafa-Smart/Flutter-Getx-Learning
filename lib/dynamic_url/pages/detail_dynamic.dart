 
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailDynamic extends StatelessWidget {
  DetailDynamic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('<< previous page <<'),
            ),
            Text(
              "Product: ${Get.parameters['id']}\n query: ${Get.parameters['query']}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
