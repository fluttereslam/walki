import 'package:walki/modules/login/login.dart';
import 'package:walki/shared/network/local/cashe_helper.dart';

import 'components/components.dart';

String? token ;


String defaultAvatar = "https://cdn.pixabay.com/user/2023/02/26/11-15-00-151_250x250.png";
String defaultBio = "hello every one";










void logout(context){
  caheHelper.removeData(key: "token").then((value) {
    if(value) {
      navigateAndFinish(context, Log_in());}
  });
}