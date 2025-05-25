import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedTextColor = Colors.blue;
    final Color unselectedTextColor = Colors.white;

    return Padding(
      padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.sp),
        child: Container(
          decoration:
              isSelected
                  ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  )
                  : null,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isSelected ? selectedTextColor : unselectedTextColor,
                  BlendMode.srcIn,
                ),
                child: icon,
              ),
              SizedBox(width: 12.w),
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
