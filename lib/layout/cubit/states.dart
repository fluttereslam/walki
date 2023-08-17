

import 'package:walki/models/add_post_comment_model.dart';
import 'package:walki/models/addpostmodel.dart';
import 'package:walki/models/addreelmodel.dart';
import 'package:walki/models/addreviewmodel.dart';
import 'package:walki/models/favorites_model.dart';
import 'package:walki/models/follow_model.dart';
import 'package:walki/models/get_all_bussenes.dart';
import 'package:walki/models/get_bussenesbyid.dart';
import 'package:walki/models/get_post_model.dart';
import 'package:walki/models/searsh_model.dart';
import 'package:walki/models/updat_profile_model.dart';

abstract class  WalkieStates {}



class WalkieInitialState extends  WalkieStates{}

class WalkieChangeNavBarState extends  WalkieStates{}

class WalkieGetDataSucessApiState extends  WalkieStates{}

class WalkieIncreaseLinesState extends  WalkieStates{}
class WalkieDecreaseLinesState extends  WalkieStates{}
class WalkiesaveStoryImageState extends  WalkieStates{}
class WalkiesaveStoryvideoState extends  WalkieStates{}
class WalkieplayStoryvideoState extends  WalkieStates{}
class WalkiePauseStoryvideoState extends  WalkieStates{}
class WalkieDisbauseStoryvideoState extends  WalkieStates{}
class WalkieClearStoryImageFileState extends  WalkieStates{}

class WalkieGETProfileDataSuccesState extends  WalkieStates{}
class WalkieGETProfileDataErrorState extends  WalkieStates{}
class WalkieGETProfileDataLoadingState extends  WalkieStates{}

class WalkieGetOtherUserProfileDataSuccesState extends  WalkieStates{}
class WalkieLogedOutSuccesState extends  WalkieStates{}
class WalkieGETOtherUserProfileDataErrorState extends  WalkieStates{}
class WalkieGETOtherUserProfileDataLoadingState extends  WalkieStates{}





class changeRadioValueState extends  WalkieStates{}
class changeCafeButtonn extends  WalkieStates{}
class changeRetaurantButtonn extends  WalkieStates{}
class changeShoppingButtonn extends  WalkieStates{}
class changeFollowingButtonn extends  WalkieStates{}
class changeBookingButtonn extends  WalkieStates{}
class changeBookingTripButtonn extends  WalkieStates{}
class changeTabindexstate extends  WalkieStates{}
class ChangeAddPostUIstate extends  WalkieStates{}

class shopGETReelsDataSuccesState extends  WalkieStates{}
class shopGETReelsDataErrorState extends  WalkieStates{}
class shopGETReelsDataLoadingState extends  WalkieStates{}

class addReplaiesState extends  WalkieStates{}
class clearReplaiesState extends  WalkieStates{}

class WalkieGetDataErrorApiState extends  WalkieStates{
  // late String error;
  // WalkieGetDataErrorApiState(this.error);
}

class walkieLoadigGetPostDataState extends WalkieStates{}
class walkieaddRealLodinglState extends WalkieStates{}


class walkieGETGetPostDataSuccesState extends WalkieStates{
  final GetPostModel getPostModel;

  walkieGETGetPostDataSuccesState(this.getPostModel);
}

class walkieaddRealErrorState extends WalkieStates{

  final String? error;
  walkieaddRealErrorState(this.error);
}


class walkieaddCommentLodinglState extends WalkieStates{}


class walkieaddCommentSuccessgState extends WalkieStates{
  final PostComment postComment;

  walkieaddCommentSuccessgState(this.postComment);
}

class walkieaddCommentErrorState extends WalkieStates{

  final String? error;
  walkieaddCommentErrorState(this.error);
}

class walkieAddReviewLodinglState extends WalkieStates{}


class walkieAddReviewSuccessgState extends WalkieStates{
  final AddReview addReview;

  walkieAddReviewSuccessgState(this.addReview);
}

class walkieAddReviewErrorState extends WalkieStates{

  final String? error;
  walkieAddReviewErrorState(this.error);
}






class walkieSearchLodinglState extends WalkieStates{}


class walkieSearchSuccessgState extends WalkieStates{
  final SearchModel searchModel;

  walkieSearchSuccessgState(this.searchModel);
}

class walkieSearchErrorState extends WalkieStates{

  final String? error;
  walkieSearchErrorState(this.error);
}




