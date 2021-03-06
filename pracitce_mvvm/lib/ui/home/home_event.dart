import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pracitce_mvvm/domain/model/category.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadCategories() = LoadCategories;
  const factory HomeEvent.changeBottomNavigationIndex(int index) =
      ChangeBottomNavigationIndex;
  const factory HomeEvent.saveCategory(String text, String imagePath) =
      SaveCategory;
  const factory HomeEvent.removeCategory(Category category) = RemoveCategory;
}
