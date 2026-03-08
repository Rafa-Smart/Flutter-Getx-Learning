import 'package:get/get.dart';

class TodoProvider extends GetConnect {
  Future<Response> getTodo(id) => get('https://jsonplaceholder.typicode.com/todos/$id');
}