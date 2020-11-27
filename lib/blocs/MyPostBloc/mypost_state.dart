part of 'mypost_bloc.dart';

abstract class MyPostState extends Equatable {
  const MyPostState();

  @override
  List<Object> get props => [];
}

class MyPostInitial extends MyPostState {}

class MyPostFailure extends MyPostState {}

class MyPostSuccess extends MyPostState {
  final List<Publication> posts;

  const MyPostSuccess({
    this.posts,
  });

  MyPostSuccess copyWith({
    List<Publication> posts,
    bool hasReachedMax,
  }) {
    return MyPostSuccess(
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object> get props => [posts];

  @override
  String toString() => 'PostSuccess { posts: ${posts.length} }';
}
