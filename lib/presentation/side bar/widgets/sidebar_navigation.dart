import 'package:economic_team_desktop/buisness_logic/chat%20users%20bloc/chat_users_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/properties%20requests%20bloc/property_requests_bloc.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/side%20bar/widgets/navigation_item.dart';
import 'package:economic_team_desktop/presentation/side%20bar/widgets/side_header.dart';
import 'package:economic_team_desktop/utility/handle_cash.dart';
import 'package:economic_team_desktop/utility/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
            child: NavigationItem(
              icon: Assets.images.home.image(width: 25.w, height: 25.w),
              label: 'Home',
              isSelected: selectedIndex == 0,
              onTap: () => onItemSelected(0),
            ),
          ),
          Expanded(
            child: NavigationItem(
              icon: Assets.images.profile.image(width: 25.w, height: 25.w),
              label: 'Profile',
              isSelected: selectedIndex == 1,
              onTap: () => onItemSelected(1),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                context.read<PropertyRequestsBloc>().add(
                  GetPropertiesRequestEvent(),
                );
              },
              child: NavigationItem(
                icon: Assets.images.history.image(width: 25.w, height: 25.w),
                label: 'History',
                isSelected: selectedIndex == 2,
                onTap: () {
                  context.read<PropertyRequestsBloc>().add(
                    GetPropertiesRequestEvent(),
                  );
                  onItemSelected(2);
                },
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                context.read<PropertyRequestsBloc>().add(
                  GetPropertiesRequestEvent(),
                );
              },
              child: NavigationItem(
                icon: Assets.images.requests.image(width: 25.w, height: 25.w),
                label: 'Requests',
                isSelected: selectedIndex == 3,
                onTap: () {
                  context.read<PropertyRequestsBloc>().add(
                    GetPropertiesRequestEvent(),
                  );
                  onItemSelected(3);
                },
              ),
            ),
          ),
          Expanded(
            child: NavigationItem(
              icon: Assets.images.negotiationIcon.image(
                width: 25.w,
                height: 25.w,
              ),
              label: 'Negotiations',
              isSelected: selectedIndex == 4,
              onTap: () {
                context.read<ChatUsersBloc>().add(
                  GetChatUsersEvent(userId: userId!),
                );
                onItemSelected(4);
              },
              //  () =>
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
            child: NavigationItem(
              icon: Assets.images.settings.image(width: 25.w, height: 25.w),
              label: 'Settings',
              isSelected: selectedIndex == 5,
              onTap: () => onItemSelected(5),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: NavigationItem(
              icon: Assets.images.logout.image(width: 25.w, height: 25.w),
              label: 'Logout',
              isSelected: selectedIndex == 6,
              onTap: () {
                removeCache();
                GoRouter.of(context).push(AppRouter.kLogin);
              },
            ),
          ),
        ],
      ),
    );
  }
}