class walkieaddRealSuccessgState extends WalkieStates{
  final AddRealmodel addRealmodel;

  walkieaddRealSuccessgState(this.addRealmodel);
}


class walkieGETGetPostDataErrorState extends WalkieStates{

  final String? error;
  walkieGETGetPostDataErrorState(this.error);
}

class reelVideoReadyToPlaystate extends  WalkieStates{}
class reelVideoIsInitializedState extends  WalkieStates{}
class reelVideolistenerAddedState extends  WalkieStates{}
class reelVideolistenerRemovedState extends  WalkieStates{}
class reelVideoPausedState extends  WalkieStates{}
class reelVideoPlayState extends  WalkieStates{}
class reelVideolistenDurationAndPossitionErrorState extends  WalkieStates{}

class changeselectedgenderItemstate extends  WalkieStates{}
class changeselectedplaceItemstate extends  WalkieStates{}







class walkieChangeFavoriteLoadingState extends WalkieStates{}


class walkieChangeFavoriteSuccesState extends WalkieStates{
  final FavoritesModel favoritesModel;

  walkieChangeFavoriteSuccesState(this.favoritesModel);
}

class walkieChangeFavoriteErrorState extends WalkieStates{

  final String? error;
  walkieChangeFavoriteErrorState(this.error);
}



class walkieChangeReelFavoriteLoadingState extends WalkieStates{}


class walkieChangeReelFavoriteSuccesState extends WalkieStates{
  final FavoritesModel favoritesModel;

  walkieChangeReelFavoriteSuccesState(this.favoritesModel);
}

class walkieChangeReelFavoriteErrorState extends WalkieStates{

  final String? error;
  walkieChangeReelFavoriteErrorState(this.error);
}




class walkieChangeFollowLoadingState extends WalkieStates{}

class WalkiesaveavatarImageState extends WalkieStates{}


class walkieChangeFollowSuccesState extends WalkieStates{
  final FollowModel followModel;

  walkieChangeFollowSuccesState(this.followModel);
}

class walkieChangeFollowErrorState extends WalkieStates{

  final String? error;
  walkieChangeFollowErrorState(this.error);
}




class walkieupdateProfileLodinglState extends WalkieStates{}


class walkieupdateProfileSuccesState extends WalkieStates{
  final UpdateProfileModel updateProfileModel;

  walkieupdateProfileSuccesState(this.updateProfileModel);
}

class walkieupdateProfileErrorState extends WalkieStates {

  final String? error;

  walkieupdateProfileErrorState(this.error);

}

class walkiegetAllBusinessesLodinglState extends WalkieStates{}


class walkiegetAllBusinessesSuccesState extends WalkieStates{
  final GetAllBussenesModel getAllBussenesModel;

  walkiegetAllBusinessesSuccesState(this.getAllBussenesModel);
}

class walkiegetAllBusinessesErrorState extends WalkieStates {

  final String? error;

  walkiegetAllBusinessesErrorState(this.error);

}


class walkiegetBusinessesByIdLodinglState extends WalkieStates{}


class walkiegetBusinessesByIdSuccesState extends WalkieStates{
  final GetBussenesById getBussenesById;

  walkiegetBusinessesByIdSuccesState(this.getBussenesById);
}

class walkiegetBusinessesByIdErrorState extends WalkieStates {

  final String? error;

  walkiegetBusinessesByIdErrorState(this.error);

}


//
// class newsLoadingDataFromApiState extends  NewsState{}
//
//
// class newsGetSportsSucessApiState extends  NewsState{}
//
//
// class newsGetSportsErrorApiState extends  NewsState{
//   late String error;
//   newsGetSportsErrorApiState(this.error);
// }
//
// class newsLoadingSportsFromApiState extends  NewsState{}
//
// class newsGetScienceSucessApiState extends  NewsState{}
//
//
// class newsGetScienceErrorApiState extends  NewsState{
//   late String error;
//   newsGetScienceErrorApiState(this.error);
// }
//
// class newsLoadingScienceFromApiState extends  NewsState{}
//
//
//
//
//
// class newsGetSearchSucessApiState extends  NewsState{}
//
//
// class newsGetSearchErrorApiState extends  NewsState{
//   late String error;
//   newsGetSearchErrorApiState(this.error);
// }
//
// class newsLoadingSearchFromApiState extends  NewsState{}
