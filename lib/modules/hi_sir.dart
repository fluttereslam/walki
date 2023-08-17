import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:walki/shared/components/components.dart';

import '../shared/colors/colors.dart';
import 'checkinterrests.dart';

class HiSir extends StatelessWidget {
  //const HiSir({Key? key}) : super(key: key);
  Color start = HexColor("#214E8A").withOpacity(0.9);//.withAlpha(250);//.withOpacity(0.9);
  Color startg = HexColor("#C8C8C8").withOpacity(0.99);//.withAlpha(250);//.withOpacity(0.9);
  Color end = HexColor("#FD5B1F").withOpacity(0.75);
  Color endg = HexColor("#000000").withOpacity(0.95);
  @override
  Widget build(BuildContext context) {
    // var center = MediaQuery.of(context).size.width
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(

          elevation: 0,

        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/women.png",),fit: BoxFit.fill)
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                  Row(
                    children: [
                      MaterialButton(onPressed: () {
                        Navigator.pop(context);
                      },
                        child: Image.asset("assets/images/Vector.png"),
                      ),
                      Spacer(),
                    ],
                  ),

                  //: Image.asset("assets/images/facee.png"
              SizedBox(height: 310,),
              Container(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Hi, Sir",style: TextStyle(fontFamily:"Poppins",fontSize: 40,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
                   Text("Do You Have Any Problem Like This?",
                      style: TextStyle(
                        fontSize: 10,color: whitetextColor,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                        fontFamily:"Poppins",
                      ),
                     ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(left: 30.0),
                      width: 260,
                      height: 58,
                      child: Text("Deaf, Visually Impaired, Color Blind ,Muscular Disabilities Or Not Reading",
                        style: TextStyle(
                          fontSize: 10,color: whitetextColor,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                          fontFamily:"Poppins",
                        ),
                        maxLines: 3,),
                    ),
                    //SizedBox(height: 30.0),


                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [

                  Expanded(
                    child: ClipPath(
                      clipper: CustomClipPath(),
                      child: Container(
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                //  // tileMode: TileMode.mirror,
                                //  // transform: Matrix4.translationValues(x, y, z),
                                stops: [

                                  0.2,1.0,

                                ],
                                colors: [
                                  //Colors.blue,

                                  //Colors.orange,
                                  start,end,


                                ]
                            )
                        ),
                        child:Padding(
                          padding: const EdgeInsets.only(top: 60,left: 0,right: 90),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  showModalBottomSheet(context: context,
                                      builder: (context)=>Container(
                                        padding: EdgeInsets.all(36),
                                        height: 150,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Text("Can we Ask you some Questions ??",
                                                style:TextStyle(
                                              fontSize: 14,color: bluecolor,
                                              fontWeight: FontWeight.w600,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily:"Poppins",
                                            )),
                                            Spacer(),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                TextButton(
                                                    onPressed: () async {
                                                      String url = "https://forms.gle/QG4RdbhQi4nsShYv5";
                                                      var urllaunchable = await canLaunch(url); //canLaunch is from url_launcher package
                                                      if(urllaunchable){
                                                        await launch(url); //launch is from url_launcher package to launch URL
                                                      }else{
                                                        print("URL can't be launched.");
                                                      }
                                                    },
                                                    child: Text("Yes")),
                                                TextButton(
                                                    onPressed: (){
                                                      navigateAndFinish(context,CheckInterrests());
                                                    },
                                                    child: Text("No")),
                                                TextButton(
                                                    onPressed: (){
                                                      navigateAndFinish(context,CheckInterrests());
                                                    },
                                                    child: Text("Skip",style: TextStyle(color: bluecolor,fontSize: 16,fontWeight: FontWeight.w500),)),
                                              ],),
                                          //  SizedBox(height: 6,)
                                          ],
                                        ),
                                      )

                                  );
                                 // ;
                                },
                                child: Text(
                                  "Skip",
                                  style:
                                  TextStyle(
                                      fontFamily:"Poppins",
                                      fontSize: 10,fontWeight: FontWeight.w400,
                                      color: HexColor("#FFFFFF")),),
                              ),
                              Container(width: 30,
                                child: Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  color: HexColor("#F3B13E"),

                                ),
                              )
                            ],
                          ),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                    child: ClipPath(
                      clipper: CustomClipPath2(),
                      child: Container(
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                //  // tileMode: TileMode.mirror,
                                //  // transform: Matrix4.translationValues(x, y, z),
                                stops: [

                                  0.2,1.0,

                                ],
                                colors: [
                                  //Colors.blue,

                                  //Colors.orange,
                                  start,end,


                                ]
                            )



                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(top: 60,left: 80),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  // navigateTo(context,CheckInterrests());
                                },
                                child: Text(
                                  "Yes",
                                  style:
                                  TextStyle(
                                      fontFamily:"Poppins",
                                      fontSize: 12,fontWeight: FontWeight.w400,
                                      color: HexColor("#FFFFFF")),),
                              ),
                              Container(width: 30,
                                child: Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  color: HexColor("#F3B13E"),

                                ),
                              ),
TextButton(onPressed: (){}, child:Container())
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],),










            ],
          ),
        ),


      ),
    );
  }
}