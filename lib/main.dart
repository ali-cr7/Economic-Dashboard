import 'package:economic_team_desktop/buisness_logic/cubit/negotiation_data_cubit_cubit.dart';
import 'package:economic_team_desktop/buisness_logic/negotion%20offer%20bloc/negotiation_offer_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/create%20economic%20study%20bloc/create_economic_study_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/properties%20requests%20bloc/property_requests_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/send%20economic%20study%20bloc/send_economic_study_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/user%20bloc/user_bloc.dart';
import 'package:economic_team_desktop/data/services/auth%20services/auth_repo_impl.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/firebase_options.dart';
import 'package:economic_team_desktop/utility/app_bloc_observer.dart';
import 'package:economic_team_desktop/utility/app_colors.dart';
import 'package:economic_team_desktop/utility/cash_helper.dart';
import 'package:economic_team_desktop/utility/handle_cash.dart';
import 'package:economic_team_desktop/utility/router.dart';
import 'package:economic_team_desktop/utility/service_locator.dart';
//import 'package:firebase_core/firebase_core.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // String? token = await FirebaseMessaging.instance.getToken();
  // print('here is the token');
  // print('here is the token: $token');
  await CacheHelper.init();
  await getCache();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const SalvestDesktop());
  configLoading();
}

class SalvestDesktop extends StatelessWidget {
  const SalvestDesktop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024), // Adjust to your design spec
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(getIt.get<AuthRepoImpl>()),
          ),
          BlocProvider(
            create:
                (context) =>
                    PropertyRequestsBloc(getIt.get<RequsetsRepoImpl>()),
          ),
          BlocProvider(
            create:
                (context) =>
                    PropertyRequestDetailsBloc(getIt.get<RequsetsRepoImpl>()),
          ),
          BlocProvider(create: (context) => CreateEconomicStudyBloc()),
            BlocProvider(
            create:
                (context) =>
                    SendEconomicStudyBloc(getIt.get<RequsetsRepoImpl>()),
          ),
             BlocProvider(
            create:
                (context) =>
                    NegotiationOfferBloc(getIt.get<RequsetsRepoImpl>()),
          ),
             BlocProvider(
            create:
                (context) =>
                    NegotiationDataCubitCubit(getIt.get<RequsetsRepoImpl>()),
          ),
        //  NegotiationDataCubit
          // CreateEconomicStudyBloc
        ],
        child: MaterialApp.router(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..animationStyle = EasyLoadingAnimationStyle.offset
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.purple
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColors.purple
    ..textColor = AppColors.purple
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
// class SalvestDesktop extends StatelessWidget {
//   const SalvestDesktop({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         // BlocProvider(create: (context) => UserBloc(getIt.get<AuthRepoImpl>())),

//         // //HelpBloc
//         //         BlocProvider(create: (context) => HelpBloc(getIt.get<HelpRepoImpl>())),
//         // BlocProvider(create: (context) => SalePropertyBloc()),
//         // BlocProvider(
//         //   create:
//         //       (context) => SendPropertyBloc(getIt.get<SalePropertyRepoImpl>()),
//         //),
//       ],
//       child: MaterialApp.router(
//         builder: EasyLoading.init(),
//         debugShowCheckedModeBanner: false,
//         routerConfig: AppRouter.router,
//       ),
//     );
//   }
// }
