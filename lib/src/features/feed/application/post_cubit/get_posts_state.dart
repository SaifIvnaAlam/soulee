part of 'get_posts_cubit.dart';

@freezed
class GetPostsState with _$GetPostsState {
  const factory GetPostsState.loading() = _Loading;
  const factory GetPostsState.loaded(List<Post> posts) = _Loaded;
  const factory GetPostsState.error() = _Error;
}
