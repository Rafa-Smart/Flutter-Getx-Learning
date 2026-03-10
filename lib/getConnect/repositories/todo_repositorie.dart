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
    final response = await get('/todos');
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
    final response = await post('/todos', todo.toJson());
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
    final response = await put('/todos/$id', updateData.toJson());

    if (response.status.hasError) {
      return Future.error(response.statusText ?? " Terjadi Kesalahan error");
    } else {
      // In JSONPlaceholder, put/patch might return JSON string or Map depending on implementation
      // Usually GetConnect parses it if Content-Type is application/json
      if (response.body is String) {
        return TodoModelGetConnect.fromJson(json: jsonDecode(response.body));
      }
      return TodoModelGetConnect.fromJson(json: response.body);
    }
  }


  Future<bool> deletePost({required int id}) async {
    final response = await delete('/todos/$id');
    if(response.status.hasError){
      return Future.error(response.statusText ?? "terjadi Kesalahan error");
    }
    return true;
  }
}
