import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads/cubits/add_post_cubit.dart';

class PostingScreen extends StatefulWidget {
   PostingScreen({super.key});
  @override
  State<PostingScreen> createState() => _PostingScreenState();
}
class _PostingScreenState extends State<PostingScreen> {
  final TextEditingController postController= TextEditingController();
  final addNewPostCubit = AddPostCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPostCubit,AddPostState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: state is AddNewPostLoading? null:
                   () {
                     addNewPostCubit.addPost(context);
                   },
                child: const Text(
                  "Post",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],

          ),
          body: state is AddNewPostLoading? const Center(child: CircularProgressIndicator(color: Colors.black,),)
           :
          TextFormField(
            controller: addNewPostCubit.controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintText: 'Post',
            ),
            maxLines: 50,
          ),
        );
      },
    );
  }
}
