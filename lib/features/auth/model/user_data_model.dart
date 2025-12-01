class UserDataModel {
  final String id;
  final String name;
  final String email;

  UserDataModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  // ⭐ Return new modified object
  UserDataModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
