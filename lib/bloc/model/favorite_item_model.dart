import 'package:equatable/equatable.dart';

class FavoriteItemModel extends Equatable {
  final int id;
  final String name;
  final bool isFavorite;
  final bool isDeleting;

  const FavoriteItemModel({
    required this.id,
    required this.name,
    this.isFavorite = false,
    this.isDeleting = false,
  });

  FavoriteItemModel copyWith({
    int? id,
    String? name,
    bool? isFavorite,
    bool? isDeleting,
  }) {
    return FavoriteItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, isDeleting, isFavorite];
}
