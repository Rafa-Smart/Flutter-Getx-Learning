import 'package:belajar_flutter_get_x/dependencies_putAsync/services/storage_putAsync_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // nah karena kita itu mau menginisiasi shared preferences yang async
  // maka di mainnya itu sebelum di buakan atau di jalankan runapp
  // kita inisiasi dulu
  // nah kalo kit amau inisiasi async di main sebelum run app maka kita perlu ini
  WidgetsFlutterBinding.ensureInitialized();

  // nah baru ktia eksekusi si fungis asyncnya

  // await Get.putAsync( () async => StoragePutAsyncService().initDb());

  // atau itu sama aja kaya gini

  // nh dngnakaya gini berati kita bsia find storage di mana pun
  await Get.putAsync<StoragePutAsyncService>(() async {
    final service = StoragePutAsyncService();
    await service.initDb();
    return service;
  });

  // nah makanya dia butuh return this karena dia butuh mengembalikan instance dari classnya untuk di simpan di memory, jadi kita buat dulu instance dari classnya baru kita inisiasi baru kita return instance itu

  // Future<S> putAsync<S>(
  //   Future<S> Function() builder, {
  //   String? tag,
  //   bool permanent = false,
  // })

  runApp(MyApp());
}

class MyApp extends GetView<StoragePutAsyncService> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Home Page")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: controller.textC,
                // nah submited itu nanit ketika kita klik icon centang di keyboard atau ketika kita tekan enter di keyboard maka dia akan mengeksekusi fungsi yang ada di onSubmitted ini
                onSubmitted: (value) {
                  Get.find<StoragePutAsyncService>().simpanNama(value);
                },
                onChanged: (value) => {
                  Get.find<StoragePutAsyncService>().simpanNama(value),
                  controller.ambilNama(),
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Get.find<StoragePutAsyncService>().resetNama();
                },
                child: Text('reset'),
              ),
              Text(
                "data dari storage : ${Get.find<StoragePutAsyncService>().textC.text}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
