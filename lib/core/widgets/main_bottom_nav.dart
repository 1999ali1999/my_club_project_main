import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../router/app_router.dart';

class MainBottomNav extends StatelessWidget {
  final String currentRoute;

  const MainBottomNav({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFA0F0F0F), // يطابق rgba(15, 15, 15, 0.98) في الكود الأصلي
        border: Border(top: BorderSide(color: Colors.white10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_filled, 
            label: 'الرئيسية', 
            isActive: currentRoute == AppRouter.homeRoute,
            onTap: () {
              if (currentRoute != AppRouter.homeRoute) {
                Navigator.pushReplacementNamed(context, AppRouter.homeRoute);
              }
            },
          ),
          _NavItem(
            icon: Icons.search, 
            label: 'البحث', 
            isActive: currentRoute == AppRouter.searchRoute,
            onTap: () {
              if (currentRoute != AppRouter.searchRoute) {
                Navigator.pushReplacementNamed(context, AppRouter.searchRoute);
              }
            },
          ),
          _NavItem(
            icon: Icons.list, 
            label: 'قائمتي', 
            isActive: currentRoute == AppRouter.myListRoute,
            onTap: () {
              if (currentRoute != AppRouter.myListRoute) {
                Navigator.pushReplacementNamed(context, AppRouter.myListRoute);
              }
            },
          ),
          _NavItem(
            icon: Icons.settings, 
            label: 'الإعدادات', 
            isActive: currentRoute == AppRouter.settingsRoute,
            onTap: () {
              if (currentRoute != AppRouter.settingsRoute) {
                Navigator.pushReplacementNamed(context, AppRouter.settingsRoute);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive ? AppColors.primary : Colors.white60, size: 24),
          const SizedBox(height: 4),
          Text(
            label, 
            style: TextStyle(
              fontSize: 10, 
              fontWeight: FontWeight.bold,
              color: isActive ? AppColors.primary : Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
