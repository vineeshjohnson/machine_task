// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  int id;
  String email;
  String firstname;
  String lastname;
  String avatar;
  UserModel({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstname: json['first_name'],
        lastname: json['last_name'],
        avatar: json['avatar']);
  }
}
