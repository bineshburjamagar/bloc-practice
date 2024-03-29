import 'package:bloc/bloc.dart';
import 'package:counter_app/model/post_model.dart';
import 'package:counter_app/repository/post_repository.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostState()) {
    on<FetchPostEvent>(fetchPost);
  }

  void fetchPost(FetchPostEvent event, Emitter<PostState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(
        state.copyWith(
          postList: value,
          postStatus: PostStatus.success,
          message: 'success',
        ),
      );
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
            postList: [],
            postStatus: PostStatus.failure,
            message: error.toString()),
      );
    });
  }
}
