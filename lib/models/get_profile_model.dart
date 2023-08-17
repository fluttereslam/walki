

import 'get_post_model.dart';

class Followers {
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



  Followers.fromJson(Map<String, dynamic> json) {
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









class GetProfileModel {
  List<Data>? data;



  GetProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }


}

class Data {
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
  String? followingCount;
  String? followersCount;
  String? fullName;
  List<Posts>? posts;
  List<Reels>? reels;
  List<Following>? following;
  List<Followers>? followers;



  Data.fromJson(Map<String, dynamic> json) {
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
    followingCount = json['following_count'];
    followersCount = json['followers_count'];
    fullName = json['full_name'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    if (json['reels'] != null) {
      reels = <Reels>[];
      json['reels'].forEach((v) {
        reels!.add(new Reels.fromJson(v));
      });
    }
    if (json['following'] != null) {
      following = <Following>[];
      json['following'].forEach((v) {
        following!.add(new Following.fromJson(v));
      });
    }
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers!.add(new Followers.fromJson(v));
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
  String? commentsCount;
  String? likesCount;
  List<Comments>? comments;
  List<Likes>? likes;


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
    commentsCount = json['comments_count'];
    likesCount = json['likes_count'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(new Likes.fromJson(v));
      });
    }
  }

}

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

class Reels {
  int? id;
  String? reelTitle;
  String? reelUrl;
  String? userId;
  String? createdAt;
  String? updatedAt;


  Reels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reelTitle = json['reel_title'];
    reelUrl = json['reel_url'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Following {
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


  Following.fromJson(Map<String, dynamic> json) {
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

