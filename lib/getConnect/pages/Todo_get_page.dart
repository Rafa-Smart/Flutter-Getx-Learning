import 'package:belajar_flutter_get_x/getConnect/models/todo_model.GetConnect.dart';
import 'package:belajar_flutter_get_x/getConnect/viewmodels/todo_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoGetPage extends GetView<TodoViewModelGet> {
  // nah dinsi untuk bsia mendapatkan class dari todo viewmodel
  // kita pakenya getView karena kita itu mau mendapatkan class dari todo viewmodel yang sudah kita buat di todo viewmodel itu untuk mengakses fungsi yang ada di todo viewmodel itu

  // tapi sebenernya bsia aja kita get put dulu

  TodoGetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void addTodo() {
      Get.defaultDialog(
        title: "Tambah Todo",
        content: Column(
          children: [
            TextField(
              controller: controller.titleC,
              decoration: InputDecoration(hintText: "Masukan title todo"),
            ),
          ],
        ),
        onConfirm: () {
          controller.addTodo(
            TodoModelGetConnect(
              userId: 1,
              id: 1,
              title: controller.titleC.text,
              completed: "false",
            ),
          );
          Get.back();
        },
      );
    }

    void updateTodo({required int id, required String title}) {
      Get.defaultDialog(
        title: "Update Todo",
        content: Column(
          children: [
            TextField(
              // https://chatgpt.com/c/69ae2cf8-62d4-8324-a7b3-7d65318cb46a
              // itu penjelasanya

              // jadi intinya itu untuk ambil TextEditingController
              controller: controller.titleC..text = title,
              decoration: InputDecoration(hintText: "Masukan title todo"),
            ),
          ],
        ),
        onConfirm: () {
          controller.updateTodo(
            id: id,
            updateData: TodoModelGetConnect(
              userId: 1,
              id: 1,
              title: controller.titleC.text,
              completed: "false",
            ),
          );
          Get.back();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('get connect flutter'), centerTitle: true),

      // disni jgnan lupa kita bungkus dengna obx
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: Icon(Icons.add),
      ),
      body: controller.obx(
        (state) {
        return Column(
          children: [
            // nah dinsi state itu adalah List<TodoModelGetConnect> jadi kita bisa langsung akses data yang ada di state ini karena state ini itu adalah data yang sudah kita ambil dari repositorynya
            ListView.builder(
              itemCount: state?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    state?[index].title ?? "tidak ada title",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(state?[index].title ?? ""),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          updateTodo(
                            id: state?[index].id ?? 1,
                            title: state?[index].title ?? "",
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.removeTodo(id: state?[index].id ?? 1);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );

        
      },
      onLoading: Center(child: CircularProgressIndicator()),
      onEmpty: Center(child: Text("Data Kosong")),


      onError: (error) => Center(child: Column(
        children: [
          Text(error ?? "Terjadi Kesalahan error"),
          ElevatedButton(
            onPressed: () {
              controller.getAllTodo();
            },
            child: Text("Coba Lagi"),
          ),
        ],
      )),
      ),

      
      
    );
  
  }
}
