

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walki/modules/comment/comment_cubit/states.dart';

class CommentCubit extends Cubit<CommentStates> {
  CommentCubit() : super(CommentInitialState());

  static CommentCubit get(context) => BlocProvider.of(context);



//   void ShowReplaies(int index){
//     replies.clear();
//     emit(clearReplaiesState());
//     replies.add(index);
//     emit(addReplaiesState());
//   }
//
// List<String> names =[
//   "eslam",
//   "mohamed",
//   "esmail",
//   "ebraheem",
//   "ali","backary","AlAnsary"
// ];
//
//
//   List<int> replies = [];





}