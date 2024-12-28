class UserModels {
  int? id;
  String? name;
  String? username;
  String? email;
  int? role;
  String? token;

  UserModels({
    this.id,
    this.name,
    this.username,
    this.email,
    this.role,
    this.token,
  });

  UserModels.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        role =
            json['role'] is String ? int.tryParse(json['role']) : json['role'],
        token = json['access_token'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'role': role,
      'token': token,
    };
  }
}
