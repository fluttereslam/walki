import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:video_player/video_player.dart';
import 'package:walki/models/add_post_comment_model.dart';
import 'package:walki/models/addreviewmodel.dart';
import 'package:walki/models/allreelsmodel.dart';
import 'package:walki/models/favorites_model.dart';
import 'package:walki/models/follow_model.dart';
import 'package:walki/models/get_all_bussenes.dart';
import 'package:walki/models/get_bussenesbyid.dart';
import 'package:walki/models/get_post_model.dart';
import 'package:walki/models/get_profile_model.dart';
import 'package:walki/models/updat_profile_model.dart';
import 'package:walki/modules/addstory.dart';
import 'package:walki/shared/network/local/cashe_helper.dart';

import 'package:walki/shared/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/models/addreelmodel.dart';
import 'package:walki/modules/community.dart';
import 'package:walki/modules/home/home.dart';
import 'package:walki/modules/profile.dart';
import 'package:walki/shared/components/myapp.dart';
import 'package:walki/shared/network/remote/dio_helper.dart';

import '../../models/searsh_model.dart';
import '../../modules/morescreen.dart';
import '../../modules/reals/home.dart';


class walkieCubit extends Cubit<WalkieStates>{

  walkieCubit(): super(WalkieInitialState());

  static walkieCubit get(context)=>BlocProvider.of(context);

  int currentindex = 0;

  List<Widget> walkieScreens = [

    homeScreen(),
    RealPage(),
    //RealPage(),
    AddStory(),
    CommunityScreen(),
    MoreScreen(),
  ];



  void changeIndex(int index){
    currentindex = index;
    emit(WalkieChangeNavBarState());
  }


  int maxlines =3;
 // IconData arrow = Icons.keyboard_arrow_up;
  IconData arrow = Icons.keyboard_arrow_down;
  void incresepostlines(){
    if(maxlines==3){
    maxlines = 1000;
    arrow = Icons.keyboard_arrow_up;
    emit(WalkieIncreaseLinesState());
    }else
      {maxlines = 3;
      arrow = Icons.keyboard_arrow_down;
      emit(WalkieDecreaseLinesState());}
  }
  File? imageFile;
  bool? isImage;

  void saveFile(File croppedFile){
    isImage = true;
    imageFile = croppedFile;
    emit(WalkiesaveStoryImageState());
  }


  Future savevideoFile(File videoeFile) async{
  // await clearImageFile();
  //  emit(WalkieClearStoryImageFileState());
    isImage = false;
    emit(WalkiesaveStoryvideoState());
    await initializePlayer(videoeFile).then((value)  {
      imageFile = File(videoeFile.path);
      print("video picked");
      emit(WalkiesaveStoryvideoState());
    });
  }


  late  VideoPlayerController controller;



  Future initializePlayer(file) async {
    controller = VideoPlayerController.file(file);
    await Future.wait([controller.initialize()]);
    emit(WalkiesaveStoryvideoState());
  }


  final picker = ImagePicker();


  imgFromGallery() async {
    await  picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    ).then((value){
      if(value != null){
        cropImage(File(value.path));
      }
    });
  }



  videoFromGallery() async {
    await  picker.pickVideo(
      source: ImageSource.gallery,
    ).then((value){
      if(value != null){
        savevideoFile(File(value.path));

      }

    });
  }


  imgFromCamera() async {
    await picker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    ).then((value){
      if(value != null){
        cropImage(File(value.path));
      }
    });
  }


  cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ?[
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ] : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [AndroidUiSettings(
            toolbarTitle: "Image Cropper",
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      saveFile(File(croppedFile.path));

    }
  }


bool showAddReel = true;





void changeShowAddReel(){
  showAddReel = !showAddReel;
}






  IconData playapPause = Icons.play_arrow;

  void playOrPause(){
    if(controller.value.isPlaying){
      controller.pause();
      playapPause = Icons.play_arrow;
     emit(WalkiePauseStoryvideoState());
    }else{
      controller.play();
      playapPause=Icons.pause;
      emit(WalkieplayStoryvideoState());
    }

  }

