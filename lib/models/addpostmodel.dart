class AddPostModel {
  bool? success;
  Data? data;
  String? message;


  AddPostModel.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['Message'];
  }


}

class Data {
  String? title;
  String? slug;
  String? description;
  int? userId;
  String? imagePath;
  String? updatedAt;
  String? createdAt;
  int? id;



  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    userId = json['user_id'];
    imagePath = json['image_path'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

}