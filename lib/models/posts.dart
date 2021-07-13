import 'dart:convert';

class Posts {
  final id;
  final title;
  final slug;
  final description;
  final postCategoryId;
  final userId;
  final tag;
  final image;
  final status;
  final createdAt;
  final updatedAt;

  Posts(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.postCategoryId,
      this.userId,
      this.tag,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory Posts.fromJson(Map<String, dynamic> map) {
    return Posts(
        id: map["data"]["id"],
        title: map["data"]["title"],
        slug: map["data"]["slug"],
        description: map["data"]["description"],
        postCategoryId: map["data"]["postCategoryId"],
        userId: map["data"]["userId"],
        tag: map["data"]["tag"],
        image: map["data"]["image"],
        status: map["data"]["status"],
        createdAt: map["data"]["createdAt"],
        updatedAt: map["data"]["updatedAt"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "slug": slug,
      "description": description,
      "postCategoryId": postCategoryId,
      "userId": userId,
      "tag": tag,
      "image": image,
      "status": status,
      "createdAt": createdAt,
      "updatedAt": updatedAt
    };
  }

  @override
  String toString() {
    return 'Posts{id: $id, title: $title, slug: $slug, description: $description, postCategoryId: $postCategoryId, userId: $userId, tag: $tag, image: $image, status: $status, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

List<Posts> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Posts>.from(data.map((item) => Posts.fromJson(item)));
}

String postToJson(Posts data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
