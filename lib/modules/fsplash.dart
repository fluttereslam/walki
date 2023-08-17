import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/modules/splash.dart';
import 'package:walki/shared/components/components.dart';
import 'package:walki/shared/network/local/cashe_helper.dart';

class SimpleFlutterAnimation extends StatefulWidget {
  const SimpleFlutterAnimation({Key? key}) : super(key: key);

  @override
  State<SimpleFlutterAnimation> createState() => _SimpleFlutterAnimationState();
}

class _SimpleFlutterAnimationState extends State<SimpleFlutterAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controllerd;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late Animation widthAnimation;
  Color start = HexColor("#214E8A").withOpacity(0.7);//.withAlpha(250);//.withOpacity(0.9);
  Color end = HexColor("#FD5B1F").withOpacity(0.7);

  @override
  void initState() {
    super.initState();

    // Defining controller with animation duration of two seconds
    controller =  AnimationController(vsync: this, duration: Duration(seconds: 9));
    //controllerd =  AnimationController(vsync: this, duration: Duration(seconds: 4));

    // Defining both color and size animations
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    sizeAnimation = Tween<double>(begin: 1000, end: 50.0).animate(controller);
    widthAnimation = Tween<double>(begin: 1200, end: 50.0).animate(controller);

    // Rebuilding the screen when animation goes ahead
    controller.addListener(() {
      setState(() {});
    });

    // Repeat the animation after finish
    //controller.repeat();
    //
    //For single time
    controller.forward();

    //Reverses the animation instead of starting it again and repeats
    //controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: ()async{
             await caheHelper.saveData(key: 'splash', value: true);
              var splash = caheHelper.getData(key: 'splash');
              print(splash);
              navigateAndFinish(context, Splash());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // decoration: BoxDecoration(
              //     image: DecorationImage(image: AssetImage("assets/images/women.png",),fit: BoxFit.fill)
              // ),
              child: Image(image: AssetImage("assets/images/women.png",),fit: BoxFit.fill),
            ),
          ),
          Container(
            //margin: EdgeInsets.all(16),
            margin: widthAnimation.value==50.0? EdgeInsets.only(left: 24,top: 32):EdgeInsets.all(0.0),
            height: sizeAnimation.value,
            width: widthAnimation.value,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  //  // tileMode: TileMode.mirror,
                  //  // transform: Matrix4.translationValues(x, y, z),
                  stops: [

                    0.1,1.0,

                  ],
                  colors: [
                    //Colors.blue,

                    //Colors.orange,
                    start,end,
                  ]
              ),
            ),
            child: Center(
              child:
              Text("li",style: TextStyle(fontFamily:"Poppins",fontSize:32,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
            ),
          ),
        ],
      ),

    );
  }
}