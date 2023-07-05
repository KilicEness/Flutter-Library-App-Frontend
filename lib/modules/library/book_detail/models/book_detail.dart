//model
class BookDetailModel {
  late String title;
  late String description;

  BookDetailModel({required this.title, required this.description});

  BookDetailModel.fromResponse(Map<String, dynamic> response) {
    title = response['title'];
    description = response['description'];
  }
}
