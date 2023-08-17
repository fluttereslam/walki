
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:walki/shared/colors/colors.dart';


/// Stateful widget to fetch and then display video content.
// Duration  Possisionn = Duration.zero;
// Duration  duration = Duration.zero;
class VideoApp extends StatefulWidget {

 final String? src;
  const VideoApp({Key? key,this.src}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {

  late  VideoPlayerController controller;
  Duration  Possisionn = Duration.zero;
  Duration  duration = Duration.zero;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    controller = VideoPlayerController.network(widget.src!);
    await Future.wait([controller.initialize()]);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0,
          ),
        ),
        body: Container(
          child:Stack(
    alignment: Alignment.center,
    children: [
    Container(
    height:MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child:  controller.value.isInitialized
         ? VideoPlayer(controller)
         : Container(
    child: Center(
    child:
    CircularProgressIndicator(),
    ),
    ),

    ),

      Positioned(
        left: 24,
        bottom: 70,
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 32),
          width: 270,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: (){
                    controller.value.isPlaying
                        ? {
                      setState(() {
                        controller.pause();
                        if(Possisionn == duration){
                          controller.removeListener(() {});

                        }
                      })
                    }
                        : {

                      setState(() {
                        controller.play();
                        controller.addListener(() async {
                          final newPosition = await controller.value.position;
                          final newduration= await controller.value.duration;
                          duration = newduration;
                          Possisionn = newPosition;
                          setState(() {

                          });


                          // ;
                        });
                      })

                    };
                  },
                  child: Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.orange,)),
              Expanded(
                child: Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: Possisionn.inSeconds.toDouble(),
                    activeColor: Colors.white,
                    inactiveColor: Colors.white,
                    thumbColor: Colors.orange,
                    onChanged: (value)async{
                      final position = Duration(seconds: value.toInt());
                      await controller.seekTo(position);
                    }),
              ),

            ],
          ),
        ),
      ),
      Positioned(
        bottom: 70,
        right:5 ,
        child: IconButton(
            onPressed: (){
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder( // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return  Container(
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight: Radius.circular(20))
                             ),
                             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                             child: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                     Container(width: 60,height: 3,
                                     decoration: BoxDecoration(
                                         color: orangetextColor,
                                       borderRadius: BorderRadius.circular(5)
                                     ),)
                                   ],),
                                   SizedBox(height: 20,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Column(
                                         children: [
                                           Container(
                                             width:60,
                                             height: 60,
                                             decoration: BoxDecoration(
                                                 color: Colors.white,
                                                 boxShadow: [
                                                   BoxShadow(
                                                     color: orangetextColor,
                                                     blurRadius: 0.1,
                                                     offset: Offset(0.0, 0.2),
                                                   ),
                                                 ],
                                                 borderRadius: BorderRadius.circular(30)
                                             ),
                                             child:     IconButton(
                                               onPressed: (){},
                                               icon: Icon(Icons.share_outlined,color: orangetextColor,),),



                                           ),
                                           Text("Share"
                                           ,style: TextStyle(
                                                 fontFamily:"Poppins",
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w400,
                                                 color: orangetextColor),),
                                         ],
                                       ),
                                       Column(
                                         children: [
                                           Container(
                                             width:60,
                                             height: 60,
                                             decoration: BoxDecoration(
                                                 color: Colors.white,
                                                 boxShadow: [
                                                   BoxShadow(
                                                     color: orangetextColor,
                                                     blurRadius: 0.1,
                                                     offset: Offset(0.0, 0.2),
                                                   ),
                                                 ],
                                                 borderRadius: BorderRadius.circular(30)
                                             ),
                                             child:     MaterialButton(onPressed: () {
                                               Navigator.pop(context);
                                             },
                                               child: Image.asset("assets/images/copylink.png"),
                                             ),



                                           ),
                                           Text("Copy Link"
                                           ,style: TextStyle(
                                                 fontFamily:"Poppins",
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w400,
                                                 color: orangetextColor),),
                                         ],
                                       ),
                                       Column(
                                         children: [
                                           Container(
                                             width:60,
                                             height: 60,
                                             decoration: BoxDecoration(
                                                 color: Colors.white,
                                                 boxShadow: [
                                                   BoxShadow(
                                                     color: orangetextColor,
                                                     blurRadius: 0.1,
                                                     offset: Offset(0.0, 0.2),
                                                   ),
                                                 ],
                                                 borderRadius: BorderRadius.circular(30)
                                             ),
                                             child:     MaterialButton(onPressed: () {
                                               Navigator.pop(context);
                                             },
                                               child: Image.asset("assets/images/duet.png"),
                                             ),


                                           ),
                                           Text("Duet"
                                             ,style: TextStyle(
                                                 fontFamily:"Poppins",
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w400,
                                                 color: orangetextColor),),
                                         ],
                                       ),
                                       Column(
                                         children: [
                                           Container(
                                             width:60,
                                             height: 60,
                                             decoration: BoxDecoration(
                                                 color: Colors.white,
                                                 boxShadow: [
                                                   BoxShadow(
                                                     color: orangetextColor,
                                                     blurRadius: 0.1,
                                                     offset: Offset(0.0, 0.2),
                                                   ),
                                                 ],
                                                 borderRadius: BorderRadius.circular(30)
                                             ),
                                             child:     MaterialButton(onPressed: () {
                                               Navigator.pop(context);
                                             },
                                               child: Image.asset("assets/images/report.png"),
                                             ),



                                           ),
                                           Text("Report"
                                             ,style: TextStyle(
                                                 fontFamily:"Poppins",
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w400,
                                                 color: orangetextColor),),
                                         ],
                                       ),


                                     ],),
                                   SizedBox(height: 20,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Container(width: MediaQuery.of(context).size.width*0.7,height: 1,
                                         decoration: BoxDecoration(
                                             color: orangetextColor,
                                             borderRadius: BorderRadius.circular(5)
                                         ),)
                                     ],),
                                   SizedBox(height: 20,),
                                   InkWell(
                                     onTap: (){},
                                     child: Card(
                                       elevation: 10,
                                       margin: EdgeInsets.symmetric(horizontal: 0,vertical: 2),
                                       shape: RoundedRectangleBorder(

                                         borderRadius: BorderRadius.circular(15),),
                                       child: Row(
                                         children: [

                                           Container(
                                             margin:EdgeInsets.all(8.0) ,
                                             child: Image.asset("assets/images/repost.png"),
                                           ),
                                           Text("Repost"
                                             ,style: TextStyle(
                                                 fontFamily:"Poppins",
                                                 fontSize: 14,
                                                 fontWeight: FontWeight.w400,
                                                 ),),
                                         ],
                                       ),
                                     ),
                                   ),
                                   InkWell(
                                     onTap: (){},
                                     child: Card(
                                       elevation: 10,
                                       margin: EdgeInsets.symmetric(horizontal: 0,vertical: 2),
                                       shape: RoundedRectangleBorder(

                                         borderRadius: BorderRadius.circular(15),),
                                       child: Row(
                                         children: [

                                           Container(
                                             margin:EdgeInsets.all(8.0) ,
                                             child: Image.asset("assets/images/clearmood.png"),
                                           ),
                                           Text("Clear Mood"
                                             ,style: TextStyle(
                                                 fontFamily:"Poppins",
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w400,
                                                 ),),
                                         ],
                                       ),
                                     ),
                                   ),
                                   InkWell(
                                     onTap: (){},
                                     child: Card(
                                       elevation: 10,
                                       margin: EdgeInsets.symmetric(horizontal: 0,vertical: 2),
                                       shape: RoundedRectangleBorder(

                                         borderRadius: BorderRadius.circular(15),),
                                       child: Row(
                                         children: [
                                           Container(
                                             margin:EdgeInsets.all(8.0) ,
                                             child: Image.asset("assets/images/notintrrested.png"),
                                           ),
                                           Text("Not Interrsted"
                                             ,style: TextStyle(
                                                 fontFamily:"Poppins",
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w400,
                                                 ),),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ],
                               ),

                           );
                  });



            },
            icon: Icon(Icons.more_horiz,color: whitetextColor,)),
      ),

    ],
    )),




          // ListView.separated(
          //     itemBuilder: (context,index){
          //       return Stack(
          //         alignment: Alignment.center,
          //         children: [
          //           Container(
          //             height:MediaQuery.of(context).size.height,
          //             width: MediaQuery.of(context).size.width,
          //             child:  videoCubit.get(context).controller.value.isInitialized
          //                ?
          //           VideoPlayer(videoCubit.get(context).controller)
          //                 : Container(
          //               child: Center(
          //                 child:
          //                 CircularProgressIndicator(),
          //               ),
          //             ),
          //
          //           ),
          //           Positioned(
          //             bottom: 20,
          //             child: Container(
          //               //padding: EdgeInsets.symmetric(horizontal: 32),
          //               width: 250,
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   InkWell(
          //                       onTap: (){
          //                         videoCubit.get(context).playapause();
          //                       },
          //                       child: Icon(videoCubit.get(context).controller.value.isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.orange,)),
          //                   Expanded(
          //                     child: Slider(
          //                         min: 0,
          //                         max: videoCubit.get(context).duration.inSeconds.toDouble(),
          //                         value: videoCubit.get(context).Possisionn.inSeconds.toDouble(),
          //                         activeColor: Colors.white,
          //                         inactiveColor: Colors.white,
          //                         thumbColor: Colors.orange,
          //                         onChanged: (value)async{
          //                           final position = Duration(seconds: value.toInt());
          //                           await videoCubit.get(context).controller.seekTo(position);
          //                         }),
          //                   ),
          //
          //                 ],
          //               ),
          //             ),
          //           ),
          //           IconButton(onPressed: (){
          //             print("${videoCubit.get(context).videos[videoCubit.get(context).index]}");
          //           },
          //               icon: Icon(Icons.add_a_photo))
          //         ],
          //       );
          //     },
          //     separatorBuilder: (context,index)=>SizedBox(height: 20,),
          //     itemCount: 3)
       // ),


      );

  }

  @override
  void dispose() {
    super.dispose();
   controller.dispose();
    controller.removeListener((){});
  }


}























// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:walki/shared/colors/colors.dart';
// Duration  Possisionn = Duration.zero;
// Duration  duration = Duration.zero;
// class VideoApp extends StatefulWidget {
//   const VideoApp({Key? key}) : super(key: key);
//
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }
//
// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;
//  // var vidio =VideoPlayer(_controller.position)
//   //https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(
//         'assets/images/deleted.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//       });
//
//
//     // _controller.position;
//     // setState(() {
//     //   _controller.position = Possisionn;
//     // });
//     //
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//
//           child:Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 height: 350,
//                 width: 350,
//                 child:    _controller.value.isInitialized
//                     ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//                     : Container(
//                  child: Center(
//                    child: Text("loading",style: TextStyle(color: Colors.cyan),
//                 ),
//                  ),
//               ),
//
//               ),
//               Positioned(
//                 bottom: 20,
//                 child: Container(
//                   //padding: EdgeInsets.symmetric(horizontal: 32),
//                   width: 250,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       InkWell(
//                           onTap:(){
//                             if(_controller.value.isPlaying){
//                               setState(() {
//                                  _controller.pause();
//                                 if(duration==Possisionn){
//                                   _controller.removeListener(() { }) ;
//                                 }
//
//                               });
//                             }else{
//
//                               setState(() {
//                                 _controller.play();
//                                 _controller.addListener(() { updateSeeker();});
//                               });
//
//
//                             }
//
//                             // setState(() {
//                             //   _controller.value.isPlaying
//                             //       ? _controller.pause()
//                             //       : _controller.play();
//                             //   _controller.addListener(() { updateSeeker();});
//                             //   if(duration==Possisionn){
//                             //       _controller.removeListener(() { }) ;
//                             //   }
//
//                             // });
//                           },
//                           child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.orange,)),
//                       Expanded(
//                         child: Slider(
//                             min: 0,
//                               max: duration.inSeconds.toDouble(),
//                               value: Possisionn.inSeconds.toDouble(),
//                               activeColor: Colors.white,
//                               inactiveColor: Colors.white,
//                               thumbColor: Colors.orange,
//                               onChanged: (value)async{
//                                 final position = Duration(seconds: value.toInt());
//                                 await _controller.seekTo(position);
//                               }),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//
//         // floatingActionButton: FloatingActionButton(
//         //   onPressed: () {
//         //     setState(() {
//         //       _controller.value.isPlaying
//         //           ? _controller.pause()
//         //           : _controller.play();
//         //     });
//         //   },
//         //   child: Icon(
//         //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         //   ),
//         // ),
//
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//     _controller.removeListener(updateSeeker);
//   }
//
//   Future<void> updateSeeker() async {
//     final newPosition = await _controller.position;
//     final newduration= await _controller.value.duration;
//
//     setState(() {
//       duration = newduration;
//       Possisionn = newPosition!;
//     });
//   }
// }
//
// class CustomTrackShape extends RoundedRectSliderTrackShape {
//   Rect getPreferredRect({
//     required RenderBox parentBox,
//     Offset offset = Offset.zero,
//     required SliderThemeData sliderTheme,
//     bool isEnabled = false,
//     bool isDiscrete = false,
//   }) {
//     final double? trackHeight = sliderTheme.trackHeight;
//     final double trackLeft = offset.dx;
//     final double trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
//     final double trackWidth = parentBox.size.width;
//     return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
//   }
// }