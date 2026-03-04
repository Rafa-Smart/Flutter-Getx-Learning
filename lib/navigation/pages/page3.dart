import 'package:belajar_flutter_get_x/navigation/pages/page4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 3")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Get.to(Page4());
            }, child: Text('>> next page >>')),
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
