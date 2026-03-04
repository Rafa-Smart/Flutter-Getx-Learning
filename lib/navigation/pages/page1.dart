import 'package:belajar_flutter_get_x/navigation/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Page1 extends StatelessWidget {
  var datadaripage = '';

  Page1({super.key});

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
                // nah karena kita mau ambil data dari page 2, disni kita await

                // datadaripage = '';
                final data = await Get.to(Page2());
                print('data dari page 2 : $data');
                datadaripage = data;
              },
              child: Text('>> next page >>'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                datadaripage = '';
              },
              child: Text('<< previous page <<'),
            ),
            Text(
              "data from page 2 : ${datadaripage}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
