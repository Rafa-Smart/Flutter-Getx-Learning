import 'dart:convert';
import 'package:belajar_flutter_get_x/getConnect/models/todo_model.GetConnect.dart';
import 'package:get/get_connect/connect.dart';

class TodoRepository extends GetConnect {
  @override
  void onInit() {
    super.onInit();

    httpClient.baseUrl = "https://jsonplaceholder.typicode.com";
  }

  Future<List<TodoModelGetConnect>> getPosts() async {
    final response = await get('/posts');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Terjadi kesalahan error");
    } else {
      List<dynamic> listTodo = response.body;
      return listTodo
          .map(
            (e) =>
                TodoModelGetConnect.fromJson(json: e as Map<String, dynamic>),
          )
          .toList();
    }
  }

  Future<TodoModelGetConnect> createPost({
    required TodoModelGetConnect todo,
  }) async {
    final response = await post('/posts', todo.toJson());
    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Terjadi kesalahan error");
    } else {
      return TodoModelGetConnect.fromJson(json: response.body);
    }
  }

  Future<TodoModelGetConnect> updatePost({
    required int id,
    required TodoModelGetConnect updateData,
  }) async {
    final response = await put('/posts/$id', updateData.toJson());

    if (response.status.hasError) {
      return Future.error(response.statusText ?? " Terjadi Kesalahan error");
    } else {
      return TodoModelGetConnect.fromJson(json: jsonDecode(response.body));
    }
  }


  Future deletePost({required int id}) async {
    final response = await delete('/posts/$id');
    if(response.status.hasError){
      return Future.error(response.statusText ?? "terjadi Kesalahan error");
    }

    // jadi kalo engga error maka berati sukses
  }
}
