class Todo {
  String userId;
  String id;
  String title;
  String completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }
}
