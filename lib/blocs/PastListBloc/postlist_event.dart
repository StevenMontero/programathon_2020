part of 'postlist_bloc.dart';

abstract class PostListEvent extends Equatable {
  const PostListEvent();

  @override
  List<Object> get props => [];
}

class PostListFetched extends PostListEvent {
  final String provincia;

  PostListFetched({this.provincia});
}
