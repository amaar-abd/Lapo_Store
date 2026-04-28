import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/step_widget.dart';

class StepTracker extends StatelessWidget {
  const StepTracker({super.key, required this.currentPage});
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StepWidget(
          number: "1",
          title: "Address",
          isDone: currentPage > 0,
          isCurrent: currentPage == 0,
        ),

        _buildDivider(isPassed: currentPage > 0),

        StepWidget(
          number: "2",
          title: "Payment",
          isDone: currentPage > 1,
          isCurrent: currentPage == 1,
        ),

        _buildDivider(isPassed: currentPage > 1),

        StepWidget(
          number: "3",
          title: "Summary",
          isDone: false,
          isCurrent: currentPage == 2,
        ),
      ],
    );
  }

  Widget _buildDivider({required bool isPassed}) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(top: 15),
        color: isPassed
            ? AppColors.accentCyan
            : AppColors.surfaceCard.withAlpha(180),
      ),
    );
  }
}
