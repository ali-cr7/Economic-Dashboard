import 'package:animations/animations.dart';
import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/home/home_view.dart';
import 'package:economic_team_desktop/presentation/profile/profile_view.dart';
import 'package:economic_team_desktop/presentation/requests/reequest_view.dart';
import 'package:economic_team_desktop/presentation/side%20bar/widgets/side_header.dart';
import 'package:economic_team_desktop/presentation/side%20bar/widgets/sidebar_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideNavigationBar extends StatefulWidget {
  const SideNavigationBar({Key? key}) : super(key: key);

  @override
  State<SideNavigationBar> createState() => _SideNavigationBarState();
}

class _SideNavigationBarState extends State<SideNavigationBar> {
  final SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.vertical;
  int _selectedIndex = 0;
  bool _isReverse = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          child: SidebarNavigation(
            selectedIndex: _selectedIndex,
            onItemSelected: _onItemTapped,
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey)),
            ),
            child: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 600),
              reverse: _isReverse,
              transitionBuilder: (child, animation, secondaryAnimation) {
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: _transitionType,
                  child: child,
                );
              },
              child: _getSelectedContent(_selectedIndex),
            ),
          ),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _isReverse = index < _selectedIndex;
      _selectedIndex = index;
    });
  }

  Widget _getSelectedContent(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const ProfileView();
      case 2:
        return const HistoryContent(key: ValueKey('History'));
      case 3:
        return const RequestsView();
      case 4:
        return const SettingsContent(key: ValueKey('Settings'));
      case 5:
        return const LogoutContent(key: ValueKey('Logout'));
      default:
        return Container(key: const ValueKey('Empty'));
    }
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'email.email@gmail.com',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
          ),
          SizedBox(height: 10.h),
          Text(
            '+363 39253445588',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

class HistoryContent extends StatelessWidget {
  const HistoryContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Import in \$50 on 1-5-SGS',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10.h),
          Text(
            'Import on a\$50 on 1-5-SGS',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class TransactionsContent extends StatelessWidget {
  const TransactionsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Transactions Content'));
  }
}

class SettingsContent extends StatelessWidget {
  const SettingsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings Content'));
  }
}

class LogoutContent extends StatelessWidget {
  const LogoutContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Logout Content'));
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Content'));
  }
}