var token = caheHelper.getData(key: 'token');
var myId = caheHelper.getData(key: 'myId');

  void disposeVideoController(){
    controller.dispose();
    emit(WalkieDisbauseStoryvideoState());
  }
  AddRealmodel? addRealmodel;
  void userAddreal ({
    required String reel_title,
    required File? reel_url,

  }){
    emit(walkieaddRealLodinglState());
    DioHelper.postReel(url:"reels",
        reel_title: reel_title,
        reel_url: reel_url!,
        authorization: token
    ).then((value) {
      addRealmodel = AddRealmodel.fromJson(value.data);
      emit(walkieaddRealSuccessgState(addRealmodel!));
    } ).catchError((error){
      print("ERROR HERE ::: ${error.toString()}");
      emit(walkieaddRealErrorState(error.toString()));
    });
  }

  Map RFollowings = {};
  Map RFavorites = {};


  AllReelsModel? allReelsModel;

  void getReels(){
    emit(shopGETReelsDataLoadingState());
    DioHelper.getData(url: "reels",
    authorization: token
    ).then((value) {
      allReelsModel = AllReelsModel.fromJson(value.data);
     // print("TITLE ::::: ${allReelsModel!.reels![2].reelTitle}");

      emit(shopGETReelsDataSuccesState());

      allReelsModel!.reels!.forEach((element) {
        RFollowings.addAll(
            {element.user!.id : element.isFollowing}
        );
        print("RFollowings:::::::::::::::${RFollowings}");
        //print(Favorites);

      });
      allReelsModel!.reels!.forEach((element) {
        RFavorites.addAll(
            {element.id : element.isLiked}
        );
        //print(Followings);
        print("RFavorites:::::::::::::::${RFavorites}");

      });
    }).catchError((error){
      print("${error.toString()}");
      emit(shopGETReelsDataErrorState());
    });
    
  }









  //
  // ChangeFavoriteModel? changeFavoriteModel;
  //
  //
  // void changeFavorites(int? productId){
  //   Favorites[productId] = !Favorites[productId];
  //   emit(shopChangeFavoriteState());
  //   DioHelper.postData(
  //       url: FAVORITES,
  //       data: {
  //         'product_id' : productId
  //       },
  //       authorization: token
  //   ).then((value) {
  //     changeFavoriteModel =  ChangeFavoriteModel.fromJson(value.data);
  //     if(changeFavoriteModel!.status == false ){
  //       Favorites[productId] = !Favorites[productId];
  //     }else{
  //       getFavorites();
  //     }
  //
  //     emit(shopChangeFavoriteSuccesState(changeFavoriteModel!));
  //
  //     print(value.data);
  //
  //   }).catchError((onError){
  //     Favorites[productId] = !Favorites[productId];
  //     emit(shopChangeFavoriteErrorState());
  //   });
  //
  // }
  //
  //
  //
  // Map Favorites = {};
  //
  //
  // HomeModel? homeModel;
  //
  // void getHomeData(){
  //   emit(shopLoadigHomeDataState());
  //   DioHelper.getData(url: HOME,
  //       authorization: token).then((value)
  //   {
  //
  //     homeModel = HomeModel.fromJson(value.data);
  //     emit(shopGETHomeDataSuccesState());
  //
  //     //  print(homeModel!.status);
  //     // print(homeModel!.data!.banners[0].id);
  //     homeModel!.data!.products.forEach((element) {
  //       Favorites.addAll(
  //           {element.id : element.inFavorites}
  //       );
  //     });
  //     print(Favorites);
  //
  //
  //   });
  // }
  //
  //
  // CatigoryModel? categoryModel;
  //
  // void getCategoryData(){
  //   emit(shopLoadigCatigoryDataState());
  //
  //   DioHelper.getData(url: GETCATEGORIES).then((value){
  //     categoryModel = CatigoryModel.fromJson(value.data);
  //     emit(shopGETCatigoryDataSuccesState());
  //   }).catchError((error){
  //     print(error);
  //     emit(shopGETCatigoryDataErrorState());
  //
  //   });
  //
  // }
  //
  //
  //
  //
  // FavoritesModel? favoritemodel;
  //
  //
  // void getFavorites(){
  //   DioHelper.getData(
  //       url: FAVORITES
  //       ,authorization: token)
  //       .then((value) {
  //     favoritemodel = FavoritesModel.fromJson(value.data);
  //     emit(shopGETFAvoritesSuccesState());
  //   })
  //       .catchError((onError){
  //     emit(shopGETFavoritesErrorState());
  //
  //   });
  //
  //
  // }
  //
  //
  //
  //
  // shopLoginModel? profilemodel;
  //
  //
  GetProfileModel? getProfileModel;

  void getProfileData(){
    emit(WalkieGETProfileDataLoadingState());
    DioHelper.getData(
        url: "users/$myId"
        ,authorization: token)
        .then((value) {
      getProfileModel = GetProfileModel.fromJson(value.data);
     // print("POST (0) TITLE :::==>>${getProfileModel!.posts![0].title}");
      emit(WalkieGETProfileDataSuccesState());
    })
        .catchError((onError){
          print(onError);
      emit(WalkieGETProfileDataErrorState());


    });


  }
  //
  // void updateProfileData(
  //     {
  //       required String name,
  //       required String phone,
  //       required String email}){
  //
  //
  //   emit(shopUpdateLodinglState());
  //   DioHelper.putData(
  //       url: UPDATE_PROFILE
  //       ,authorization: token,
  //       data: {
  //         "name" : name,
  //         "phone" : phone,
  //         "email" : email
  //       })
  //       .then((value) {
  //     profilemodel = shopLoginModel.fromJson(value.data);
  //     emit(shopUpdateSuccessgState(profilemodel!));
  //   }).catchError((onError){
  //     emit(shopUpdateErrorState(onError));
  //
  //   });
  //
  //
  // }




  GetProfileModel? getotherUserProfileModel;

  void getotherUserProfileData({
    int? Id
}){
    emit(WalkieGETOtherUserProfileDataLoadingState());
    DioHelper.getData(
        url: "users/$Id"
        ,authorization: token)
        .then((value) {
      getotherUserProfileModel = GetProfileModel.fromJson(value.data);
      // print("POST (0) TITLE :::==>>${getProfileModel!.posts![0].title}");
      emit(WalkieGetOtherUserProfileDataSuccesState());
    })
        .catchError((onError){
      print(onError);
      emit(WalkieGETOtherUserProfileDataErrorState());


    });


  }
  //
  // void updateProfileData(
  //     {
  //       required String name,
  //       required String phone,
  //       required String email}){
  //
  //
  //   emit(shopUpdateLodinglState());
  //   DioHelper.putData(
  //       url: UPDATE_PROFILE
  //       ,authorization: token,
  //       data: {
  //         "name" : name,
  //         "phone" : phone,
  //         "email" : email
  //       })
  //       .then((value) {
  //     profilemodel = shopLoginModel.fromJson(value.data);
  //     emit(shopUpdateSuccessgState(profilemodel!));
  //   }).catchError((onError){
  //     emit(shopUpdateErrorState(onError));
  //
  //   });
  //
  //
  // }

