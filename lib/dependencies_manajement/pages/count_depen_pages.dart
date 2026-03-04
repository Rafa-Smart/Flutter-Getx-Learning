import 'package:belajar_flutter_get_x/dependencies_manajement/controllers/count_controller_depen.dart';
import 'package:belajar_flutter_get_x/dependencies_manajement/pages/text_depen_pages.dart'; 
import 'package:flutter/material.dart'; 
import 'package:get/get.dart';


// PENTING

// JADI POKOK NYA KALO KITA PAKE BINDING MAKA KETIKA KIA SUDAH TIDAK EMNGGUNAKAN FIND DI HALAAN MANAPUN
// ATAU GINI JIKA KITA SUDHA BERADA DI HALAMAN YANG TIDAK EMNGGUNAKAN FIND SAA SEKALI = ARTINYA AKN SUDHA TIDAK TERBAPAI, NAH BARU DEH DI HAPUS DARI MEMORY DAN JUGA ALAMATNYA GIUU


// nah ad yng namanya getView yang akna otomatis ketika kita pake atau extends ini maka
// nnati classnya kan punya variable contrroller yang otomatis itu akan mencari controller yang sesuai dengan nama classnya

// class CountDepenPages extends GetView<CountControllerDepen> {

class CountDepenPages extends StatelessWidget {
  // nah disni kalo kita ga peker permanent mka nanti ketika kita blik ke home
  // maka contorller ini akna di hapus memory dan alamatnya

   final controller1 = Get.find<CountControllerDepen>(tag: 'count1');

  // disni juga kita bisa menuplikat controllenya pake tag
  // jadi 1 controller bisa di gunakan untuk beberapa halaman dengna tag ang berbeda, jadi mandiri giut
  // misla saya punya tag 1 lalu ada obs yang dengerin tag 1 maka seluruh obs yang pake controller dgn tag 1 ini hanya akan mendengarkan perubahan data dari controller dengan tag 1 ini saja, jadi tidak akan mempengaruhi obs yang lain yang menggunakan controller dengan tag yang berbeda
  

  // jadi di bindingnya juga harus kita kasih put untuk tag ini oke

  final controller2 = Get.find<CountControllerDepen>(tag: 'count2');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COUNT PAGES'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.backspace_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(TextDepenPages());
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text('count 1 : ${controller1.count.value}')),
            Obx(() => Text('count 2 : ${controller2.count.value}')),
            // Obx(() => Text('nama: ${controller.nama.value}')),
            // TextField(
            //   controller: controller.textC,
            //   onChanged: (value) {
            //     controller.nama.value = value;
            //   },
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller1.increment();
                  },
                  child: Text('increment 1'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     controller.reset();
                //     controller.textC.clear();
                //   },
                //   child: Text('reset name'),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
