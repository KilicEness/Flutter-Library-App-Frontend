//model
class BookModel {
  late String id;
  late String name;
  late String author;
  late bool completed;
  late String ownerId;
  late String createdAt;
  late String updatedAt;
  late String ownerName;

  BookModel(
      {required this.id,
      required this.name,
      required this.author,
      required this.completed,
      required this. ownerId,
      required this.createdAt,
      required this.updatedAt,
      required this. ownerName});

  BookModel.fromResponse(Map<String, dynamic> response) {
    id = response['_id'];
    name = response['name'];
    author = response['author'];
    completed = response['completed'];
    ownerId = response['ownerId'];
    createdAt = response['createdAt'];
    updatedAt = response['updatedAt'];
    ownerName = response['ownerName'];
  }
}
// {
//     "_id": "64943e63ca8bcd67309f5361",
//     "name": "1984",
//     "author": "George Orwell",
//     "completed": false,
//     "ownerId": "648c6406869ec1fb17a3ac7a",
//     "createdAt": "2023-06-22T12:28:19.131Z",
//     "updatedAt": "2023-06-22T12:28:19.131Z",
//     "__v": 0,
//     "ownerName": "Enes"
// }