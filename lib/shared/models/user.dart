class UserModel {
  late String id;
  late String name;
  late String? birthDay;
  late String email;
  late String createdAt;
  late String? updatedAt;

  UserModel({
    required this.id,
    required this.name,
    this.birthDay,
    required this.email,
    required this.createdAt,
    this.updatedAt,
  });

  UserModel.fromResponse(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    birthDay = json['birthDay'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
