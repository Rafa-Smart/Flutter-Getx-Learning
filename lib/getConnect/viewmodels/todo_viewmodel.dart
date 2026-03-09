import 'package:belajar_flutter_get_x/getConnect/models/todo_model.GetConnect.dart';
import 'package:belajar_flutter_get_x/getConnect/repositories/todo_repositorie.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TodoViewModelGet extends GetxController
    with StateMixin<List<TodoModelGetConnect>> {
  // nah disini kita put dulu, karena kita akan menggunakan data yang sudah kita put di repository, jadi kita put dulu repositorynya
  // jadi semua class yang mau di amib iut kita put dulu, baru kita bisa akses data yang ada di repositorynya

  final TodoRepository repository = Get.put(TodoRepository());

  final TextEditingController titleC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  // disin ktia itu bukan return karena ketika kita menggunakan state mixin maka otomatis saya akna punya
  // sebuah state, jadi dnegnafungis fungsi ini itu kita akn mengganti state yang ada di state mixin ini, makanya kita ga perlu return tapi hany ubah aja (void)

  void getAllTodo() async {
    // nah jadi fungsi cange ini ad adua parameter utama
    // yaitu pertama itu adalh data statenya, dan yang kedua itu adalah statusnya, nah status ini itu ada beberapa jenis yaitu loading, success, error, empty, nah dengan menggunakan state mixin ini kita bisa dengan mudah untuk mengubah statusnya sesuai dengan kebutuhan kita

    // dan sistate ini typenya adalh yang ada di StateMixin<List<TodoModelGetConnect>>

    // disni pertma kali menjalanakan fgnsi kitaakkn bialang bahwa loading dulu

    change(null, status: RxStatus.loading());

    // nah disn kita kan mulai ambil datanya

    try {
      final response = await repository.getPosts();

      // nah kalo berhasil maka kita ubah statusnya menjadi success dan data yang kita ambil itu kita masukan ke dalam state yang ada di state mixin ini

      if (response.isEmpty) {
        change(response, status: RxStatus.empty());
      } else {
        change(response, status: RxStatus.success());
      }
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }

  void addTodo(TodoModelGetConnect todo) async {
    change(null, status: RxStatus.loading());
    try {
      final response = await repository.createPost(todo: todo);

      // nah gini, jadi ketiak saya sudah berhasil post data, nah saya kan harus menampilkan lagi datanya yang terbaru
      // kita bsia panggil fungsi getAllTodo atau bsia juga gini

      // jadi kita ambil data yang terbarunya, terus di tambahin algi ke statenya
      // ke state yang typenya itu adalah StateMixin<List<TodoModelGetConnect>>

      TodoModelGetConnect newTodo = response; // ini udah objek todo, hover aja

      // karena statenya itu adalh list, maka kita harus kasih state baru kedalam
      // fugnsi change yang isinya adalah list, jadi harus di replace aja

      // soalnya kalo kalo kit akaishnya itu data yang single dan bukan list
      // maka ga akan bisa
      // jadi ketiak kita change maka kita akan memperbarui state yang ada di state mixin ini, jadi kita harus memberikan data yang sesuai dengan typenya, jadi kalo typenya itu list maka kita harus memberikan data yang berupa list juga

      final List<TodoModelGetConnect> currentValue = state ?? [];

      // currentData.insert(0, result); // Taruh di urutan pertama

      // bisa gitu atau gini

      change([...currentValue, newTodo], status: RxStatus.success());

      // nah dinsi kita tampikan snackbar

      Get.snackbar("Success", 'Berhasil menambah Todo ID: ${newTodo.id}');
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }

  void removeTodo({required int id}) async {
    try {
      bool response = await repository.deletePost(id: id);
      if (response) {
        final List<TodoModelGetConnect> currentValue = state ?? [];

        // kita filter dulu data yang ada di state yang idnya itu tidak sama dengan id yang kita hapus, jadi kita buat list baru yang isinya adalah data yang idnya itu tidak sama dengan id yang kita hapus

        currentValue.removeWhere((elemen) => elemen.id == id);

        // nah baru kita ganti atau replace lagi list state kita

        change(currentValue, status: RxStatus.success());
        Get.snackbar("Success", 'Berhasil menghapus Todo ID: $id');
      }
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }

  void updateTodo({
    required int id,
    required TodoModelGetConnect updateData,
  }) async {
    try {
      final response = await repository.updatePost(
        id: id,
        updateData: updateData,
      );

      final List<TodoModelGetConnect> currentValue = state ?? [];

        // kita cari dulu index dari data yang mau kita update, jadi kita cari indexnya itu dengan id yang sama dengan id yang kita update

        int index = currentValue.indexWhere((elemen) => elemen.id == id);

        if (index != -1) {
          currentValue[index] = response;
          change(currentValue, status: RxStatus.success());
          Get.snackbar("Success", 'Berhasil mengubah Todo ID: $id');
        }

    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }
}
