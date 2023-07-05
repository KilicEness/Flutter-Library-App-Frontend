class UserModel {
  late String name;
  late String? birthDay;
  late String email;
  late String? createdAt;
  late String? updatedAt;

   UserModel({
    required this.name,
    this.birthDay,
    required this.email,
    this.createdAt,
    this.updatedAt,
  });

  UserModel.fromResponse(Map<String, dynamic> json) {
    name = json['name'];
    birthDay = json['birthDay'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
