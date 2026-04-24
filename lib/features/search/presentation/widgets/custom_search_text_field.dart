import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/search/presentation/manager/cubit/search_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.controller});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: TextFormField(
              validator: (value) =>
                value == null || value.isEmpty ? 'cant be empty' : null,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                context.read<SearchCubit>().searchByName(query: value);
              }
            },
            onChanged: (value) {
              if (value.isEmpty) {
                context.read<SearchCubit>().resetSearch();
              }
            },
            textAlignVertical: TextAlignVertical.center,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.surfaceCard.withAlpha(180),
              suffixIcon: IconButton(
                onPressed: () {
                  if (controller.text.trim().isNotEmpty) {
                  context.read<SearchCubit>().searchByName(
                    query: controller.text,
                  );
                  }else{
                      
                  }
                },
                icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              ),

              hintText: 'Search by name ,specs',
              hintStyle: TextTheme.of(context).bodyMedium?.copyWith(
                color: AppColors.textSecondary.withAlpha(60),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppColors.accentCyan.withAlpha(100),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
