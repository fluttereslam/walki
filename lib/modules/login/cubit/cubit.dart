

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:walki/models/registarmodel.dart';
import 'package:walki/modules/login/cubit/states.dart';
import 'package:walki/shared/network/remote/dio_helper.dart';
import 'package:walki/shared/variables.dart';

class walkieLoginCubit extends Cubit<walkieLoginStates>{

  walkieLoginCubit() : super (walkieLoginInitialState());

  static walkieLoginCubit get(context) => BlocProvider.of(context);


  Registermodel? loginmodel;

  void userLogin ({
    required String email,
    required String password,

  }){
    emit(walkieLoginLodinglState());
    DioHelper.postData(url: "login",
      data: {
      'email': email,
      'password': password,
    },
      //authorization: token,
    ).then((value) {
      // print(value.data);

      loginmodel = Registermodel.fromJson(value.data);
      emit(walkieLoginSuccessgState(loginmodel!));
    } ).catchError((error){
      print(error.toString());
      emit(walkieLoginErrorState(error.toString()));
    });
  }

  IconData suffixIc = Icons.visibility_off;
  bool isPassword = true;
  void changevisibility() {
    isPassword = !isPassword;
    suffixIc = isPassword ?  Icons.visibility_off : Icons.visibility;
    emit(walkieLoginChangeVisibilitysgState());
  }





}