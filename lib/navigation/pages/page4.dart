import 'package:belajar_flutter_get_x/navigation/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 4")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Get.toNamed(RouteNameNavigation.page5, arguments: "data dari page 4");
            }, child: Text('>> next page >>')),
            ElevatedButton(
              onPressed: () {},
              child: Text('<< previous page <<'),
            ),
          ],
        ),
      ),
    );
  }
}
