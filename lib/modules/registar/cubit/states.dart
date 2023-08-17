

import '../../../models/registarmodel.dart';

abstract class RegistarStates{}


class walkieRegistarInitialState extends RegistarStates{}

class walkieRegistarLodinglState extends RegistarStates{}

class walkieRegistarSuccessgState extends RegistarStates{
  final Registermodel Registarmodel;

  walkieRegistarSuccessgState(this.Registarmodel);
}

class walkieRegistarChangeVisibilitysgState extends RegistarStates{}

class walkieRegistarErrorState extends RegistarStates{

  final String? error;
  walkieRegistarErrorState(this.error);
}