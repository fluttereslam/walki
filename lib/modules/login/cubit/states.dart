



import 'package:walki/models/registarmodel.dart';

abstract class walkieLoginStates{}


class walkieLoginInitialState extends walkieLoginStates{}

class walkieLoginLodinglState extends walkieLoginStates{}

class walkieLoginSuccessgState extends walkieLoginStates{
  final Registermodel loginmodel;

  walkieLoginSuccessgState(this.loginmodel);
}


class walkieLoginErrorState extends walkieLoginStates{

  final String? error;
  walkieLoginErrorState(this.error);
}

class walkieLoginChangeVisibilitysgState extends walkieLoginStates{}


