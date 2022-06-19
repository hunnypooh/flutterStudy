import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pracitce_mvvm/domain/model/category.dart';
import 'package:pracitce_mvvm/domain/model/favorite.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required List<Category> categories,
    required List<Favorite> favorites,
    required String subject,
    required int index,
  }) = _HomeState;
}
