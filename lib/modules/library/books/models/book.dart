class BookModel {
  late String name;
  late String author;
  late bool completed;
  late String ownerId;
  late String? ownerName;
  late String? createdAt;
  late String? updatedAt;

  BookModel({
    required this.name,
    required this.author,
    required this.completed,
    required this.ownerId,
    this.ownerName,
    this.createdAt,
    this.updatedAt,
  });

  BookModel.fromResponse(Map<String, dynamic> json) {
    name = json['name'];
    author = json['author'];
    completed = json['completed'];
    ownerId = json['ownerId'];
    ownerName = json['ownerName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['userId'] = userId;
  //   data['email'] = email;

  //   return data;
  // }
}
