import 'package:dio/dio.dart';
import 'package:economic_team_desktop/data/services/auth%20services/auth_repo_impl.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_config.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:get_it/get_it.dart';


final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: APIConfig.baseUrl,
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
          receiveDataWhenStatusError: true,
          maxRedirects: 5,
        ),
      ),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
 getIt.registerSingleton<RequsetsRepoImpl>(
    RequsetsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

}
