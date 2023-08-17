
import 'dart:io';

import 'package:dio/dio.dart';

//https://walkie-v2.000webhostapp.com/api

class DioHelper{

  static Dio? dio;

  static init(){
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://walkie-v2.000webhostapp.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            //'Content-Type' : 'application/json',
           // 'Authorization' : token ?? ''
            'Accept' : '*/*',
            'Connection' : 'keep-alive',
          }
      ),
    );

  }

  static  Future<Response> getData({

    required url,

    String? authorization,
  }) async {
    dio!.options.headers = {
      'Authorization' : authorization??'',
      'Accept' : '*/*',
      'Connection' : 'keep-alive',

    };
    return await dio!.get(url,);


  }


  static Future<Response> postData(
      {
        required url,
        required Map<String, dynamic>? data,
        String? authorization,
      }) async{
    dio!.options.headers = {
      'Authorization' : authorization??'',
      "accept": "*/*",
      "Connection": "keep-alive",
    };

    return await dio!.post(
        url,
        data: data

    );


  }




  static Future<Response> postProfileData(
      {
        required url,
        String? authorization,
        required String first_name,
        required String last_name,
        // required String bio,
        required File avatar,
        required String email,
        // required  String address,
        // required String phone,
        // required String gender,
        required String user_id,
      }) async{
    dio!.options.headers = {
      'Authorization' : authorization??'',
      "accept": "*/*",
      "Connection": "keep-alive",
    };
    FormData data = FormData.fromMap({
      'first_name': first_name,
      'last_name': last_name,
      // 'bio': bio,
      'avatar': (avatar== null) ? null :await MultipartFile.fromFile(avatar.path,filename: avatar.path),
      'email': email,
      // 'address': address,
      // 'phone': phone,
      // 'gender': gender,
      'user_id': user_id,
    });

    return await dio!.post(
        url,
        data: data

    );


  }


  static Future<Response> postReel(
      {
        required url,
        String? authorization,
        required String reel_title,
        required  File reel_url,
      }) async{
    dio!.options.headers = {
      "accept": "*/*",
      "Connection": "keep-alive",
      'Content-Type' : 'multipart/form-data',
      'Authorization' : authorization??'',
    };
    FormData data = FormData.fromMap({
      'reel_title': reel_title,
      'reel_url': await MultipartFile.fromFile(reel_url.path,filename: reel_url.path),
    });
    return await dio!.post(
        url,
       // queryParameters: Quiry,
        data: data

    );


  }



  static Future<Response> storePost(
      {
        required url,
        required bool? IsImage,
        String? authorization,
        required String Post_title,
          File? video_url,
          File? image_url,
      }) async{
    dio!.options.headers = {
      "accept": "*/*",
      "Connection": "keep-alive",
      'Content-Type' : 'multipart/form-data',
      'Authorization' : authorization??'',
    };

    // String filename = reel_url.path.split('/mp4').last;
    FormData data = FormData.fromMap({
      'title': Post_title,
      'description': Post_title,
      'video':(video_url== null) ? null : await MultipartFile.fromFile(video_url.path,filename: video_url.path),
      'image': (image_url == null) ? null : await MultipartFile.fromFile(image_url.path,filename: image_url.path),
    });
    return await dio!.post(
        url,
        // queryParameters: Quiry,
        data: data

    );


  }



  static  Future<Response> putData(
      {
        required url,
        Map<String, dynamic>? Quiry,
        required Map<String, dynamic>? data,
        String lang = 'en',
        String? authorization,

      }) async{

    dio!.options.headers = {
      'lang' : lang,
      'Authorization' : authorization??'',
      'Content-Type' : 'application/json'
    };

    return await dio!.put(
        url,
        queryParameters: Quiry,
        data: data

    );


  }


}