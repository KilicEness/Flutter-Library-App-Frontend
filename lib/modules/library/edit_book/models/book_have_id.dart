//model
class BookModel {
  late String id;
  late String name;
  late String author;
  late bool completed;

  BookModel(
      {required this.id,required this.name, required this.author, required this.completed});

  BookModel.fromResponse(Map<String, dynamic> response) {
    id = response['id'];
    name = response['name'];
    author = response['author'];
    completed = response['completed'];
  }
}
