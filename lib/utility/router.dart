import 'package:economic_team_desktop/buisness_logic/currency%20bloc/currency_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/properties%20requests%20bloc/property_requests_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20indicators/property_indicators_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/requests%20statistcs%20bloc/requstes_statistics_bloc.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/data/services/statistics%20services/statistics_repo_impl.dart';
import 'package:economic_team_desktop/presentation/auth/confirm_email_view.dart';
import 'package:economic_team_desktop/presentation/auth/login_view.dart';
import 'package:economic_team_desktop/presentation/auth/reset_password_view.dart';
import 'package:economic_team_desktop/presentation/requests/request_details_view.dart';
import 'package:economic_team_desktop/presentation/side%20bar/side_navigation_bar.dart';
import 'package:economic_team_desktop/utility/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomePageView = '/homePageView';
  static const kRequestDetailsView = '/RequestDetailsView';
  static const kConfirmEail = '/ConfirmEmailView';
  static const kResetPasswordView = '/ResetPasswordView';
  static const kLogin = '/LoginView';

  static final router = GoRouter(
    routes: [
        GoRoute(path: kLogin, builder: (context, state) => const LoginView()),
      if (token == null)
        GoRoute(path: '/', builder: (context, state) => const LoginView()),
      if (token != null)
        GoRoute(
          path: '/',
          builder:
              (context, state) => BlocProvider(
                create:
                    (context) =>
                        CurrencyBloc(getIt.get<StatisticsRepoImpl>())
                          ..add(GetCurrencyEvent()),
                child: const SideNavigationBar(),
              ),
        ),
      GoRoute(
        path: kHomePageView,
        builder: (context, state) => const SideNavigationBar(),
      ),
      GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kHomePageView,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) => RequstesStatisticsBloc(
                        getIt.get<StatisticsRepoImpl>(),
                      )..add(
                        GetRequstesStatisticsEvent(year: DateTime.now().year),
                      ),
                ),
              ],
              //  create: (context) => SubjectBloc(),
              child: const SideNavigationBar(),
            ),
      ),

      GoRoute(
        path: kConfirmEail,
        builder: (context, state) => const ConfirmEmailView(),
      ),
      //ConfirmEmailView
      GoRoute(
        path: kRequestDetailsView,
        builder: (context, state) {
          //   final requestId = state.extra as int;
          final data = state.extra as Map<String, dynamic>;

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create:
                    (context) => PropertyRequestDetailsBloc(
                      getIt.get<RequsetsRepoImpl>(),
                    )..add(
                      GetPropertiesRequestDetailsEvent(
                        requestId: data['requestId'],
                      ),
                    ),
              ),
              BlocProvider(
                create:
                    (context) =>
                        PropertyIndicatorsBloc(getIt.get<RequsetsRepoImpl>())
                          ..add(GetPropertyIndicatorsEvent()),
              ),
            ],
            child: RequestDetailsView(
              propertyForSaleId: data['propertyForSaleId'],
              byWhom: data['byWhom'],
              agreedNegotiationId: data['agreedNegotiationId'],
              agreedNegotiationText: data['agreedNegotiationText'],
              acceptAdmin: data['acceptAdmin'],
              agreedNegotiationStatus: data['agreedNegotiationStatus'],
              requestId: data['requestId'],
            ),
          );
        },
      ),
    ],
  );
}
