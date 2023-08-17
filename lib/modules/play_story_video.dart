
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:walki/shared/colors/colors.dart';



class StoryVideo extends StatefulWidget {

  final String? src;

  const StoryVideo({Key? key,this.src}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<StoryVideo> {

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
      body: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          height:double.infinity,
          width: double.infinity,
          child:  controller.value.isInitialized
              ? VideoPlayer(controller)
              : Center(
            child:
            CircularProgressIndicator(),
          ),


        ),
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









