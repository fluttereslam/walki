



import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walki/models/addpostmodel.dart';
import 'package:walki/modules/addpost/states.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:video_player/video_player.dart';

import 'package:walki/shared/network/local/cashe_helper.dart';


import 'package:walki/shared/network/remote/dio_helper.dart';

class AddPostWalkieCubit extends Cubit<AddPostWalkieStates> {

  AddPostWalkieCubit() : super(AddPostWalkieInitialState());

  static AddPostWalkieCubit get(context) => BlocProvider.of(context);



  File? imageFile;
  bool? isImage;

  void saveFile(File croppedFile){
    isImage = true;
    imageFile = croppedFile;
    emit(WalkiesavepostImageState());
  }
  Future savevideoFile(File videoeFile) async{
    // await clearImageFile();
    //  emit(WalkieClearStoryImageFileState());
    isImage = false;
    emit(WalkiesavePostvideoState());
    await initializePlayer(videoeFile).then((value)  {
      imageFile = File(videoeFile.path);
      print("video picked");
      emit(WalkiesavePostvideoState());
    });
  }


  late  VideoPlayerController controller;



  Future initializePlayer(file) async {
    controller = VideoPlayerController.file(file);
    await Future.wait([controller.initialize()]);
    emit(WalkiesavePostvideoState());
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
      emit(WalkiePausePostvideoState());
    }else{
      controller.play();
      playapPause=Icons.pause;
      emit(WalkieplayPostvideoState());
    }

  }

  var token = caheHelper.getData(key: 'token');

  void disposeVideoController(){
    controller.dispose();
    emit(WalkieDisbausePostvideoState());
  }


  AddPostModel? addPostModel;
  void userAddPost ({
    required String Post_title,
    File? video_url,
    File? image_url,
  }){
    emit(walkieaddPostLodinglState());
    DioHelper.storePost(
        url:"posts",
        Post_title: Post_title,
        video_url: video_url,
        image_url: image_url,
        authorization: token,
        IsImage: isImage
    ).then((value) {
      addPostModel = AddPostModel.fromJson(value.data);
      emit(walkieaddPostSuccessgState(addPostModel!));
    } ).catchError((error){
      print("ERROR HERE ::: ${error.toString()}");
      emit(walkieaddPostErrorState(error.toString()));
    });
  }













}