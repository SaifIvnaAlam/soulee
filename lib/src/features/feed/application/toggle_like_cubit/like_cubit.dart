import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_state.dart';
part 'like_cubit.freezed.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeState.initial());
  bool isLiked = false;

  void toggleLike() {
    log("Ptee");
    isLiked = !isLiked;
    if (isLiked) {
      emit(LikeState.liked());
    } else {
      emit(LikeState.ulicked());
    }
  }
}
