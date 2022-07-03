import 'dart:convert';

class Category {
  Category({
    required this.id,
    required this.name,
    required this.user,
  });

  String id;
  String name;
  _User user;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["nombre"],
        user: _User.fromMap(json["usuario"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": name,
        "usuario": user.toMap(),
      };

  @override
  String toString() {
    // TODO: implement toString
    return name;
  }
}

class _User {
  _User({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory _User.fromJson(String str) => _User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _User.fromMap(Map<String, dynamic> json) => _User(
        id: json["_id"],
        name: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": name,
      };
}
