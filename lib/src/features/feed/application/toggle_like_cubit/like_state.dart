part of 'like_cubit.dart';

@freezed
class LikeState with _$LikeState {
  const factory LikeState.initial() = _Initial;
  const factory LikeState.liked() = _Liked;
  const factory LikeState.ulicked() = _Unlicked;
}
