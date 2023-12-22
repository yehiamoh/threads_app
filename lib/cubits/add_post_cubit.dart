import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());
  TextEditingController controller = TextEditingController();
  Future<void> addPost(BuildContext context) async {
    try {
      if (controller.text.isNotEmpty) {
        emit(AddNewPostLoading());
        await FirebaseFirestore.instance.collection('threadsposts').add({
          'content': controller.text,
          'authorId': FirebaseAuth.instance.currentUser?.uid,
          'createdAt': DateTime.now().toString(),
        });
        controller.clear();
        // Navigator.of(context).pop();
        // ignore: use_build_context_synchronously
        emit(AddNewPostSuccess());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Post created successfully'),
            backgroundColor: Colors.green,
          ),
        );

      }
      else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Post cannot be empty'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      emit(AddNewPostFailed(e.toString()));
    }
  }
}
