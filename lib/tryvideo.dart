

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walki/shared/colors/colors.dart';


///code
///dddddd
///codem  try coding
///codem  try coding
//coding
//vbn
//vbn2
///code2
///code3
//code 4
//code5
//code6
//code7
//code8


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Custom TabBar',
      theme: ThemeData(
        primarySwatch: Colors.orange,

      ),
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}





class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {

   TabController? tabController;

@override
  void initState() {
  tabController!=TabController(vsync:this,length:4);
    super.initState();
  }


  // List<String> tabs = [
  //   "Popular",
  //   "Most Visited",
  //   "Recent",
  //   "Explore",
  // ];
  // int current = 0;
  //
  // double changePositionedOfLine(size) {
  //   switch (current) {
  //     case 0:
  //       return 0;
  //     case 1:
  //       return size.width*0.25 ;
  //     case 2:
  //       return size.width*0.52;
  //     case 3:
  //       return size.width*0.78;
  //     default:
  //       return 0;
  //   }
  // }
  //
  // double changeContainerWidth() {
  //   switch (current) {
  //     case 0:
  //       return 50;
  //     case 1:
  //       return 50;
  //     case 2:
  //       return 50;
  //     case 3:
  //       return 40;
  //     default:
  //       return 0;
  //   }
  // }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BeautyBar",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.save_alt_sharp),
          ),
        ],
      ),
      body:  Column(
        children: [
          Container(
          height: 28,
          width: double.infinity,
          //padding: EdgeInsets.all(4.0),
          child: TabBar(
            controller: tabController,
            indicatorColor: orangetextColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor:orangetextColor,
            unselectedLabelColor:  bluecolor,
            indicatorWeight: 2,
            labelStyle: TextStyle(
              fontFamily:"Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),

            tabs: [
              Tab(
                text: "Posts",
              ),
              Tab(
                text: "Photos",
              ),
              Tab(
                text: "Vidios",
              ),
              Tab(
                text: "Reviews",
              ),

            ],

          ),
        ),
                          SizedBox(height: 8,),
                          Container(
                            height: 300,
                            child:
                            TabBarView(
                              controller: tabController,
            physics: BouncingScrollPhysics(),
            children: [
              tapPostItem(),
              tapPostItem(),
              tapPostItem(),
              tapPostItem(),

            ],

          ),
                          ),






                        ],
                      ),



    );

  }
}

Widget tapPostItem()=>ListView.builder(

 shrinkWrap: true,

  physics: NeverScrollableScrollPhysics(),

  itemBuilder: (context,state)=>Column(

    children: [

      Text("Posts"),

      Container(

        height: 70,

        color: Colors.blue,

      ),
    ],

  ),

  itemCount: 20,

);