int restorcafe = 1;
  void changeRadioValue(value){
    restorcafe = value;
    emit(changeRadioValueState());
  }

  int expensivorcheep = 1;


  void changeRadioEXorCHValue(value){
    expensivorcheep = value;
    emit(changeRadioValueState());
  }


bool isCafe= false;
  void changeCafeButton(){
    isCafe = !isCafe;
    print("$isCafe");
    if(isRetaurant){isRetaurant=false;}
    if(isShopping){isShopping=false;}
    emit(changeCafeButtonn());
  }

  bool isRetaurant= false;
  void changeRetaurantButton(){
    isRetaurant = !isRetaurant;
    print("$isRetaurant");
    if(isCafe){isCafe=false;}
    if(isShopping){isShopping=false;}
    emit(changeRetaurantButtonn());
  }




  bool isShopping= false;
  void changeShoppingButton(){
    isShopping = !isShopping;
    print("$isShopping");
    if(isRetaurant){isRetaurant=false;}
    if(isCafe){isCafe=false;}

    emit(changeShoppingButtonn());
  }


  String followText = 'follow';
  bool isFollowing= false;
  void changeFollowingButton(){
    isFollowing = !isFollowing;
    print("$isFollowing");
    if(isFollowing){
      followText="following";
      emit(changeFollowingButtonn());
    }else{
      followText="follow";
      emit(changeFollowingButtonn());
    }

    emit(changeFollowingButtonn());
  }



  String bookText = 'Book Now';
  bool isbooked= false;
  void changeBookingTourButton(){
    isbooked = !isbooked;
    print("$isbooked");
    if(isbooked){
      bookText="Booked";
      emit(changeBookingButtonn());
    }else{
      bookText="Book Now";
      emit(changeBookingButtonn());
    }

    emit(changeBookingButtonn());
  }

  String bookTripText = 'Book Now';
  bool isTripbooked= false;
  void changeBookingTripButton(){
    isTripbooked = !isTripbooked;
    print("$isTripbooked");
    if(isTripbooked){
      bookTripText="Booked";
      emit(changeBookingTripButtonn());
    }else{
      bookTripText="Book Now";
      emit(changeBookingTripButtonn());
    }

    emit(changeBookingTripButtonn());
  }

