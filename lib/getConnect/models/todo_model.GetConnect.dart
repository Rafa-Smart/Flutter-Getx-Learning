import 'package:belajar_flutter_get_x/getConnect/main.dart';

class TodoModelGetConnect {
  String userId;
  String id;
  String title;
  String completed;

  TodoModelGetConnect({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModelGetConnect.fromJson({required Map<String, dynamic> json}) {
    return TodoModelGetConnect(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }

  TodoModelGetConnect copyWith({
    String? userId,
    String? id,
    String? title,
    String? completed,
  }) {
    return TodoModelGetConnect(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
