class PostComment {
  Comment? comment;
  PostComment.fromJson(Map<String, dynamic> json) {
    comment =
    json['comment'] != null ? new Comment.fromJson(json['comment']) : null;
  }

}

class Comment {
  String? body;
  int? userId;
  int? commentableId;
  String? commentableType;
  String? updatedAt;
  String? createdAt;
  int? id;

  Comment.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    userId = json['user_id'];
    commentableId = json['commentable_id'];
    commentableType = json['commentable_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

}