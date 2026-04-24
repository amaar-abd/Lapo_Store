import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/search/presentation/widgets/filter_item.dart';

class GridViewFilters extends StatefulWidget {
  const GridViewFilters({super.key, required this.searchController});
  final TextEditingController searchController;
  @override
  State<GridViewFilters> createState() => _GridViewFiltersState();
}

final List<String> filters = const [
  'ThinkPad Gen4',
  'MacBook Air M2',
  'Ram 16',
  'Asus Rog Strix G16',
  'Rtx 4050',
];
int activeIndex = -1;

class _GridViewFiltersState extends State<GridViewFilters> {
  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (widget.searchController.text.isEmpty) {
      setState(() {
        activeIndex = -1;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.searchController.removeListener( _onSearchChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, 
  runSpacing: 8.0,
      children: filters.map((product) {
        return FilterItem(
          onTap: () {
            setState(() {
              widget.searchController.text = product;
              activeIndex = filters.indexOf(product);
            });
          },
          backgroundColor: activeIndex == filters.indexOf(product)
              ? AppColors.accentCyan
              : null,

          titleColor: activeIndex == filters.indexOf(product)
              ? AppColors.primaryBackground
              : null,
          title: product,
        );
      }).toList(),
    );
  }
}
