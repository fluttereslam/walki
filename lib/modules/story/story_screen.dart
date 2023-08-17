import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/modules/lovesscreen.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/components/components.dart';

class storyScreen extends StatefulWidget {
  final int index;
  const storyScreen(this.index,{Key? key}) : super(key: key);

  @override
  State<storyScreen> createState() => _storyScreenState();
}

class _storyScreenState extends State<storyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<walkieCubit,WalkieStates>(
      listener: (context,state){},
      builder: (context,state)=>
          Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: AppBar(
                elevation: 0,
              ),
            ),
            body: storyImageOrVideoOrEmpty(walkieCubit.get(context).getPostModel, widget.index,context),
            bottomSheet: Container(
              height: 60,
              width: double.infinity,
              // color: Colors.orange,
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: InkWell(
                        onTap: (){
                           walkieCubit.get(context).changeFavorites(walkieCubit.get(context).getPostModel!.posts![widget.index].id);
                          print("CHANGED");
                        },
                        onDoubleTap: (){
                          navigateTo(context, FavoriteScreen(walkieCubit.get(context).getPostModel!.posts![widget.index].likes));
                        },

                        child: Icon(
                          (walkieCubit.get(context).Favorites[walkieCubit.get(context).getPostModel!.posts![widget.index].id]) ? Icons.favorite  : Icons.favorite_border_outlined,
                          color: Colors.green,
                          size: 40,

                        )
                    ),
                  )
                ],
              ),
            ),
          ),
    );
  }
}
