import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:lapo_app/features/search/presentation/widgets/grid_view_filters.dart';
import 'package:lapo_app/features/search/presentation/widgets/search_results_bloc_builder.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
    final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            CustomSearchTextField(controller: searchController),
            SizedBox(height: 10), 
            Text(
                'ACTIVE FILTERS : ',
                style:TextTheme.of(context).bodyMedium?.copyWith(color: AppColors.textSecondary,fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 20),
            GridViewFilters(searchController: searchController),
            SizedBox(height: 15),
            SearchResultsBlocBuilder(controller: searchController,),
          ],
        ),
      ),
    );
  }
}
