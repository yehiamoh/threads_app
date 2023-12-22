part of 'add_post_cubit.dart';

@immutable
abstract class AddPostState {}

class AddPostInitial extends AddPostState {}
class AddNewPostLoading  extends AddPostState {}
class AddNewPostSuccess  extends AddPostState {}
class AddNewPostFailed extends AddPostState {
  final String message;
  AddNewPostFailed( this.message);
}
