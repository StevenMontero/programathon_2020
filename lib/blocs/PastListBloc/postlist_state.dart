part of 'postlist_bloc.dart';

abstract class PostListState extends Equatable {
  const PostListState();

  @override
  List<Object> get props => [];
}

class PostListInitial extends PostListState {}

class PostListFailure extends PostListState {}

class PostListSuccess extends PostListState {
  final List<Publication> posts;
  final String provincia;

  const PostListSuccess({
    this.posts,
    this.provincia,
  });

  PostListSuccess copyWith({
    List<Publication> posts,
    String provincia,
  }) {
    return PostListSuccess(
      posts: posts ?? this.posts,
      provincia: provincia ?? this.provincia,
    );
  }

  @override
  List<Object> get props => [posts, provincia];

  @override
  String toString() =>
      'PostSuccess { posts: ${posts.length}, provincia: $provincia }';
}
