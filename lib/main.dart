import 'package:economic_team_desktop/utility/app_colors.dart';
import 'package:economic_team_desktop/utility/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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
      child: MaterialApp.router(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
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
