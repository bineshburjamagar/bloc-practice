part of 'favorite_app_bloc.dart';

sealed class FavoriteAppEvent extends Equatable {
  const FavoriteAppEvent();

  @override
  List<Object> get props => [];
}

class FetchFavoriteList extends FavoriteAppEvent {}

class FavoriteItem extends FavoriteAppEvent {
  final FavoriteItemModel itemModel;
  const FavoriteItem({required this.itemModel});

  @override
  List<Object> get props => [itemModel];
}
