import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/modules/addstory.dart';
import 'package:walki/modules/comment/comment_cubit/cubit.dart';
import 'package:walki/modules/fsplash.dart';
import 'package:walki/modules/lovesscreen.dart';
import 'package:walki/modules/story/cubit/cubit.dart';

import 'package:walki/shared/blockobserver.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/components/components.dart';
import 'package:walki/shared/network/local/cashe_helper.dart';
import 'package:walki/shared/network/remote/dio_helper.dart';



import 'layout/home_layout.dart';
import 'modules/addpost/cubit.dart';
import 'modules/all_top_cafee.dart';
import 'modules/addpost/addpost.dart';
import 'modules/all_top_restaurant.dart';
import 'modules/allevents.dart';
import 'modules/checkinterrests.dart';
import 'modules/comment/commentsscreen.dart';
import 'modules/community.dart';
import 'modules/evenrdetail.dart';
import 'modules/hi_sir.dart';
import 'modules/home/home.dart';
import 'modules/search/gridsearchresult.dart';
import 'modules/search/homesearch.dart';
import 'modules/notification.dart';
import 'modules/onboard.dart';
import 'modules/animationtry.dart';
import 'modules/login/login.dart';
import 'modules/profile.dart';
import 'modules/savedscereen.dart';
import 'modules/search/searchresult.dart';
import 'modules/registar/sighnup.dart';
import 'modules/splash.dart';
import 'modules/story/data.dart';
import 'modules/story/storyhome.dart';
import 'modules/updateprofile.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //DartPluginRegistrant.ensureInitialized();
 // var token = caheHelper.getData(key: 'token');
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await caheHelper.init();
var token = caheHelper.getData(key: 'token');
var splash = caheHelper.getData(key: 'splash');
  Widget? widget;
  if(splash != null){
    widget = SignUp();
  }
  if(token != null){
    widget = HomeLayout() ;
  }else{
    widget = SimpleFlutterAnimation();
  }


  runApp(MyApp(widget));
}
class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  Widget? widget;
  MyApp(this.widget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context)=>walkieCubit()..getPostsData()..getProfileData()..getAllBusinesses()),
          //BlocProvider(create: (BuildContext context)=>videoCubit()),
          BlocProvider(create: (BuildContext context)=>CommentCubit()),
          BlocProvider(create: (BuildContext context)=>AddPostWalkieCubit()),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) => ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, child!),
              //  BouncingScrollWrapper.builder(context, child!),
              maxWidth: 1200,
              minWidth: 350,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(350, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),

                //const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              breakpointsLandscape: [
                const ResponsiveBreakpoint.resize(560, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(812, name: MOBILE),
                const ResponsiveBreakpoint.resize(1024, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1120, name: TABLET),
              ]
          ),
          theme: ThemeData(

            primarySwatch: Colors.orange,
            iconTheme: IconThemeData(
               color: Colors.grey
            ),
            appBarTheme: AppBarTheme(

                backwardsCompatibility:false,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0
                ),

                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor("#214E8A").withOpacity(0.99),
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.light,

                ),
                elevation: 0,
                backgroundColor: HexColor("#214E8A").withOpacity(0.99),
                iconTheme: IconThemeData(
                    color: Colors.white
                )

            ),
            sliderTheme: SliderThemeData(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
              trackHeight: 2,
             trackShape:  CustomTrackShape(),
             // overlayShape: RoundSliderOverlayShape(overlayRadius: 30),

            )
            // primarySwatch: Colors.,
          ),
         //  themeMode: ThemeMode.dark,
         // darkTheme: ThemeData.dark(),
          home: widget,
        ));
  }
}




















//
//
//
// try main 88888888888888888888888888888888888
// import 'package:flutter/material.dart';
// import 'package:walki/trypicker/trypickimage.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   static final String title = 'Pick Image & Video';
//
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     title: title,
//     theme: ThemeData(primarySwatch: Colors.deepOrange),
//     home: HomePage(),
//   );
// }






// //
// import 'package:flutter/material.dart';
// import 'package:walki/tryvideo/home.dart';
//
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.dark,
//       darkTheme: ThemeData.dark(),
//       home: HomePage(),
//     );
//   }
// }