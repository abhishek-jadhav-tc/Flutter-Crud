class User {
  String? id;
  String name;
  String email;
  int age;

  User({this.id, required this.name, required this.email, required this.age});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        age: json['age'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'age': age,
      };
}
