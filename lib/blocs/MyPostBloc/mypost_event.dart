part of 'mypost_bloc.dart';

abstract class MyPostEvent extends Equatable {
  const MyPostEvent();

  @override
  List<Object> get props => [];
}

class MyPostFetched extends MyPostEvent {
  final String userName;

  MyPostFetched({this.userName});
}
