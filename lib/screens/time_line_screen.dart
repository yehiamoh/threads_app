import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads/cubits/time_line_cubit.dart';
import 'package:threads/widgets/posts_widget.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  void initState() {
    super.initState();
    context.read<TimeLineCubit>().getTimeLine();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeLineCubit, TimeLineState>(builder: (context, state) {
      if (state is TimeLineSuccess) {
        return ListView.separated(
            shrinkWrap: true,
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final postItem = state.posts[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostWidget(
                    name: postItem.user.name,
                    content: postItem.content,
                    image: postItem.user.photo),
              );
            },
            separatorBuilder: (context,index){
              return Column(
                children: [
                  Container(
                    color: Colors.grey,
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 20,)
                ],
              );
        },
            );

      }
      if (state is TimeLineLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      }
      return SizedBox();
    });
  }
}