int tabindex =0;

  void changeTabindex(index){
    tabindex = index;
    print(tabindex);
    emit(changeTabindexstate());
  }

  int bussenestabindex =0;

  void changeBussenesTabindex(index){
    bussenestabindex = index;
    print(bussenestabindex);
    emit(changeTabindexstate());
  }


bool isFaucus = true;

  void ChangeAddPostUI(bool condition){
    if(condition){isFaucus = !isFaucus;
    emit(ChangeAddPostUIstate());
    }
    if(!condition){isFaucus = isFaucus;
    emit(ChangeAddPostUIstate());
    }


  }




  // final List<String> reelvideos = [
  //   "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  //   'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  // ];
  int index = 0;
  late  VideoPlayerController reelcontroller;
  Duration  Possisionn = Duration.zero;
  Duration  duration = Duration.zero;


  void reelinitState(src)async{
    reelcontroller = VideoPlayerController.asset(
        src);
    await Future.wait([reelcontroller.initialize()]);
    // });
    emit(reelVideoReadyToPlaystate());

  }

  void reelplayapause(){
    reelcontroller.value.isPlaying ? {
      reelcontroller.pause(),
      if(Possisionn == duration){
        reelcontroller.removeListener(() {}),
        emit(reelVideolistenerRemovedState()),
      },
      emit(reelVideoPausedState()),
    }
        :{
      reelcontroller.play(),
      reelcontroller.addListener(() async {
        final newPosition = await reelcontroller.value.position;
        final newduration= await reelcontroller.value.duration;
        duration = newduration;
        Possisionn = newPosition;
        emit(reelVideolistenerAddedState());
        // ;
      }),
      emit(reelVideoPlayState()),
    };

  }


  Map Followings = {};
  Map Favorites = {};

GetPostModel? getPostModel;

void getPostsData(){
  emit(walkieLoadigGetPostDataState());
  DioHelper.getData(
      url: "posts",
    authorization: token
  ).then((value){
    getPostModel = GetPostModel.fromJson(value.data);
    emit(walkieGETGetPostDataSuccesState(getPostModel!));
    print("${getPostModel!.posts![1].title}");
  getPostModel!.posts!.forEach((element) {
    Followings.addAll(
        {element.user!.id : element.isFollowing}
    );
   print(Followings);
    //print(Favorites);

  });
    getPostModel!.posts!.forEach((element) {
      Favorites.addAll(
          {element.id : element.isLiked}
      );
      //print(Followings);
    //  print(Favorites);

    });
  }).catchError((error){
    print(error.toString());
    emit(walkieGETGetPostDataErrorState(error.toString()));

  });

}














  void ShowReplaies(int index){
    replies.clear();
    emit(clearReplaiesState());
    replies.add(index);
    emit(addReplaiesState());
  }

  List<String> names =[
    "eslam",
    "mohamed",
    "esmail",
    "ebraheem",
    "ali","backary","AlAnsary"
  ];


  List<int> replies = [];








  final List<String> genderItem = [
    'male',
    'female',

  ];
  String? selectedgenderItem ;


