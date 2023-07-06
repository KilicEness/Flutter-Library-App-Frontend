class BookModel {
  late String name;
  late String author;
  late bool completed;
  late String ownerId;
  late String ownerName;
  late String? createdAt;
  late String? updatedAt;
  // late final UserModel? owner;

  BookModel({
    required this.name,
    required this.author,
    required this.completed,
    required this.ownerId,
    required this.ownerName,
    // required this.owner,
    this.createdAt,
    this.updatedAt,
  });

  BookModel.fromResponse(Map<String, dynamic> json) {
    name = json['name'];
    author = json['author'];
    completed = json['completed'];
    ownerId = json['ownerId'];
    // owner = json['owner'];
    ownerName = json['ownerName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
