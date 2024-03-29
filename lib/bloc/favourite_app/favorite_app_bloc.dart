import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/model/favorite_item_model.dart';
import 'package:counter_app/repository/favorite_repository.dart';
import 'package:equatable/equatable.dart';

part 'favorite_app_event.dart';
part 'favorite_app_state.dart';

class FavoriteAppBloc extends Bloc<FavoriteAppEvent, FavoriteAppState> {
  FavoriteRepository favoriteRepository;
  List<FavoriteItemModel> favoriteList = [];
  FavoriteAppBloc(this.favoriteRepository) : super(const FavoriteAppState()) {
    on<FetchFavoriteList>(fetchList);
    on<FavoriteItem>(_addFavItem);
  }

  void fetchList(
      FetchFavoriteList event, Emitter<FavoriteAppState> emit) async {
    favoriteList = await favoriteRepository.fetchItem();
    emit(
      state.copyWith(
        favoriteItemList: List.from(favoriteList),
        listStatus: ListStatus.success,
      ),
    );
  }

  void _addFavItem(FavoriteItem event, Emitter<FavoriteAppState> emit) async {
    final index =
        favoriteList.indexWhere((element) => element.id == event.itemModel.id);
    favoriteList[index] = event.itemModel;
    emit(state.copyWith(favoriteItemList: List.from(favoriteList)));
  }
}
