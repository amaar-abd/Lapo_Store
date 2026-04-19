import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lapo_app/features/cart/presentation/views/cart_view.dart';
import 'package:lapo_app/features/home/presentation/views/home_view.dart';
import 'package:lapo_app/features/main_layout/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:lapo_app/features/orders/presentation/views/order_view.dart';
import 'package:lapo_app/features/profile/presentation/views/profile_view.dart';
import 'package:lapo_app/features/search/presentation/views/search_view.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  int _selectedIndex = 0;
  final List<Widget> _views = [
    const HomeView(),
    const SearchView(),
    const CartView(),
    const OrderView(),
    const ProfileView(),
  ];
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
      body: IndexedStack(index: _selectedIndex, children: _views),
      bottomNavigationBar: CustomBottomNavBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
