import 'package:counter_app/bloc/model/favorite_item_model.dart';

class FavoriteRepository {
  Future<List<FavoriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generatedList(10));
  }

  List<FavoriteItemModel> _generatedList(int length) {
    return List.generate(
      length,
      (index) => FavoriteItemModel(id: index, name: "Item $index"),
    );
  }
}
