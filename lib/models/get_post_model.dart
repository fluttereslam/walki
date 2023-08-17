// class GetPostModel {
//   List<Posts>? posts;
//
//
//   GetPostModel.fromJson(Map<String, dynamic> json) {
//     if (json['posts'] != null) {
//       posts = <Posts>[];
//       json['posts'].forEach((v) {
//         posts!.add(new Posts.fromJson(v));
//       });
//     }
//   }
//
//
// }
//
// class Posts {
//   int? id;
//   String? title;
//   String? slug;
//   String? description;
//   String? imagePath;
//   String? videoPath;
//   String? userId;
//   String? createdAt;
//   String? updatedAt;
//   String? likesCount;
//   String? commentsCount;
//   bool? isFollowing;
//   List<Likes>? likes;
//   List<Comments>? comments;
//   User? user;
//
//
//
//   Posts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     slug = json['slug'];
//     description = json['description'];
//     imagePath = json['image_path'];
//     videoPath = json['video_path'];
//     userId = json['user_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     likesCount = json['likes_count'];
//     commentsCount = json['comments_count'];
//     isFollowing = json['is_following'];
//     if (json['likes'] != null) {
//       likes = <Likes>[];
//       json['likes'].forEach((v) {
//         likes!.add(new Likes.fromJson(v));
//       });
//     }
//     if (json['comments'] != null) {
//       comments = <Comments>[];
//       json['comments'].forEach((v) {
//         comments!.add(new Comments.fromJson(v));
//       });
//     }
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }
//
//
//
// }
//
// class Likes {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? bio;
//   String? avatar;
//   String? email;
//   Null? emailVerifiedAt;
//   String? address;
//   String? phone;
//   String? gender;
//   String? createdAt;
//   String? updatedAt;
//   String? fullName;
//   Pivot? pivot;
//
//
//
//   Likes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     bio = json['bio'];
//     avatar = json['avatar'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     address = json['address'];
//     phone = json['phone'];
//     gender = json['gender'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     fullName = json['full_name'];
//     pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
//   }
//
//
// }
//
// class Pivot {
//   String? postId;
//   String? userId;
//   String? createdAt;
//   String? updatedAt;
//
//
//   Pivot.fromJson(Map<String, dynamic> json) {
//     postId = json['post_id'];
//     userId = json['user_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//
// }
//
// class Comments {
//   int? id;
//   String? body;
//   String? userId;
//   String? commentableId;
//   String? commentableType;
//   String? createdAt;
//   String? updatedAt;
//   User? user;
//
//
//
//   Comments.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     body = json['body'];
//     userId = json['user_id'];
//     commentableId = json['commentable_id'];
//     commentableType = json['commentable_type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }
//
//
// }
//
// class User {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? bio;
//   String? avatar;
//   String? email;
//   Null? emailVerifiedAt;
//   String? address;
//   String? phone;
//   String? gender;
//   String? createdAt;
//   String? updatedAt;
//   String? fullName;
//
//
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     bio = json['bio'];
//     avatar = json['avatar'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     address = json['address'];
//     phone = json['phone'];
//     gender = json['gender'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     fullName = json['full_name'];
//   }
//
//
// }






class GetPostModel {
  List<Posts>? posts;



  GetPostModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }


}

class Posts {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? imagePath;
  String? videoPath;
  String? userId;
  String? createdAt;
  String? updatedAt;
  String? likesCount;
  String? commentsCount;
  bool? isLiked;
  bool? isFollowing;
  List<Likes>? likes;
  List<Comments>? comments;
  User? user;



  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imagePath = json['image_path'];
    videoPath = json['video_path'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    isLiked = json['is_liked'];
    isFollowing = json['is_following'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(new Likes.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }


}

class Likes {
  int? id;
  String? firstName;
  String? lastName;
  String? bio;
  String? avatar;
  String? email;
  String? emailVerifiedAt;
  String? address;
  String? phone;
  String? gender;
  String? createdAt;
  String? updatedAt;
  String? fullName;
  Pivot? pivot;


  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    bio = json['bio'];
    avatar = json['avatar'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    address = json['address'];
    phone = json['phone'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fullName = json['full_name'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }


}

class Pivot {
  String? postId;
  String? userId;
  String? createdAt;
  String? updatedAt;



  Pivot.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

class Comments {
  int? id;
  String? body;
  String? userId;
  String? commentableId;
  String? commentableType;
  String? createdAt;
  String? updatedAt;
  User? user;



  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    userId = json['user_id'];
    commentableId = json['commentable_id'];
    commentableType = json['commentable_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }


}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? bio;
  String? avatar;
  String? email;
  String? emailVerifiedAt;
  String? address;
  String? phone;
  String? gender;
  String? createdAt;
  String? updatedAt;
  String? fullName;



  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    bio = json['bio'];
    avatar = json['avatar'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    address = json['address'];
    phone = json['phone'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fullName = json['full_name'];
  }


}