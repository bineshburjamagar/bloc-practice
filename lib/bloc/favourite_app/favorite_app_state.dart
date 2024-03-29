part of 'favorite_app_bloc.dart';

enum ListStatus { loading, success, failure }

class FavoriteAppState extends Equatable {
  final List<FavoriteItemModel> favoriteItemList;
  final ListStatus listStatus;
  const FavoriteAppState({
    this.favoriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });
  FavoriteAppState copyWith({
    List<FavoriteItemModel>? favoriteItemList,
    ListStatus? listStatus,
  }) {
    return FavoriteAppState(
      favoriteItemList: favoriteItemList ?? this.favoriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object> get props => [favoriteItemList, listStatus];
}
