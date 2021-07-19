import 'dart:convert';

class Comments {
  final id;
  final name;
  final email;
  final comments;
  final postID;
  final status;
  final createdAt;
  final updatedAt;

  Comments(
      {this.id,
      this.name,
      this.email,
      this.comments,
      this.postID,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory Comments.fromJson(Map<String, dynamic> map) {
    return Comments(
        id: map["id"].toString(),
        name: map["title"].toString(),
        email: map["slug"].toString(),
        comments: map["comments"].toString(),
        postID: map["post_id"].toString(),
        status: map["status"].toString(),
        createdAt: map["created_at"].toString(),
        updatedAt: map["updated_at"].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "comments": comments,
      "post_id": postID,
      "status": status,
      "created_at": createdAt,
      "updated_at": updatedAt
    };
  }
}

List<Comments> commentFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Comments>.from(
      data['data'].map((item) => Comments.fromJson(item)));
}

String commentToJson(Comments data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
