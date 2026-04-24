import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:lapo_app/features/search/presentation/widgets/before_srarch_view.dart';
import 'package:lapo_app/features/search/presentation/widgets/no_seaech_results_view.dart';
import 'package:lapo_app/features/search/presentation/widgets/search_reuslt_item.dart';

class SearchResultsBlocBuilder extends StatefulWidget {
  const SearchResultsBlocBuilder({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<SearchResultsBlocBuilder> createState() =>
      _SearchResultsBlocBuilderState();
}
class _SearchResultsBlocBuilderState extends State<SearchResultsBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return SizedBox(
            width: double.infinity,
            height: height * 0.30,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.accentCyan),
            ),
          );
        } else if (state is SearchSuccess) {
          final List<ProductEntity> products = state.products;
          if (products.isNotEmpty) {
            return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          child: Row(
            children: [
 
              Container(
                width: 3, 
                height: 16, 
                decoration: BoxDecoration(
                  color: AppColors.accentCyan, 
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8), 
              Text(
                'Search Results [${products.length}]',
                style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
              ),
            ],
          ),
        
        ),
        
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: SearchReusltItem(product: products[index]),
            );
          },
        ),
      ],
    );
  } else {
    return const Center(child: NoSeaechResultsView());
  }
        } else if (state is SearchFailure) {
          return Center(child: Text(state.message));
        } else {
          return const BeforeSrarchView();
        }
      },
    );
  }
}
