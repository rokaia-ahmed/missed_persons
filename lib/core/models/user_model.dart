class UserModel {
  int id;
  String email;
  String phone;
  String picture;
  String name;
  UserModel({
    required this.phone,
    required this.email,
    required this.name,
    required this.picture,
    required this.id,
  });
  static UserModel fromJson(Map<String, dynamic> user) {
    return UserModel(
      id: user['id'],
      email: user['email'],
      phone: user['phone'],
      name: user['name'] ?? '',
      picture: user['picture'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'name': name,
      'picture': picture,
    };
  }
}
