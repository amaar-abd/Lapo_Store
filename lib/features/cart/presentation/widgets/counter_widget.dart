import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.value,
    this.increment,
    this.decrement,
  });
  final int value;
  final void Function()? increment;
  final void Function()? decrement;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.surfaceCard.withAlpha(180),
            child: IconButton(
              onPressed: decrement,
              icon: Icon(Icons.remove,color: Colors.white,),
              iconSize: 18,
            ),
          ),
          SizedBox(width: 10),
          Text(value.toString()),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.surfaceCard.withAlpha(180),
            child: IconButton(
              onPressed: increment,
              icon: Icon(Icons.add,color: Colors.white,),
              iconSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
