class AddRealmodel {
  bool? success;
  Data? data;
  String? message;



  AddRealmodel.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['Message'];
  }

}

class Data {
  String? reelTitle;
  int? userId;
  String? reelUrl;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data.fromJson(Map<String, dynamic> json) {
    reelTitle = json['reel_title'];
    userId = json['user_id'];
    reelUrl = json['reel_url'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }


}