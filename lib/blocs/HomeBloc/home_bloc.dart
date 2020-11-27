import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:programathon_tuercas_2020/Models/publication.dart';
import 'package:programathon_tuercas_2020/repositories/DB/publication_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._publicatonRepository) : super(PostInitial());
  final PublicatonRepository _publicatonRepository;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    final currentState = state;
    if (event is PostFetched) {
      try {
        if (currentState is PostInitial) {
          final posts = await _fetchPosts(0, 20);
          yield PostSuccess(posts: posts, hasReachedMax: false);
          return;
        } else if (currentState is PostSuccess) {
          final posts = await _fetchPosts(currentState.posts.length, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostSuccess(
                  posts: currentState.posts + posts,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield PostFailure();
      }
    }
  }

  Future<List<Publication>> _fetchPosts(int startIndex, int limit) async {
    return await _publicatonRepository.getListPublications();
  }
}
