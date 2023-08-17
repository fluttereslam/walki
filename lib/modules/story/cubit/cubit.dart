// import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:video_player/video_player.dart';
// import 'package:walki/modules/story/cubit/states.dart';
//
// import '../storymodel.dart';
//
// class storyCubit extends Cubit<storyStates> {
//
//   storyCubit() : super(storyInitialState());
//
//   static storyCubit get(context) => BlocProvider.of(context);
//
//   late PageController pageController;
//   late AnimationController animController;
//   late VideoPlayerController videoController;
//   int currentIndex = 0;
//
//   void storyInitState({required stories,This}){
//
//     pageController = PageController();
//     animController = AnimationController(vsync: This);
//     emit(changeStoryAnimateControllerstate());
//     final Story firstStory = stories.first;
//     loadStory(story: firstStory, animateToPage: false);
//
//     animController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         animController.stop();
//         animController.reset();
//         emit(changeStoryAnimateControllerstate());
//           if (currentIndex + 1 < stories.length) {
//             currentIndex += 1;
//             loadStory(story: stories[currentIndex]);
//             emit(changeStoryIndexstate());
//           } else {
//             // Out of bounds - loop story
//             // You can also Navigator.of(context).pop() here
//             currentIndex = 0;
//             loadStory(story: stories[currentIndex]);
//             emit(changeStoryIndexstate());
//           }
//
//       }
//     });
//   }
//
//   void closepage(){
//     pageController.dispose();
//     animController.dispose();
//     videoController.dispose();  }
//
//
//   void loadStory({required Story story, bool animateToPage = true}) {
//     animController.stop();
//     animController.reset();
//     emit(changeStoryAnimateControllerstate());
//     switch (story.media) {
//       case MediaType.image:
//         animController.duration = story.duration;
//         animController.forward();
//         emit(changeStoryAnimateControllerstate());
//         break;
//       case MediaType.video:
//       // _videoController = null;
//       // _videoController?.dispose();
//         videoController = VideoPlayerController.network(story.url)
//           ..initialize().then((_) {
//             emit(initializeStoryVideostate());
//             if (videoController.value.isInitialized) {
//               animController.duration = videoController.value.duration;
//               videoController.play();
//               animController.forward();
//               emit(changeStoryAnimateControllerstate());
//
//             }
//           });
//         break;
//     }
//     if (animateToPage) {
//       pageController.animateToPage(
//         currentIndex,
//         duration: const Duration(milliseconds: 1),
//         curve: Curves.easeInOut,
//       );
//       emit(changeStoryPagetate());
//     }
//   }
//
//
//   void onTapDown(TapDownDetails details, Story story,context,stories) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double dx = details.globalPosition.dx;
//     if (dx < screenWidth / 3) {
//
//         if (currentIndex - 1 >= 0) {
//           currentIndex -= 1;
//           loadStory(story: stories[currentIndex]);
//           emit(changeStoryIndexstate());
//         }
//
//     } else if (dx > 2 * screenWidth / 3) {
//           emit(changeStoryIndexstate());
//         if (currentIndex + 1 < stories.length) {
//           currentIndex += 1;
//           loadStory(story: stories[currentIndex]);
//           emit(changeStoryIndexstate());
//         } else {
//           // Out of bounds - loop story
//           // You can also Navigator.of(context).pop() here
//           currentIndex = 0;
//           loadStory(story: stories[currentIndex]);
//           emit(changeStoryIndexstate());
//         }
//
//     } else {
//       if (story.media == MediaType.video) {
//         if (videoController.value.isPlaying) {
//           videoController.pause();
//           animController.stop();
//           emit(changeStoryAnimateControllerstate());
//         } else {
//           videoController.play();
//           animController.forward();
//           emit(changeStoryAnimateControllerstate());
//
//         }
//       }
//     }
//   }
//
//
//
//
//
//
//
//
// }