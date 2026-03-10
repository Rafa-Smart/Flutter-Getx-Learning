import 'package:belajar_flutter_get_x/getConnect/main.dart';

class TodoModelGetConnect {
  int userId;
  int id;
  String title;
  bool completed;

  TodoModelGetConnect({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModelGetConnect.fromJson({required Map<String, dynamic> json}) {
    return TodoModelGetConnect(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      completed: json['completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }

  TodoModelGetConnect copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return TodoModelGetConnect(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
