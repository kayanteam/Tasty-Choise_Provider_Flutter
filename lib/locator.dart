import 'package:get_it/get_it.dart';
import 'package:tasty_choise_provider/core/network/api.dart';
import 'package:tasty_choise_provider/core/services/dio_service.dart';
import 'package:tasty_choise_provider/core/services/navigation_service.dart';
import 'package:tasty_choise_provider/future/home/data/home_repo_imp.dart';
import 'package:tasty_choise_provider/future/home/domin/home_repo.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DioService());

  Api api = Api(dio: locator<DioService>());
  locator.registerFactory<HomeRepo>(() => HomeRepoImp(api: api));
}
