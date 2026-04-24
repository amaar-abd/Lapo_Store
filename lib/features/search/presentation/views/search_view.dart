import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/common/domain/repos/product_repo.dart';
import 'package:lapo_app/core/depandency_injection/service_locator.dart';
import 'package:lapo_app/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:lapo_app/features/search/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(sl.get<ProductRepo>()),
      child: const SearchViewBody(),
    );
  }
}
