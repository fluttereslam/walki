
import 'package:walki/models/addpostmodel.dart';

abstract class  AddPostWalkieStates {}

class AddPostWalkieInitialState extends  AddPostWalkieStates{}

class WalkiesavepostImageState extends  AddPostWalkieStates{}
class WalkiesavePostvideoState extends  AddPostWalkieStates{}
class WalkiePausePostvideoState extends  AddPostWalkieStates{}
class WalkieplayPostvideoState extends  AddPostWalkieStates{}
class WalkieDisbausePostvideoState extends  AddPostWalkieStates{}



class walkieaddPostLodinglState extends  AddPostWalkieStates{}

class walkieaddPostSuccessgState extends  AddPostWalkieStates{
  final AddPostModel addPostModel;
  walkieaddPostSuccessgState(this.addPostModel);
}
class walkieaddPostErrorState extends  AddPostWalkieStates{
  final String? error;
  walkieaddPostErrorState(this.error);
}


