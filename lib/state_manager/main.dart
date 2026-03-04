import 'package:belajar_flutter_get_x/state_manager/controllers/counter_controller.dart';
import 'package:belajar_flutter_get_x/state_manager/controllers/builder_controller.dart';
import 'package:belajar_flutter_get_x/state_manager/controllers/orang_controller.dart';
import 'package:belajar_flutter_get_x/state_manager/models/orang2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      initialBinding: HomeBinding(),
      getPages: [GetPage(name: '/', page: () => HomePage())],
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // disni kita put nanti di homepagenya kita find
    Get.put(CounterController211());
    Get.put(OrangController());
    Get.put(BuilderController());
  }
}
// jadi ad ayang simple ada juga yang reactive
// kalo rective itu si variablenya butuh di obervasi / .obs dan dia akna otomatis
// ter dengar oleh widget yang di bungkus oleh Obx dan buth tipe dta rx

// kalo simpne itu dia getBuilder dan di fungsinya i dia butuh kaya
// notifyListener jadi harus selalu pangil fungsi update
// tapi di getBuilder ini ebih cepat karna lebh simple disini itu tipe datanya primitif / normal

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.find<CounterController211>();

  // ini gausah, karna kita punya orang controller yang sudah kita buat di controller nya, jadi kita tinggal panggil aja

  // var orang = Orang(); // iin kalo kita pake model yang didalamnya itu ada properti obs
  final OrangController orangController = Get.find<OrangController>();

  var orang2 = Orang2(
    nama: "RAFA",
    umur: 20,
  ).obs; // ini kalo kita pake model yang didalamnya itu engga ada properti obs
  // ini kalo kita pake model yang didalamnya itu engga ada properti obs
  // tapi aklo misalakn modelnya sendiri sudha kita pasangkan obs maka cara aksesnya itu adalah
  // orang.value.nama

  void reset() {
    controller.count.value = 0;
    orangController.orang.nama.value = "rafa";
    orang2.value.nama = "RAFA";
  }

  // disni jangan lupa kita put dulu

  final builderController = Get.find<BuilderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("State Manager")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ini kalo pake obs
          Obx(
            () => Text(
              "angka : ${controller.count.value}'\n nama : ${orangController.orang.nama.value}\n nama2 : ${orang2.value.nama}",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => controller.increment(),
                child: Text("Tambah"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => orangController.chageNamaUpper(),

                // ini udah engga usah lagi
                // orangController.orang.nama.value = orangController.orang.nama.value.toUpperCase(),
                child: Text("Upper"),
              ),
              ElevatedButton(
                onPressed: () =>
                    // ini yang pake model di jadiin obs
                    // orang2.value.nama = orang2.value.nama.toLowerCase(),
                    // bisa begitu, tapi gini juga bsia
                    orang2.update((val) {
                      orang2.value.nama = orang2.value.nama.toLowerCase();
                    }),
                child: Text("Lower"),
              ),
              ElevatedButton(onPressed: () => reset(), child: Text("reset")),
            ],
          ),
          Divider(height: 1, color: Colors.grey),

          // ini yang pake getBuilder / simple
          GetBuilder<BuilderController>(
            builder: (controller) {
              return Text("angka : ${controller.count}");
            },
          ),

          GetBuilder<BuilderController>(
            // didChangeDependencies: ,
            // didUpdateWidget: ,
            // dan dia itu ada ini
            builder: (controller) {
              return ElevatedButton(
                onPressed: () => controller.increment(),
                child: Text("reset"),
              );
            },
          ),

          // =====================================
          // 3. GETX WIDGET (Sintaks Panjang, bisa ada init)
          // =====================================
          // GetX<TigaWidgetController>(
          //   // init: TigaWidgetController(), // <--- Kelebihannya, bisa buat di sini jika belum pakai Get.put di atas
          //   builder: (controller) {
          //     return Text('GetX Widget: ${controller.poinOtomatis.value}');
          //   },
          // ),
        ],
      ),
    );
  }
}
