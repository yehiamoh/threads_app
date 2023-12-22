import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:threads/models/post_model.dart';
import 'package:threads/models/user_model.dart';

part 'time_line_state.dart';

class TimeLineCubit extends Cubit<TimeLineState> {
  TimeLineCubit() : super(TimeLineInitial());
  void getTimeLine() async{
    try{
      emit(TimeLineLoading());
      final posts = await FirebaseFirestore.instance
          .collection('threadsposts')
          .orderBy('createdAt', descending: true)
          .get();
      List<PostModel> listOfPosts=[];
      for (final post in posts.docs) {
        final fetchedUser = await FirebaseFirestore.instance
            .collection('users')
            .where('userId', isEqualTo: post.data()['authorId'])
            .get();
        // this will return more than user , one user in each iteration.
        final user = UserModel.fromJson(fetchedUser.docs.first.data());
        final modelPost = PostModel.fromJson(post.data(), user);
        listOfPosts.add(modelPost);
    }
      emit(TimeLineSuccess(listOfPosts));

  }catch(e){
      emit(TimeLineFailed(e.toString()));
    }
}
}
