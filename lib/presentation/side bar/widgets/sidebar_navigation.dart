import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/side%20bar/widgets/side_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidebarNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const SidebarNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, 1.00),
          end: Alignment(0.94, 0.02),
          colors: [
            const Color(0xFF978AEC),
            const Color(0xFF786CB9),
            const Color(0xFF685D9F),
            const Color(0xFF574E86),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      child: Column(
        children: [
          SidebarHeader(),
          const SizedBox(height: 10),
          Expanded(
            child: _NavigationItem(
              icon: Assets.images.home.image(width: 25.w, height: 25.w),
              label: 'Home',
              isSelected: selectedIndex == 0,
              onTap: () => onItemSelected(0),
            ),
          ),
          Expanded(
            child: _NavigationItem(
              icon: Assets.images.profile.image(width: 25.w, height: 25.w),
              label: 'Profile',
              isSelected: selectedIndex == 1,
              onTap: () => onItemSelected(1),
            ),
          ),
          Expanded(
            child: _NavigationItem(
              icon: Assets.images.history.image(width: 25.w, height: 25.w),
              label: 'History',
              isSelected: selectedIndex == 2,
              onTap: () => onItemSelected(2),
            ),
          ),
          Expanded(
            child: _NavigationItem(
              icon: Assets.images.requests.image(width: 25.w, height: 25.w),
              label: 'Requests',
              isSelected: selectedIndex == 3,
              onTap: () => onItemSelected(3),
            ),
          ),
          SizedBox(height: 260.h),
          Container(
            width: 180.13.w,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.h,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h),
          Expanded(
            child: _NavigationItem(
              icon: Assets.images.settings.image(width: 25.w, height: 25.w),
              label: 'Settings',
              isSelected: selectedIndex == 4,
              onTap: () => onItemSelected(4),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: _NavigationItem(
              icon: Assets.images.logout.image(width: 25.w, height: 25.w),
              label: 'Logout',
              isSelected: selectedIndex == 5,
              onTap: () => onItemSelected(5),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavigationItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color selectedTextColor = Colors.blue;
    final Color unselectedTextColor = Colors.white;

    return Padding(
      padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration:
              isSelected
                  ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  )
                  : null,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isSelected ? selectedTextColor : unselectedTextColor,
                  BlendMode.srcIn,
                ),
                child: icon,
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? selectedTextColor : unselectedTextColor,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
