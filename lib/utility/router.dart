import 'package:economic_team_desktop/presentation/auth/login_view.dart';
import 'package:economic_team_desktop/presentation/requests/request_details_view.dart';
import 'package:economic_team_desktop/presentation/side%20bar/side_navigation_bar.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomePageView = '/homePageView';
  static const kRequestDetailsView = '/RequestDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SideNavigationBar(),
      ),
       GoRoute(
        path: kRequestDetailsView,
        builder: (context, state) => const RequestDetailsView(),
      ),
    ],
  );
}
