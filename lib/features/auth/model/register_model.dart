class RegisterModel {
  final String name;
  final String email;
  final String password;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  // ⭐ Return new modified object
  RegisterModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
