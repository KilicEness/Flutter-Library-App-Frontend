//model
class BookDetailModel {
  late String name;
  late String author;
  late bool completed;
  late String ownerName;
  late String createdAt;
  late String updatedAt;

  BookDetailModel(
      {required this.name,
      required this.author,
      required this.completed,
      required this.ownerName,
      required this.createdAt,
      required this.updatedAt});

  BookDetailModel.fromResponse(Map<String, dynamic> response) {
    name = response['name'];
    author = response['author'];
    completed = response['completed'];
    ownerName = response['ownerName'];
    createdAt = response['createdAt'];
    updatedAt = response['updatedAt'];
  }
}
