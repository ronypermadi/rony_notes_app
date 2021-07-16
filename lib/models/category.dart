import 'dart:convert';

class Category {
  final id;
  final name;
  final createdAt;
  final updatedAt;

  Category({this.id, this.name, this.createdAt, this.updatedAt});

  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(
        id: map["id"].toString(),
        name: map["name"].toString(),
        createdAt: map["created_at"].toString(),
        updatedAt: map["updated_at"].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "created_at": createdAt,
      "updated_at": updatedAt
    };
  }
}

List<Category> categoryFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Category>.from(
      data['data'].map((item) => Category.fromJson(item)));
}
