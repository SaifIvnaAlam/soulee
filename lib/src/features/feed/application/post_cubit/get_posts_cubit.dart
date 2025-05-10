import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soulee/src/features/feed/domain/interface/i_get_post.dart';
import 'package:soulee/src/features/feed/domain/models/post_model.dart';

part 'get_posts_state.dart';
part 'get_posts_cubit.freezed.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  final IGetPost getposts;

  GetPostsCubit(this.getposts) : super(const GetPostsState.loading());

  Future<void> getPosts() async {
    emit(const GetPostsState.loading());

    try {
      final posts = await getposts.getPosts();
      emit(GetPostsState.loaded(posts));
    } catch (e) {
      emit(GetPostsState.error());
    }
  }
}
