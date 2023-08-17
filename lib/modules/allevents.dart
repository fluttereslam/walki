import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/colors/colors.dart';

class AllEvents extends StatelessWidget {
  const AllEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double titlepadding = MediaQuery.of(context).size.width*0.16;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0,
          ),
        ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Card(
              elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(29),topLeft: Radius.circular(29)),),
              margin: EdgeInsets.all(13.0),
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0,top: 8.0),
                        child: IconButton(
                            onPressed: (){
                               Navigator.pop(context);
                            }, icon: Image.asset("assets/images/Vector.png")),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 4.0,left: titlepadding),
                        child: Text("Events",
                          style:  TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 13,),
                EventItemm(),
              ],
            )),
            SizedBox(height: 10.0,),
            Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(29),topLeft: Radius.circular(29)),),
              margin: EdgeInsets.all(13.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 13.0,right: 13.0,top: 13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Upcoming Trip",
                      style:  TextStyle(
                        fontFamily:"Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),),
                    SizedBox(height: 27,),
                    Container(
                      height: 300,
                      child: ListView.separated(
                        shrinkWrap: true,
                          itemBuilder: (context,index)=>UppCommingEventItem(),
                          separatorBuilder: (context,index)=>SizedBox(height: 16.0,),
                          itemCount: 10),
                    )
                  ],
                ),
              ),
            )





          ],
        ),
      ),



    );
  }
}


Widget EventItemm()=>  Container(
margin: EdgeInsets.all(10),
 // padding: EdgeInsets.only(bottom: 5),
  height: 270,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(37),
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        //  // tileMode: TileMode.mirror,
        //  // transform: Matrix4.translationValues(x, y, z),
        stops: [
          0.0,
          1.0,
        ],
        colors: [
          startAvatar.withOpacity(0.9),
          endAvatar.withOpacity(0.9),
        ]
    ),
    //shape: BoxShape.circle,

  ),
  child: Column(
    children: [
      Expanded(
       flex: 2,
        child: Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(37),
              image: DecorationImage(image: AssetImage("assets/images/ismailia.png"),fit: BoxFit.fill)


          ),
        ),
      ),
      Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                     Text("Cairo Tower ",
                        style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                        overflow: TextOverflow.ellipsis,maxLines: 1,),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Sat jan at 8pm ",
                            style: TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: orangetextColor
                            ),),
                        ],
                      ),
                    ),
                  ],
                ),
                Text("Elzamalek,Cairo ",
                  style: TextStyle(
                      fontFamily:"Poppins",
                      fontSize: 8.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,maxLines: 1,),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                          ),
                          CircleAvatar(
                            radius: 14,
                            backgroundImage: AssetImage("assets/images/im1.jpeg"),
                          ),
                          Positioned(
                            left: 18,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage("assets/images/logo.png"),
                            ),
                          ),
                          Positioned(
                            left: 36,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage("assets/images/im1.jpeg"),
                            ),
                          ),
                          Positioned(
                            left: 54,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage("assets/images/ismailia.png"),
                            ),
                          ),
                          Positioned(
                            left: 72,
                            child: CircleAvatar(
                              radius: 14,
                          backgroundColor: orangetextColor,
                              child: Center(
                                child: Text("80+",style:TextStyle(
                                    fontFamily:"Poppins",
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text("Will Go",
                        style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),
                    ),
                    Spacer(),
                   Container(
                     height: 50,
                     width: 100,
                     decoration: BoxDecoration(
                         color: orangetextColor,
                       borderRadius: BorderRadius.only(bottomRight: Radius.circular(37),topLeft: Radius.circular(20) )
                     ),
                     child: Center(
                       child: Text("BooK Now",
                         style: TextStyle(
                             fontFamily:"Poppins",
                             fontSize: 14.0,
                             fontWeight: FontWeight.w600,
                             color: Colors.white
                         ),),
                     ),
                   )
                  ],
                )

              ],
            ),

          ))
    ],),);

Widget UppCommingEventItem()=>Container(
  width: double.infinity,
  height: 100,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        //  // tileMode: TileMode.mirror,
        //  // transform: Matrix4.translationValues(x, y, z),
        stops: [
          0.0,
          1.0,
        ],
        colors: [
          startAvatar.withOpacity(0.9),
          endAvatar.withOpacity(0.9),
        ]
    ),
    //shape: BoxShape.circle,

  ),
  child: Row(
    children: [
      Expanded(
        flex : 1,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage("assets/images/ismailia.png"),fit: BoxFit.fill)
          ),
        ),
      ),
      Expanded(
        flex : 2,
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.only(top: 17.0,left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Cairo Tower ",
                    style: TextStyle(
                        fontFamily:"Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                    overflow: TextOverflow.ellipsis,maxLines: 1,),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Sat jan at 8pm ",
                          style: TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          ),),
                      ],
                    ),
                  ),
                ],
              ),
              Text("Elzamalek,Cairo ",
                style: TextStyle(
                    fontFamily:"Poppins",
                    fontSize: 8.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),
                overflow: TextOverflow.ellipsis,maxLines: 1,),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Spacer(),
                  Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        color: orangetextColor,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topLeft: Radius.circular(10) )
                    ),
                    child: Center(
                      child: Text("BooK Now",
                        style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 8.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        ),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    ],
  ),
);


