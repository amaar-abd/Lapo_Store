import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/features/home/data/models/category_model.dart';
import 'package:lapo_app/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:lapo_app/features/home/presentation/widgets/category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: categpries.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CategoryItem(
              title: categpries[index].title,
              pathIcon: categpries[index].pathIcon,
              onPressed: () {
                setState(() {
                  activeIndex = index;
                });
                context.read<CategoryCubit>().getProducts(category: categpries[index].query);
              },
              isSelected: activeIndex == index,
            ),
          );
        },
      ),
    );
  }
}
