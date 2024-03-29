import 'package:counter_app/bloc/favourite_app/favorite_app_bloc.dart';
import 'package:counter_app/bloc/model/favorite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteApp extends StatefulWidget {
  const FavoriteApp({Key? key}) : super(key: key);

  @override
  State<FavoriteApp> createState() => _FavoriteAppState();
}

class _FavoriteAppState extends State<FavoriteApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavoriteAppBloc>().add(FetchFavoriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite App'),
      ),
      body: BlocBuilder<FavoriteAppBloc, FavoriteAppState>(
          builder: (context, state) {
        switch (state.listStatus) {
          case ListStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case ListStatus.failure:
            return const Text('Error');

          case ListStatus.success:
            return ListView.builder(
                itemCount: state.favoriteItemList.length,
                itemBuilder: (context, index) {
                  final item = state.favoriteItemList[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      trailing: IconButton(
                        icon: Icon(item.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline),
                        onPressed: () {
                          FavoriteItemModel favoriteItemModel =
                              FavoriteItemModel(
                            id: item.id,
                            name: item.name,
                            isFavorite: item.isFavorite ? false : true,
                          );

                          context.read<FavoriteAppBloc>().add(
                                FavoriteItem(itemModel: favoriteItemModel),
                              );
                        },
                      ),
                    ),
                  );
                });
        }
      }),
    );
  }
}
