
import 'package:belajar_flutter_get_x/perkenalan/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  // disni kia ambil controllernya
  final controller = Get.put(CounterController());

  // jadi kalo get.put itu dia naruh controller ke memory tpi kalo find itu dia kana nyari dan ngambil controller dari memory
  @override
  Widget build(BuildContext context) {
    return Obx(

      // DAN KALO MAU GANTI GANTI TEMA ARTINYA ARUS STATEFUL Ya
      () => GetMaterialApp(
        title: 'GetX Counter',
        theme: controller.isDark.value ? ThemeData.dark() : ThemeData.light(),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  // disni kia ambil controllernya
  // Jangan gunakan Get.put berulang kali untuk Controller yang sama di halaman yang berbeda, karena akan menimpa data yang lama. Cukup Get.put sekali, lalu sisanya gunakan Get.find.
  // final controller = Get.put(CounterController());

  // jadi kalo get.put itu dia naruh controller ke memory tpi kalo find itu dia kana nyari dan ngambil controller dari memory

  // dan kalo misalkan kita belum Get.put tapi kita sudah Get.find maka dia akan error karena dia belum menemukan controller yang di cari di memory, jadi pastikan kita sudah Get.put sebelum Get.find

  // setelah kita put di sana, lau di sini kita find aja

  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Counter"),),

      // nah kalo misalkan kita apke obx tapi engga ngegunaain controller maka dia akan error karena dia tidak menemukan data yang di panggil, jadi pastikan kita sudah menggunakan controller yang benar di dalam Obx
      body: Stack(
        children: [
          Center(
            child: Obx(
              () => Text(
                "angka : ${controller.count.value}",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: 100,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.increment();
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.decrement();
                    },
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.reset();
                    },
                    child: Text(
                      "x",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.changeTheme();
                    },
                    child: Text(
                      "@",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// jadi bisa banyak gitu,, tapi kalo kita pake get.dart maka dia akn ambil semuanya langusng
// tapi tetep akna efisien karena dia akna hanya load yang di panggilnya aja
// jadi kalo yang lainnya engga di pake maka engga di ambil jadi sama aja ringan
// sebernya itu bsia juga pake get/controller.dart tapi kalo kita pake get.dart maka dia akn ambil semuanya langusng
