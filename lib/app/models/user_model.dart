class UserModel {
  late String? userId;
  late String? email;

  UserModel({
    this.userId,
    this.email,
  });

  UserModel.fromResponse(Map<String, dynamic> json) {
    userId = json['user']['_id'];
    email = json['user']['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['email'] = email;

    return data;
  }
}
