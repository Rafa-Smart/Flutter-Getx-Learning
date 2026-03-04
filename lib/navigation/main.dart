
import 'package:belajar_flutter_get_x/navigation/pages/page1.dart';
import 'package:belajar_flutter_get_x/navigation/routes/route_class.dart'; 
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
      // routes: {
      //   "/page1": (context) => Page1(),
      //   "/page2": (context) => Page2(),
      //   "/page3": (context) => Page3(),
      //   "/page4": (context) => Page4(),
      //   // bisa juga gini
      //   RouteNameNavigation.page5: (context) => Page5(),
      // },

      // ini kalo pake get
      unknownRoute: GetPage(
        name: "/notfound",
        page: () => Scaffold(
          appBar: AppBar(title: Text("Not Found Page")),
          body: Center(child: Text("Halaman tidak ditemukan")),
        ),
      ),
      getPages: RouteClass.routes,
      home: Scaffold(
        appBar: AppBar(title: Text("Home Page")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(Page1());
                },
                child: Text('>> next page >>'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
