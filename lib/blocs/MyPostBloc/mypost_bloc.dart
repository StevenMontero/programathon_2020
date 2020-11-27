import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:programathon_tuercas_2020/Models/publication.dart';
import 'package:programathon_tuercas_2020/repositories/DB/publication_repository.dart';

part 'mypost_event.dart';
part 'mypost_state.dart';

class MyPostBloc extends Bloc<MyPostEvent, MyPostState> {
  MyPostBloc(this._publicatonRepository) : super(MyPostInitial());
  final PublicatonRepository _publicatonRepository;

  @override
  Stream<MyPostState> mapEventToState(
    MyPostEvent event,
  ) async* {
    final currentState = state;
    if (event is MyPostFetched) {
      try {
        if (currentState is MyPostInitial) {
          final posts = await _fetchPosts(event.userName);
          yield MyPostSuccess(posts: posts);
          return;
        } else if (currentState is MyPostSuccess) {
          final posts = await _fetchPosts(event.userName);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : MyPostSuccess(
                  posts: currentState.posts + posts,
                );
        }
      } catch (_) {
        yield MyPostFailure();
      }
    }
  }

  Future<List<Publication>> _fetchPosts(String user) async {
    return await _publicatonRepository.getByUser(user);
  }
}
