
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:walki/shared/colors/colors.dart';



class PostVideo extends StatefulWidget {

  final String? src;
  final bool? IsPost;
  const PostVideo(this.IsPost,{Key? key,this.src}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<PostVideo> {

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
                height:double.infinity,
                width: double.infinity,
                child:  controller.value.isInitialized
                    ? VideoPlayer(controller)
                    : Center(
                    child:
                    CircularProgressIndicator(),
                  ),


              ),

             (widget.IsPost!)
                 ? Positioned(
                left: 24,
                bottom: 10,
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
              )
                 : Center(child: InkWell(
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
                 child: Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.orange,)),),


            ],
          )),


    );

  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller.removeListener((){});
  }


}























