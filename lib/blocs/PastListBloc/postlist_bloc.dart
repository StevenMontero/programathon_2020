import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:programathon_tuercas_2020/Models/publication.dart';
import 'package:programathon_tuercas_2020/repositories/DB/publication_repository.dart';

part 'postlist_event.dart';
part 'postlist_state.dart';

class PosstListBloc extends Bloc<PostListEvent, PostListState> {
  PosstListBloc(this._publicatonRepository) : super(PostListInitial());
  final PublicatonRepository _publicatonRepository;

  @override
  Stream<PostListState> mapEventToState(
    PostListEvent event,
  ) async* {
    final currentState = state;
    if (event is PostListFetched) {
      try {
        if (currentState is PostListInitial) {
          final posts = await _fetchPosts(event.provincia);
          yield PostListSuccess(posts: posts);
          return;
        } else if (currentState is PostListSuccess) {
          final posts = await _fetchPosts(event.provincia);
          yield posts.isEmpty
              ? currentState.copyWith()
              : PostListSuccess(
                  posts: currentState.posts + posts,
                );
        }
      } catch (_) {
        yield PostListFailure();
      }
    }
  }

  Future<List<Publication>> _fetchPosts(String province) async {
    return await _publicatonRepository.getByProvince(province);
  }
}