void changeselectedgenderItem(item){
  selectedgenderItem = item;
  emit(changeselectedgenderItemstate());

}


  final List<String> placeItem = [
    'Ismailia',
    'Cairo',
    'Portsaid',
    'Alexandria',
    'sharqia',
    'Aloxor',
    'Almansora',



  ];
  String? selectedplaceItem;


  void changeselectedplaceItem(item){
    selectedplaceItem = item;
    emit(changeselectedplaceItemstate());

  }

  PostComment? postComment;

  void  addComment ({
    required String body,
    required String? url,
    required int? post_id,
    required bool? isPost,


  }){
    emit(walkieaddCommentLodinglState());
    DioHelper.postData(url: url,
        authorization: token,
        data: {
      'body': body,
          '${isPost! ?'post_id' : 'reel_id'}': post_id,


    }).then((value) {
      postComment = PostComment.fromJson(value.data);
      //print("${registermodel!.data!.user!.firstName}");
      isPost ? getPostsData(): getReels();
      emit(walkieaddCommentSuccessgState (postComment!));
    } ).catchError((error){
      print("ERROR IN Add PostComment :: ${error.toString()}");
      //  registermodel = Registermodel.fromJson(value.data);
      //print("${postComment!.message}");

      emit(walkieaddCommentErrorState(error.toString()));
    });
  }




  AddReview? addReview;

  void  addReviewFun({
    required String? review,
    required int? business_id,



  }){
    emit(walkieAddReviewLodinglState());
    DioHelper.postData(url: "review",
        authorization: token,
        data: {
          'review': review,
          'business_id': business_id,


        }).then((value) {
      addReview = AddReview.fromJson(value.data);
      //print("${registermodel!.data!.user!.firstName}");
     // isPost ? getPostsData(): getReels();
      getBusinessesById(business_id);
      emit(walkieAddReviewSuccessgState (addReview!));
    } ).catchError((error){
      print("ERROR IN Add PostComment :: ${error.toString()}");
      //  registermodel = Registermodel.fromJson(value.data);
      //print("${postComment!.message}");

      emit(walkieAddReviewErrorState(error.toString()));
    });
  }





  SearchModel? searchModel;

  void  searchInApp({
    required String? search,
  }){
    emit(walkieSearchLodinglState());
    DioHelper.postData(url: "Search",
        authorization: token,
        data: {
          'search': search,
        }).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(walkieSearchSuccessgState (searchModel!));
    } ).catchError((error){

      print("ERROR IN Add PostComment :: ${error.toString()}");
      emit(walkieSearchErrorState(error.toString()));

    });
  }




  FavoritesModel? favoritesModel;









  void changeReelFavorites(int? Id){
     RFavorites[Id] = !RFavorites[Id];
    emit(walkieChangeReelFavoriteLoadingState());
    DioHelper.postData(
        url: "reel/like",
        data: {
          'reel_id' :Id
        },
        authorization: token
    ).then((value) {
      favoritesModel =  FavoritesModel.fromJson(value.data);

      getReels();
      // if(favoritesModel!.status == false ){
      //   Favorites[Id] = !Favorites[Id];
      // }
      // else{
      //   getFavorites();
      // }

      emit(walkieChangeReelFavoriteSuccesState(favoritesModel!));

      print(value.data);

    }).catchError((error){
      RFavorites[Id] = !RFavorites[Id];
      print(error.toString());
      emit(walkieChangeReelFavoriteErrorState(error.toString()));
    });

  }






  FollowModel? followModel;

  void changeFollowing(int? Id){
    Followings[Id] = !Followings[Id];
    emit(walkieChangeFollowLoadingState());
    DioHelper.postData(
        url: "users/follow",
        data: {
          'user_id' :Id
        },
        authorization: token
    ).then((value) async{
    followModel =  await FollowModel.fromJson(value.data);

      //changeFollowingButton();

      print(followModel!.message);




      emit(walkieChangeFollowSuccesState(followModel!));
      print(followModel!.message);
      print(value.data);
    }).catchError((error){
      //changeFollowingButton();
      Followings[Id] = !Followings[Id];
      emit(walkieChangeFollowErrorState(error.toString()));
    });

  }
  void changeReelFollowing(int? Id){
    RFollowings[Id] = !RFollowings[Id];
    emit(walkieChangeFollowLoadingState());
    DioHelper.postData(
        url: "users/follow",
        data: {
          'user_id' :Id
        },
        authorization: token
    ).then((value) async{
    followModel =  await FollowModel.fromJson(value.data);

      //changeFollowingButton();

      print(followModel!.message);

      // if(favoritesModel!.status == false ){
      //   Favorites[Id] = !Favorites[Id];
      // }
      // else{
      //   getFavorites();
      // }


      emit(walkieChangeFollowSuccesState(followModel!));
      print(followModel!.message);
      print(value.data);
    }).catchError((error){
      //changeFollowingButton();
      RFollowings[Id] = !RFollowings[Id];
      emit(walkieChangeFollowErrorState(error.toString()));
    });

  }



  void changeFavorites(int? Id){
     Favorites[Id] = !Favorites[Id];
    emit(walkieChangeFavoriteLoadingState());
    DioHelper.postData(
        url: "post/like",
        data: {
          'post_id' :Id
        },
        authorization: token
    ).then((value) {
      favoritesModel =  FavoritesModel.fromJson(value.data);

      getPostsData();
      // if(favoritesModel!.status == false ){
      //   Favorites[Id] = !Favorites[Id];
      // }
      // else{
      //   getFavorites();
      // }

      emit(walkieChangeFavoriteSuccesState(favoritesModel!));

      print(value.data);

    }).catchError((error){
       Favorites[Id] = !Favorites[Id];
      emit(walkieChangeFavoriteErrorState(error.toString()));
    });

  }

  File? avatarImage;
  bool isAvatar = false;

  void saveAvatarFile(File croppedFile){
    isAvatar = true;
    emit(WalkiesaveavatarImageState());
    avatarImage = croppedFile;
    emit(WalkiesaveavatarImageState());
  }




  //final avatarImagePicker = ImagePicker();


  avatarImgFromGallery() async {
    await  picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    ).then((value){
      if(value != null){
        cropAvatarImagePicker(File(value.path));
      }
    });
  }


  avatarImgFromCamera() async {
    await picker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    ).then((value){
      if(value != null){
        cropAvatarImagePicker(File(value.path));
      }
    });
  }




  cropAvatarImagePicker(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ?[
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ] : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [AndroidUiSettings(
            toolbarTitle: "Image Cropper",
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      saveAvatarFile(File(croppedFile.path));

    }
  }



UpdateProfileModel? updateProfileModel;

  void updateProfilePhoto({
    required String first_name,
    required String last_name,
    //required String bio,
    required File? avatar,
    required String email,
   // required String address,
   // required String phone,
   // required String gender,
   // required int? user_id,


  }){
    emit(walkieupdateProfileLodinglState());
    DioHelper.postProfileData(
        url: "users/update",
        first_name: first_name,
        last_name: last_name,
        email: email,
     // bio: bio,
      avatar: avatar!,
       // address: address,phone: phone,gender: gender,
        user_id: myId,
      authorization: token


      //authorization: token,
    ).then((value) {
      // print(value.data);
      getProfileData();
      updateProfileModel = UpdateProfileModel.fromJson(value.data);
      emit(walkieupdateProfileSuccesState(updateProfileModel!));
    } ).catchError((error){
      print(error.toString());
      emit(walkieupdateProfileErrorState(error.toString()));
    });
  }


void updateProfile({

  String? authorization,
  required String first_name,
  required String last_name,
   String? bio,
 // required File avatar,
  required String email,
 // required  String address,
   String? phone,
   String? gender,
}){
  emit(walkieupdateProfileLodinglState());
  DioHelper.postData(
    url: "users/update",
    authorization: token,
    data: {
      'first_name': first_name,
      'last_name': last_name,
       'bio': bio?? null,
      // 'avatar': (avatar== null) ? null :await MultipartFile.fromFile(avatar.path,filename: avatar.path),
      'email': email,
      //'address': address,
      'phone': phone ?? null,
      'gender': gender?? null,
      'user_id': myId,
    },
    //authorization: token,
  ).then((value) {
    // print(value.data);
    getProfileData();
    updateProfileModel = UpdateProfileModel.fromJson(value.data);
    emit(walkieupdateProfileSuccesState(updateProfileModel!));

  }).catchError((error){
    print(error.toString());
    emit(walkieupdateProfileErrorState(error.toString()));
  });
}


GetAllBussenesModel? getAllBussenesModel;

void getAllBusinesses(){
  emit(walkiegetAllBusinessesLodinglState()) ;
  DioHelper.getData(
    url: "Businesses",
    authorization: token,
  ).then((value) {
    getAllBussenesModel = GetAllBussenesModel.fromJson(value.data);
    emit(walkiegetAllBusinessesSuccesState(getAllBussenesModel!));

  }).catchError((error){
    print(error.toString());
    emit(walkiegetAllBusinessesErrorState(error.toString()));
  });
}



GetBussenesById? getBussenesById;

  void getBusinessesById(Id){
    emit(walkiegetBusinessesByIdLodinglState()) ;
    DioHelper.getData(
      url: "Business/$Id",
      authorization: token,
    ).then((value) {
      getBussenesById = GetBussenesById.fromJson(value.data);
      emit(walkiegetBusinessesByIdSuccesState(getBussenesById!));

    }).catchError((error){
      print(error.toString());
      emit(walkiegetBusinessesByIdErrorState(error.toString()));
    });
  }




}