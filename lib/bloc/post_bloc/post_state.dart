part of 'post_bloc.dart';

class PostState extends Equatable {
  final List<PostModel> postList;
  final PostStatus postStatus;
  final String message;

  const PostState(
      {this.postList = const <PostModel>[],
      this.postStatus = PostStatus.loading,
      this.message = ''});

  PostState copyWith(
      {List<PostModel>? postList, PostStatus? postStatus, String? message}) {
    return PostState(
        postList: postList ?? this.postList,
        postStatus: postStatus ?? this.postStatus,
        message: message ?? this.message);
  }

  @override
  List<Object> get props => [postList, postStatus, message];
}
