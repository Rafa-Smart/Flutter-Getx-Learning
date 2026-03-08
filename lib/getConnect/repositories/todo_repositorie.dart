import 'dart:convert';

import 'package:belajar_flutter_get_x/getConnect/main.dart';
import 'package:belajar_flutter_get_x/getConnect/providers/todo_provider.dart';

class TodoRepository {
  Future<Todo> getTodo(){
    return TodoProvider().getTodo(1).then((response) {
      if(response.statusCode == 200){
        return Todo.fromJson(jsonDecode(response.bodyString!));
      }else {
        throw Exception('Failed to load todo');
      }
    });
  }
}