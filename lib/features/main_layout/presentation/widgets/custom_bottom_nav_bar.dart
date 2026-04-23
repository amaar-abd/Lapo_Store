import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });
  final int selectedIndex;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 4, top: 2),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.surfaceCard.withAlpha(150),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: onTap,
              type: BottomNavigationBarType.fixed,
              enableFeedback: false,
              selectedFontSize: 12,
              unselectedFontSize: 12,

              selectedItemColor: AppColors.accentCyan,
              unselectedItemColor: AppColors.textSecondary,
              backgroundColor: Colors.transparent,
              elevation: 0,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: FaIcon(FontAwesomeIcons.house, size: 20),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: FaIcon(FontAwesomeIcons.cartShopping, size: 20),
                  ),

                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: FaIcon(FontAwesomeIcons.clockRotateLeft, size: 20),
                  ),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: FaIcon(FontAwesomeIcons.user, size: 20),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
