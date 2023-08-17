class FavoritesModel {
  String? message;
  bool? isliked;



  FavoritesModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isliked = json['Isliked'];
  }

}