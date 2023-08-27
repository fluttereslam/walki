
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';

import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/components/components.dart';

import '../modules/addstory.dart';




// code 999
// code 999
// code 999
// code 999
// code 999

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
 // const HomeLayout({Key? key}) : super(key: key);
var searchController = TextEditingController();
var commentController = TextEditingController();
final formKey = GlobalKey<FormState>();
Color start = HexColor("#F4511E");
//.withAlpha(250);//.withOpacity(0.9);
Color end = HexColor("#000000");

  @override
  Widget build(BuildContext context){

    var cubit = walkieCubit.get(context);

    return BlocConsumer<walkieCubit,WalkieStates>(
        listener: (context,state){},
        builder: (context,state)=>Scaffold(
          extendBody: true,
         // backgroundColor: Colors.black38,
          // backgroundColor:Colors.white.withOpacity(0.95),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              elevation: 0,
            ),
          ),
          body: cubit.walkieScreens[cubit.currentindex],
          bottomNavigationBar: CurvedNavigationBar(
            //color: Colors.transparent,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: orangetextColor,
              height: 60,
              index: cubit.currentindex,
              onTap: (index){
                if (index != 2){
                  cubit.changeIndex(index);
                }
                if (index == 1){
                walkieCubit.get(context).getReels();
                }
                if (index == 2){
                  navigateAndFinish(context, AddStory());
                }
                if (index == 0){
                  walkieCubit.get(context).getAllBusinesses();
                  walkieCubit.get(context).getPostsData();
                }

              },
              items:
          [
            CurvedNavigationBarItem(
              child: Icon(Icons.home_outlined,color: cubit.currentindex==0?Colors.white:Colors.grey,),
              label: 'Home',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.ondemand_video_sharp,color: cubit.currentindex==1?Colors.white:Colors.grey),
              label: 'reals',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.add_box_outlined,color:Colors.grey),
              label: 'add',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.groups,color: cubit.currentindex==3?Colors.white:Colors.grey),
              label: 'community',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.more_horiz,color: cubit.currentindex==4?Colors.white:Colors.grey),
              label: 'more',
            ),
          ]

          ),
          // floatingActionButton: IconButton(onPressed: ()
          // async {
          // String url = "https://goo.gl/maps/ZviaJzkidbMvZVMZA?coh=178572&entry=tt";
          // var urllaunchable = await canLaunch(url); //canLaunch is from url_launcher package
          // if(urllaunchable){
          // await launch(url); //launch is from url_launcher package to launch URL
          // }else{
          // print("URL can't be launched.");
          // }
          // },
          // //  navigateTo(context, webView("https://maps.app.goo.gl/FQr17Rb8sUgMFZX89"));},
          //     icon: Icon(Icons.archive) ),
          // bottomNavigationBar: CurvedNavigationBar(
          //
          //     backgroundColor: Colors.transparent,
          //   //  color: Colors.white,
          //     buttonBackgroundColor: orangetextColor,
          //
          //     items: <Widget>[
          //       Container(
          //         height: 50,
          //         child: Column(
          //           children: [Icon(Icons.home_outlined, size: 30), Text("")],
          //         ),
          //       ),
          //       Icon(Icons.ondemand_video_outlined),
          //      Icon(Icons.add_box_outlined),
          //      Icon(Icons.groups),
          //      Icon(Icons.person_pin),
          //
          //     ]),

        ),
        );
  }
}
