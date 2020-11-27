part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class PostInitial extends HomeState {}

class PostFailure extends HomeState {}

class PostSuccess extends HomeState {
  final List<Publication> posts;
  final bool hasReachedMax;

  const PostSuccess({
    this.posts,
    this.hasReachedMax,
  });

  PostSuccess copyWith({
    List<Publication> posts,
    bool hasReachedMax,
  }) {
    return PostSuccess(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() =>
      'PostSuccess { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
}
