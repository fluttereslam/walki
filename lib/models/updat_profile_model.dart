class UpdateProfileModel {
  bool? success;
  Data? data;
  String? message;



  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['Message'];
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
  String? fullName;


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
    fullName = json['full_name'];
  }

}