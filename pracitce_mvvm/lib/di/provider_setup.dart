import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

import 'package:pracitce_mvvm/data/data_source/db/category_dao.dart';
import 'package:pracitce_mvvm/data/data_source/db/favorite_dao.dart';
import 'package:pracitce_mvvm/data/repository/category_repository.dart';
import 'package:pracitce_mvvm/data/repository/favorite_repository.dart';
import 'package:pracitce_mvvm/domain/use_case/category_use_case.dart';
import 'package:pracitce_mvvm/domain/use_case/favorite_use_case.dart';
import 'package:pracitce_mvvm/ui/home/home_view_model.dart';

Future<List<SingleChildWidget>> getProviders() async {
  Database database = await openDatabase(
    'homework_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE category (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, color INTEGER)');
      await db.execute(
          'CREATE TABLE favorite (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, color INTEGER)');
    },
  );

  var categoryDAO = CategoryDAO(database);
  var categoryRepository = CategoryRepository(categoryDAO);
  var categoryUseCase = CategoryUseCase(categoryRepository);

  var favoriteDAO = FavoriteDAO(database);
  var favoriteRepository = FavoriteRepository(favoriteDAO);
  var favoriteUseCase = FavoriteUseCase(favoriteRepository);

  var homeViewModel = HomeViewModel(
    categoryUseCase: categoryUseCase,
    favoriteUseCase: favoriteUseCase,
  );

  return [
    ChangeNotifierProvider(create: (_) => homeViewModel),
  ];
}
