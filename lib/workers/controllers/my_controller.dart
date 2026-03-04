import 'package:get/get.dart';

class MyControllerWorker extends GetxController {
  RxInt count = 0.obs;

  RxString controller = ''.obs;

  void klikTombol() {
    count.value++;
  }


  void reset(){
    count.value = 0;
  }


// 2. Fungsi onInit adalah "Pusat Komando" untuk mendaftarkan Workers.
  // Ini otomatis dijalankan GetX saat Controller dimasukkan ke RAM (Get.put)
  @override
  void onInit() {
    super.onInit(); // Wajib memanggil super.onInit()

    print('ini dari init');
    // ---------------------------------------------------------
    // WORKER 1: EVER (Setiap Saat)
    // ---------------------------------------------------------
    ever(count, (nilaiSaatIni) {
      print("EVER: Kamu telah mengklik tombol sebanyak $nilaiSaatIni kali.");
      // Cocok untuk: Menyimpan pengaturan tema (Dark/Light mode) secara real-time.
    });

    everAll([count, controller ], (nilai) {
      print("EVER ALL: Nilai count: ${nilai[0]}, nilai apapun: ${nilai[1]}, nilai apapun: ${nilai[2]}");
    });

    // ---------------------------------------------------------
    // WORKER 2: ONCE (Hanya Sekali)
    // ---------------------------------------------------------
    once(count, (nilai) {
      print("ONCE: Oh, kamu mulai mengetik ya? Ini pesan sambutan pertama dan terakhir untukmu!");
      // Cocok untuk: Memunculkan pop-up tutorial/bantuan saat user pertama kali mencoba fitur.
    });

    // ---------------------------------------------------------
    // WORKER 3: DEBOUNCE (Tunggu Sampai Berhenti) - PALING PENTING!
    // ---------------------------------------------------------
    debounce(count, (nilai) {
      print("DEBOUNCE: Mencari data '$nilai' ke API Server...");
      // Cocok untuk: Fitur Live Search. Kita tidak mau mengirim API setiap huruf ditekan (Bisa kena block server!). 
      // Kita tunggu user selesai ngetik 1 detik, baru kirim API.
    }, time: const Duration(seconds: 1)); // Menunggu 1 detik

    // ---------------------------------------------------------
    // WORKER 4: INTERVAL (Beri Jeda Teratur)
    // ---------------------------------------------------------
    interval(count, (nilai) {
      print("INTERVAL: Auto-save draft pencarianmu: '$nilai'...");
      // Cocok untuk: Mencegah user spam klik tombol secara brutal. Fungsi ini hanya mengizinkan aksi 1 kali setiap 2 detik.
    }, time: const Duration(seconds: 2));
  }
}
