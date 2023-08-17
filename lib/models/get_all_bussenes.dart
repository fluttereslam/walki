class GetAllBussenesModel {
  List<Data>? data;



  GetAllBussenesModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? address;
  String? location;
  String? city;
  String? images;
  String? createdAt;
  String? updatedAt;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    location = json['location'];
    city = json['city'];
    images = json['images'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}