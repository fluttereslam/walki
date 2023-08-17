class AddReview {
  bool? success;
  Data? data;
  String? message;


  AddReview.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['Message'];
  }


}

class Data {
  String? review;
  int? businessId;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;



  Data.fromJson(Map<String, dynamic> json) {
    review = json['review'];
    businessId = json['business_id'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

}