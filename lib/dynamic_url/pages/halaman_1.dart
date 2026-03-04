import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Halaman1 extends StatelessWidget {
  Halaman1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Get.toNamed("/search", parameters: {"query": "sepatu adidas"});
                Get.toNamed("/search?query=sepatu+adidas");
              },
              child: Text('>> detail page search product sepatu adidas>>'),
            ),
            ElevatedButton(
              onPressed: () async {
                Get.toNamed("/product/1");
              },
              child: Text('>> detail page product id 1 >>'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('<< previous page <<'),
            ),
          ],
        ),
      ),
    );
  }
}
