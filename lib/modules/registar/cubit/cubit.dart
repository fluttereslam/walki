
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walki/modules/registar/cubit/states.dart';

import '../../../models/registarmodel.dart';
import '../../../shared/network/remote/dio_helper.dart';

class walkieRegistarCubit extends Cubit<RegistarStates>{

  walkieRegistarCubit() : super (walkieRegistarInitialState());

  static walkieRegistarCubit get(context) => BlocProvider.of(context);


  Registermodel? registermodel;

  void userRegistar ({
    required String email,
    required String password,
    required String fname,
    required String lname,
  }){
    emit(walkieRegistarLodinglState());
    DioHelper.postData(url: "register", data: {
      'first_name': fname,
      'last_name': lname,
      'email': email,
      'password': password,
      'password_confirmation': password,
    }).then((value) {
      registermodel = Registermodel.fromJson(value.data);
      //print("${registermodel!.data!.user!.firstName}");
      emit(walkieRegistarSuccessgState (registermodel!));
    } ).catchError((error){
      print("ERROR IN REGISTAR :: ${error.toString()}");
    //  registermodel = Registermodel.fromJson(value.data);
      //print("${registermodel!.message}");

      emit(walkieRegistarErrorState(error.toString()));
    });
  }

  IconData suffixIc = Icons.visibility;
  bool isPassword = true;
  void changevisibility() {
    isPassword = !isPassword;
    suffixIc = isPassword ?  Icons.visibility : Icons.visibility_off;
    emit(walkieRegistarChangeVisibilitysgState());
  }





}