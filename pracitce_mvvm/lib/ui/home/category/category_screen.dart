import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pracitce_mvvm/ui/home/home_view_model.dart';
import 'package:pracitce_mvvm/ui/home/home_event.dart';
import './components/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;
    final TextEditingController _controller = TextEditingController();
    final colorList = [
      Theme.of(context).colorScheme.primaryContainer,
      Theme.of(context).colorScheme.secondaryContainer,
      Theme.of(context).colorScheme.tertiaryContainer,
      Theme.of(context).colorScheme.errorContainer,
    ];

    return Column(
      children: <Widget>[
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: state.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 120,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    viewModel.onEvent(
                        HomeEvent.removeCategory(state.categories[index]));
                  },
                  child: CategoryCard(
                    color: colorList[state.categories[index].color],
                    title: state.categories[index].title,
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: "아이템을 입력하세요",
              labelStyle: const TextStyle(color: Colors.white),
              filled: true,
              fillColor: Theme.of(context).colorScheme.primary,
            ),
            onSubmitted: (text) {
              viewModel.onEvent(HomeEvent.saveCategory(text));
            },
          ),
        ),
      ],
    );
  }
}
