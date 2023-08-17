



// import 'package:flutter/material.dart';
//
// class Curvedanimatin extends StatefulWidget {
//   const Curvedanimatin ({Key? key}) : super(key: key);
//
//   @override
//   State<Curvedanimatin > createState() => _SimpleFlutterAnimationState();
// }
//
// class _SimpleFlutterAnimationState extends State<Curvedanimatin > with SingleTickerProviderStateMixin {
//   late AnimationController animationcontroller;
//   late Animation titleAnimation;
//   late Animation postAnimation;
//   late Animation imageAnimation;
//
//   @override
//   void initState(){
//     super.initState();
//     animationcontroller =  AnimationController(vsync: this, duration: Duration(seconds: 7));
//
//     imageAnimation = Tween(begin: -1.0, end: 0.0).animate(
//         CurvedAnimation(parent: animationcontroller, curve: Curves.fastOutSlowIn
//         )
//     );
//
//     titleAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
//         parent: animationcontroller, curve: Interval(0.5, 1,curve: Curves.easeInOutQuart)));
//
//     postAnimation =Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
//         parent: animationcontroller, curve: Interval(0.8, 1,curve: Curves.fastOutSlowIn)));
//
//     animationcontroller.forward();
//
//
//   }
//   @override
//   void dispose(){
//     super.dispose();
//     animationcontroller.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//
//     return AnimatedBuilder(animation: animationcontroller,
//         builder: (BuildContext context,Widget? child){
//           return Scaffold(
//             appBar: AppBar(
//               title: Text("curved animation"),
//               centerTitle: true,
//               backgroundColor: Colors.cyan,
//             ),
//             body: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Transform(
//
//                       transform: Matrix4.translationValues(
//                           imageAnimation.value * width, 0, 0),
//                       child: Container(
//                         padding: EdgeInsets.only(left: 10),
//                         height: MediaQuery.of(context).size.height * 0.4,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: NetworkImage("https://static8.depositphotos.com/1276278/1069/i/450/depositphotos_10691559-stock-photo-red-sports-car-at-sunset.jpg"),
//                                 fit: BoxFit.cover
//                             )
//                         ),
//                       ),
//                     ),
//                     Transform(
//
//                       transform: Matrix4.translationValues(
//                           titleAnimation.value * width, 0, 0),
//                       child: Container(
//                         padding: EdgeInsets.all(40),
//                         height: MediaQuery.of(context).size.height * 0.4,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.withOpacity(0.5),
//                         ),
//                         child: Center(
//                           child: Text("curved anmation ",
//                             style: TextStyle(fontSize: 40 ,
//                                 color: Colors.white,fontWeight: FontWeight.bold),),
//
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Transform(
//
//                   transform: Matrix4.translationValues(
//                       postAnimation.value * width, 0, 0),
//                   child: Container(
//                     padding: EdgeInsets.all(40),
//                     //height: MediaQuery.of(context).size.height * 0.4,
//                     width: MediaQuery.of(context).size.width,
//
//                     child: Text(" curved anmation   curved anmation   curved anmation   curved anmation   curved anmation  "
//                         " curved anmation   curved anmation  v curved anmation   curved anmation  ",
//                       style: TextStyle(fontSize: 20 ),),
//
//
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//     );
//   }
// }
//8888888888888888888888888888888///

// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// class TransformExample extends StatefulWidget {
//   const TransformExample({Key? key}) : super(key: key);
//
//   @override
//   State<TransformExample> createState() => _TransformExampleState();
// }
//
// class _TransformExampleState extends State<TransformExample>  with SingleTickerProviderStateMixin{
//   late AnimationController animationController ;
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(vsync: this , duration:  const Duration(milliseconds: 1000));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar:  AppBar(
//           title:  Text( "Transform"),
//         ),
//         floatingActionButton:  FloatingActionButton(
//           child:  Icon(
//             Icons.play_arrow ,
//             size: 20,
//           ),
//
//           onPressed: (){
//             if(animationController.isDismissed){
//               animationController.forward();
//               setState((){
//
//               });
//             }else{
//               animationController.reverse();
//               setState((){
//
//               });
//             }
//
//           },
//         ),
//         body:  Center(
//             child:AnimatedBuilder(
//               animation: this.animationController,
//               builder: (context, child) {
//                 return rotate();
//               },
//             )
//         )
//
//     );
//   }
//   Widget rotate(){
//     return
//       Transform.rotate(
//         alignment: Alignment.bottomCenter,
//         angle: (25 / (180 / math.pi)) * animationController.value, // 45 deg
//         child: Container(
//           width: 200,
//           height: 200,
//           color: Colors.red,
//           child: Text("show"),
//         ),
//       );
//   }
//
//   Widget scale(){
//     return Transform.scale(
//       scale: 1.5*animationController.value,
//       child:  Container(
//         width: 200,
//         height: 200,
//         color: Colors.red,
//         child: Text("show"),
//       ),
//     );
//   }
//   Widget translate (){
//     return Transform.translate(offset: Offset(100 *animationController.value ,0.0),
//       child:  Container(
//         width: 100,
//         height: 100,
//         color: Colors.red,
//         child: Text("show"),
//       ),
//     );
//   }
//   Widget transForm(){
//     return Transform(transform: Matrix4.skew(.3 ,.3),child:
//     Container(
//       width: 100,
//       height: 100,
//       color: Colors.red,
//       child: Text("show"),
//     ),
//
//
//     );
//   }
//
//
//
//
//
// }








/////////////////////////333333333333333333333333333333333333///////////////
// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// class Transformtask extends StatefulWidget {
//   const Transformtask({Key? key}) : super(key: key);
//
//   @override
//   State<Transformtask> createState() => _TransformExampleState();
// }
//
// class _TransformExampleState extends State<Transformtask>  with SingleTickerProviderStateMixin{
//   late AnimationController animationController ;
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(vsync: this , duration:  const Duration(milliseconds: 1000));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar:  AppBar(
//           title:  Text( "Transform"),
//         ),
//         floatingActionButton:  FloatingActionButton(
//           child:  Icon(
//             Icons.play_arrow ,
//             size: 20,
//           ),
//
//
//           onPressed: (){
//             if(animationController.isDismissed){
//               animationController.forward();
//               setState((){
//
//               });
//             }else{
//               animationController.reverse();
//               setState((){
//
//               });
//             }
//
//           },
//         ),
//         body:  Center(
//             child:AnimatedBuilder(
//               animation: this.animationController,
//               builder: (context, child) {
//                 return transForm();
//               },
//             )
//         )
//
//     );
//   }
//
//
//   Widget transForm(){
//     return Transform(transform: Matrix4.skew(0.5 ,0.5),child:
//     Container(
//         width: 150,
//         height: 150,
//         color: Colors.red,
//         child: Image.network("https://static8.depositphotos.com/1276278/1069/i/450/depositphotos_"
//             "10691559-stock-photo-red-sports-car-at-sunset.jpg")
//       //"https://previews.123rf.com/images/andersonrise/andersonrise1603/andersonrise160300790/54128225-close-up-por"
//       //"trait-of-a-muslim-young-woman-wearing-a-head-scarf-indoor.jpg?fj=1"),
//       //"http://cardxpress.net/image/cache/1-500x500.jpg"),
//     ),
//
//
//     );
//   }
//
//
//
//
//
// }
//
// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// class TransformExample extends StatefulWidget {
//   const TransformExample({Key? key}) : super(key: key);
//
//   @override
//   State<TransformExample> createState() => _TransformExampleState();
// }
//
// class _TransformExampleState extends State<TransformExample>  with SingleTickerProviderStateMixin{
//   late AnimationController animationController ;
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(vsync: this , duration:  const Duration(milliseconds: 1000));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar:  AppBar(
//           title:  Text( "Transform"),
//         ),
//         floatingActionButton:  FloatingActionButton(
//           child:  Icon(
//             Icons.play_arrow ,
//             size: 20,
//           ),
//
//
//           onPressed: (){
//             if(animationController.isDismissed){
//               animationController.forward();
//               setState((){
//
//               });
//             }else{
//               animationController.reverse();
//               setState((){
//
//               });
//             }
//
//           },
//         ),
//         body:  Center(
//             child:AnimatedBuilder(
//               animation: this.animationController,
//               builder: (context, child) {
//                 return transForm();
//               },
//             )
//         )
//
//     );
//   }
//   Widget rotate(){
//     return
//       Transform.rotate(
//         alignment: Alignment.bottomCenter,
//         angle: (80 / (180 / math.pi)) * animationController.value, // 45 deg
//         child: Container(
//           width: 200,
//           height: 200,
//           color: Colors.red,
//           child: Image.asset("images/im1.jpeg"),
//         ),
//       );
//   }
//
//   Widget scale(){
//     return Transform.scale(
//       scale: 1.5*animationController.value,
//       child:  Container(
//         width: 200,
//         height: 200,
//         color: Colors.red,
//         child: Text("show"),
//       ),
//     );
//   }
//   Widget translate (){
//     return Transform.translate(offset: Offset(150 *animationController.value ,0.0),
//       child:  Container(
//         width: 100,
//         height: 100,
//         color: Colors.red,
//         child: Text("show"),
//       ),
//     );
//   }
//   Widget transForm(){
//     return Transform(transform: Matrix4.skew(0.2 ,0.2),child:
//     Container(
//       width: 100,
//       height: 100,
//       color: Colors.red,
//       child: Image.asset("images/im1.jpeg"),
//     ),
//
//
//     );
//   }
//
//
//
//
//
// }




//
// import 'package:flutter/material.dart';
// import 'package:responsive_framework/responsive_framework.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       builder: (context, child) => ResponsiveWrapper.builder(
//         ClampingScrollWrapper.builder(context, child!),
//         //  BouncingScrollWrapper.builder(context, child!),
//           maxWidth: 1200,
//           minWidth: 450,
//           defaultScale: true,
//           breakpoints: [
//             const ResponsiveBreakpoint.resize(450, name: MOBILE),
//             const ResponsiveBreakpoint.autoScale(800, name: TABLET),
//             const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
//             const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
//             const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
//
//             //const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
//           ],
//           breakpointsLandscape: [
//             const ResponsiveBreakpoint.resize(560, name: MOBILE),
//             const ResponsiveBreakpoint.autoScale(812, name: MOBILE),
//             const ResponsiveBreakpoint.resize(1024, name: TABLET),
//             const ResponsiveBreakpoint.autoScale(1120, name: TABLET),
//           ]
//       )
//
//     );
//   }
// }