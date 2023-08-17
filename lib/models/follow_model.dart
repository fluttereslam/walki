class FollowModel {
  String? message;
  bool? Isfollowing;



  FollowModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    Isfollowing = json['Isfollowing'];
  }

}