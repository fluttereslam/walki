import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/colors/colors.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double titlepadding = MediaQuery.of(context).size.width*0.25;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
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
                          // Navigator.pop(context);
                        }, icon: Image.asset("assets/images/Vector.png")),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 4.0,left: titlepadding),
                    child: Text("Saved",
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
            ListView.separated(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>ReviewBuilder(),
                separatorBuilder: (context,index)=>SizedBox(height: 12,),
                itemCount: 10)
          ],
        ),
      ),
    );
  }
}


Widget ReviewBuilder(){
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 16.0,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),),
    child:
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 4.0),
              child: CircleAvatar(
                    radius: 17,
                    backgroundImage: AssetImage("assets/images/im1.jpeg"),
                  ),
            ),
            SizedBox(width: 10.0,),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Mahmoud Ali",
                style: TextStyle(
                  fontFamily:"Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#214E8A"),
                ),),
            ),

            Spacer(),
           Padding(
             padding: const EdgeInsets.only(right: 8.0),
             child: IconButton(
               onPressed: (){},
                 icon: Icon(Icons.bookmark_outlined,color: bluecolor,size: 40,)),
           )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 52.0),
          child: Text("you will love this cafe",
            style: TextStyle(
              fontFamily:"Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: bluecolor,
            ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 52.0),
          child: Text("I really like the atmosphere, good coffee, and nice interior. This is a good place to study or chill with friends.",
            style: TextStyle(
              fontFamily:"Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              // color: HexColor("#214E8A"),
            ),),
        ),

      ],
    ),
  ) ;
}