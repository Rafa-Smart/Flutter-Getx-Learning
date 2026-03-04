import 'package:belajar_flutter_get_x/dynamic_url/pages/detail_dynamic.dart';
import 'package:belajar_flutter_get_x/dynamic_url/pages/halaman_1.dart';
import 'package:belajar_flutter_get_x/dynamic_url/routes/Route_name.dart';  
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final textC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: RouteNameDynamic.home,
          page: () => Halaman1(),
        ),
        GetPage(
          name: RouteNameDynamic.page1,
          page: () => DetailDynamic(),
        ),
        GetPage(
          name: RouteNameDynamic.page2,
          page: () => DetailDynamic(),
        ),
      ],
      unknownRoute: GetPage(
        name: "/notfound",
        page: () => Scaffold(
          appBar: AppBar(title: Text("Not Found Page")),
          body: Center(child: Text("Halaman tidak ditemukan")),
        ),
      ),

      // PERINGATAN GA BLELH PAKE HOME LAGI KELAO UDAH PAKE GETPAGES, KALO MAU PAKE HOME HAPUS GETPAGES DULU
      // home: Scaffold(
      //   appBar: AppBar(title: Text("Home Page")),
      //   body: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         ElevatedButton(
      //           onPressed: () {
      //             Get.to(Halaman1());
      //           },
      //           child: Text('>> next page >>'),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
