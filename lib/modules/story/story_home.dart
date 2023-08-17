
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:walki/shared/colors/colors.dart';



class StoryHome extends StatefulWidget {

  final String? src;

  const StoryHome({Key? key,this.src}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<StoryHome> {

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


                Center(child: InkWell(
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
              ),


            ],
          )
      ),


    );

  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller.removeListener((){});
  }


}
