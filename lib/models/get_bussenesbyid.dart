class GetBussenesById {
  List<Business>? business;



  GetBussenesById.fromJson(Map<String, dynamic> json) {
    if (json['business'] != null) {
      business = <Business>[];
      json['business'].forEach((v) {
        business!.add(new Business.fromJson(v));
      });
    }
  }


}

class Business {
  int? id;
  String? name;
  String? address;
  String? location;
  String? city;
  String? images;
  String? createdAt;
  String? updatedAt;
  List<Reviews>? reviews;
  List<Products>? products;



  Business.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    location = json['location'];
    city = json['city'];
    images = json['images'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }


}

class Reviews {
  int? id;
  String? review;
  String? userId;
  String? businessId;
  String? createdAt;
  String? updatedAt;
  User? user;


  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    review = json['review'];
    userId = json['user_id'];
    businessId = json['business_id'];
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
  Null? emailVerifiedAt;
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

class Products {
  int? id;
  String? title;
  String? images;
  String? businessId;
  String? createdAt;
  String? updatedAt;


  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    images = json['images'];
    businessId = json['business_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}