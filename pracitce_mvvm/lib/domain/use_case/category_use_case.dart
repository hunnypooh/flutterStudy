import 'package:pracitce_mvvm/data/repository/category_repository.dart';
import 'package:pracitce_mvvm/domain/model/category.dart';

class CategoryUseCase {
  final CategoryRepository categoryRepository;

  CategoryUseCase(this.categoryRepository);

  Future<int> addCategory(Category category) async {
    return await categoryRepository.insertCategory(category);
  }

  Future<void> deleteCategory(Category category) async {
    await categoryRepository.deleteCategory(category);
  }

  Future<List<Category>> getCategoryList() async {
    List<Category> list = await categoryRepository.getCategoryList();
    for (int i = 0; i < list.length; i++) {
      if (i % 2 == 0) {
        list[i] = list[i].copyWith(imagePath: "");
        print("=========" + list[i].imagePath + "==========\n");
      }
    }
    return list.reversed.toList();
  }
}
