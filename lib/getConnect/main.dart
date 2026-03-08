
class Todo {
  final String id;
  final String name;
  final String title;
  final String completed;

  Todo({
    required this.id,
    required this.name,
    required this.title,
    required this.completed
  });


  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(
      id: json['id'].toString(),
      name: json['name'].toString(),
      title: json['title'].toString(),
      completed: json['completed'].toString()
    );
  }

  toJson(){
    return {
      "id":id,
      "nama":name,
      "title":title,
      "competed":completed
    };
  }
}


