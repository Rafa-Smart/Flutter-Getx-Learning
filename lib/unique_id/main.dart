import 'package:belajar_flutter_get_x/unique_id/controllers/unique_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Unique ID")),
//         body: Center(

//           // nh karena disini sudha pake init maka kita ga perlu pake Get.put lagi di sini
//           child: GetX<UniqueCountController>(
//             init: UniqueCountController(),
//             builder: (controller) {
//               return Text('Count: ${controller.count}', style: TextStyle(fontSize: 25),);
//             },
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             // disni kita panggil controller yang sudah kita buat di atas
//             // karena di init sudha kita buat maka kita tinggal panggil aja dengan Get.find
//             Get.find<UniqueCountController>().add();
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

// sekrang kita pake getBuilder

class MyApp extends StatelessWidget {

  final countController = Get.put(UniqueCountController());


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Unique ID")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // nah karena kita itu punya beberapa pendegngar yang sama
            // nah kalo kita mau misalnya hanya mau yang barubah itu adalh child pertama dari column ini
            // maka kita bisa pake id dan nanti di function di controllernya itu
            // di fungsi update kita kasih nama id nya
            GetBuilder<UniqueCountController>(

              id: 'count_pertama',
              builder: (_) {
                return Text(
                  'Count: ${Get.find<UniqueCountController>().count}',
                  style: TextStyle(fontSize: 25),
                );
              },
            ),
            GetBuilder<UniqueCountController>(
              builder: (_) {
                return Text(
                  'Count: ${Get.find<UniqueCountController>().count}',
                  style: TextStyle(fontSize: 25),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.find<UniqueCountController>().add();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
