import 'dart:convert';

class Posts {
  final id;
  final title;
  final slug;
  final description;
  final postCategory;
  final author;
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
      this.postCategory,
      this.author,
      this.tag,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory Posts.fromJson(Map<String, dynamic> map) {
    return Posts(
        id: map["id"].toString(),
        title: map["title"].toString(),
        slug: map["slug"].toString(),
        description: map["description"].toString(),
        postCategory: map["post_category"].toString(),
        author: map["author"].toString(),
        tag: map["tag"].toString(),
        image: map["image"].toString(),
        status: map["status"].toString(),
        createdAt: map["created_at"].toString(),
        updatedAt: map["updated_at"].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "slug": slug,
      "description": description,
      "post_category": postCategory,
      "author": author,
      "tag": tag,
      "image": image,
      "status": status,
      "created_at": createdAt,
      "updated_at": updatedAt
    };
  }

  // @override
  // String toString() {
  //   return 'Posts{id: $id, title: $title, slug: $slug, description: $description, postCategoryId: $postCategoryId, userId: $userId, tag: $tag, image: $image, status: $status, createdAt: $createdAt, updatedAt: $updatedAt}';
  // }
}

List<Posts> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Posts>.from(data['data'].map((item) => Posts.fromJson(item)));
}

// String postToJson(Posts data) {
//   final jsonData = data.toJson();
//   return json.encode(jsonData);
// }
