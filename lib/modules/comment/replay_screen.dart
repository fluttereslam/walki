import 'package:flutter/material.dart';

import '../../shared/colors/colors.dart';

var replayController =TextEditingController();

class RepalyScreen extends StatelessWidget {
 String? name;

 RepalyScreen({Key? key,required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0,
          ),
        ),
        body: Column(
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
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text("Comments",
                      style:  TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: bluecolor),),
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(thickness: 1,color: bluecolor,),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(

                    margin: EdgeInsets.symmetric(horizontal: 16.0,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage("assets/images/ismailia.png"),
                              ),
                              SizedBox(width: 9.56,),
                              Text("${this.name} ",
                                style: TextStyle(
                                  fontFamily:"Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: bluecolor,
                                ),),
                              Text("Ali",
                                style: TextStyle(
                                  fontFamily:"Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: bluecolor,
                                ),),
                              Spacer(),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 62,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: orangetextColor,
                                        borderRadius: BorderRadius.circular(30)
                                    ),


                                  ),
                                  Container(
                                    width: 60,
                                    height: 23,
                                    decoration: BoxDecoration(
                                        color:  Colors.white,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Center(
                                      child:
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text("Follow",
                                          style:  TextStyle(
                                              fontFamily:"Poppins",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: bluecolor),),
                                      ),
                                    ),

                                  ),



                                ],
                              ),


                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child:
                                    Text("dataggyuiemjdhdgf3457290972801```ignldk njjjkkkkkkkkkkkkkkkkkkkvbnhhoe are gopkl;,'muik")),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right: 2.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [


                                      Icon(Icons.favorite_border,color: bluecolor,),

                                      Text("2",style: TextStyle(
                                        fontFamily:"Poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: bluecolor,
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 64),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 2.0),
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundImage: AssetImage("assets/images/ismailia.png"),
                                ),
                              ),
                              SizedBox(width: 9.56,),
                              Text("Mahmoud Ali",
                                style: TextStyle(
                                  fontFamily:"Poppins",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: bluecolor,
                                ),),
                            ],
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: TextFormField(
                                maxLines: 2,
                                style: TextStyle(
                                  fontFamily:"Poppins",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                                cursorColor: Colors.grey,
                                controller: replayController,
                                decoration: InputDecoration(
                                  suffixIcon:IconButton(
                                      onPressed: (){},
                                      icon: Text("Post",style: TextStyle(
                                          fontFamily:"Poppins",
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: bluecolor


                                      ),)
                                  ),
                                  hintText: "Write a replay...",
                                  hintStyle: TextStyle(
                                    fontFamily:"Poppins",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,


                                  ),
                                  border: InputBorder.none,

                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )


                ],
              ),
            )
          ],
        ),
      );
  }
}


