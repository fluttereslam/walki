

import 'package:walki/models/get_post_model.dart';
//
// class AllReelsModel {
//   List<Reels>? reels;
//
//
//   AllReelsModel.fromJson(Map<String, dynamic> json) {
//     if (json['reels'] != null) {
//       reels = <Reels>[];
//       json['reels'].forEach((v) {
//         reels!.add(new Reels.fromJson(v));
//       });
//     }
//   }
//
//
// }
//
// class Reels {
//   int? id;
//   String? reelTitle;
//   String? reelUrl;
//   String? userId;
//   String? createdAt;
//   String? updatedAt;
//   String? likesCount;
//   String? commentsCount;
//   List<Comments>? comments;
//   List<Likes>? likes;
//   User? user;
//
//
//   Reels.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     reelTitle = json['reel_title'];
//     reelUrl = json['reel_url'];
//     userId = json['user_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     likesCount = json['likes_count'];
//     commentsCount = json['comments_count'];
//     if (json['comments'] != null) {
//       comments = <Comments>[];
//       json['comments'].forEach((v) {
//         comments!.add(new Comments.fromJson(v));
//       });
//     }
//     if (json['likes'] != null) {
//       likes = <Likes>[];
//       json['likes'].forEach((v) {
//         likes!.add(new Likes.fromJson(v));
//       });
//     }
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }
//
//
// }
//
// // class Comments {
// //   int? id;
// //   String? body;
// //   String? userId;
// //   String? commentableId;
// //   String? commentableType;
// //   String? createdAt;
// //   String? updatedAt;
// //
// //
// //
// //   Comments.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     body = json['body'];
// //     userId = json['user_id'];
// //     commentableId = json['commentable_id'];
// //     commentableType = json['commentable_type'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }
// //
// //
// // }
// //
// // class Likes {
// //   int? id;
// //   String? firstName;
// //   String? lastName;
// //   String? bio;
// //   String? avatar;
// //   String? email;
// //   Null? emailVerifiedAt;
// //   String? address;
// //   String? phone;
// //   String? gender;
// //   String? createdAt;
// //   String? updatedAt;
// //   String? fullName;
// //   Pivot? pivot;
// //
// //
// //
// //   Likes.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     firstName = json['first_name'];
// //     lastName = json['last_name'];
// //     bio = json['bio'];
// //     avatar = json['avatar'];
// //     email = json['email'];
// //     emailVerifiedAt = json['email_verified_at'];
// //     address = json['address'];
// //     phone = json['phone'];
// //     gender = json['gender'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     fullName = json['full_name'];
// //     pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
// //   }
// //
// //
// // }
//
// class Pivot {
//   String? reelId;
//   String? userId;
//   String? createdAt;
//   String? updatedAt;
//
//   Pivot.fromJson(Map<String, dynamic> json) {
//     reelId = json['reel_id'];
//     userId = json['user_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
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


class AllReelsModel {
  List<Reels>? reels;



  AllReelsModel.fromJson(Map<String, dynamic> json) {
    if (json['reels'] != null) {
      reels = <Reels>[];
      json['reels'].forEach((v) {
        reels!.add(new Reels.fromJson(v));
      });
    }
  }

}

class Reels {
  int? id;
  String? reelTitle;
  String? reelUrl;
  String? userId;
  String? createdAt;
  String? updatedAt;
  String? likesCount;
  String? commentsCount;
  bool? isFollowing;
  bool? isLiked;
  List<Comments>? comments;
  List<Likes>? likes;
  User? user;



  Reels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reelTitle = json['reel_title'];
    reelUrl = json['reel_url'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    isFollowing = json['is_following'];
    isLiked = json['is_liked'];
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }


}
//
// class Comments {
//   int? id;
//   String? body;
//   String? userId;
//   String? commentableId;
//   String? commentableType;
//   String? createdAt;
//   String? updatedAt;
//
//   Comments(
//       {this.id,
//         this.body,
//         this.userId,
//         this.commentableId,
//         this.commentableType,
//         this.createdAt,
//         this.updatedAt});
//
//   Comments.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     body = json['body'];
//     userId = json['user_id'];
//     commentableId = json['commentable_id'];
//     commentableType = json['commentable_type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['body'] = this.body;
//     data['user_id'] = this.userId;
//     data['commentable_id'] = this.commentableId;
//     data['commentable_type'] = this.commentableType;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
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
//   Likes(
//       {this.id,
//         this.firstName,
//         this.lastName,
//         this.bio,
//         this.avatar,
//         this.email,
//         this.emailVerifiedAt,
//         this.address,
//         this.phone,
//         this.gender,
//         this.createdAt,
//         this.updatedAt,
//         this.fullName,
//         this.pivot});
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
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['bio'] = this.bio;
//     data['avatar'] = this.avatar;
//     data['email'] = this.email;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['address'] = this.address;
//     data['phone'] = this.phone;
//     data['gender'] = this.gender;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['full_name'] = this.fullName;
//     if (this.pivot != null) {
//       data['pivot'] = this.pivot!.toJson();
//     }
//     return data;
//   }
// }

class Pivot {
  String? reelId;
  String? userId;
  String? createdAt;
  String? updatedAt;


  Pivot.fromJson(Map<String, dynamic> json) {
    reelId = json['reel_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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