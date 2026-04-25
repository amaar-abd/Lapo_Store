import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lapo_app/core/common/data/models/product_model.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/features/home/presentation/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      body: SafeArea(child: DetailsViewBody(product: ProductModel.fromEntity(product))),
    );
  }
}
