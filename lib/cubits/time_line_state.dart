part of 'time_line_cubit.dart';

@immutable
abstract class TimeLineState {}

class TimeLineInitial extends TimeLineState {}
class TimeLineLoading extends TimeLineState {}
class TimeLineSuccess extends TimeLineState {
  final List<PostModel> posts;
  TimeLineSuccess(this.posts);
}
class TimeLineFailed extends TimeLineState {
  final String message;
  TimeLineFailed(this.message);}
