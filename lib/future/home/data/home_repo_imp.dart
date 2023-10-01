import 'package:tasty_choise_provider/core/network/api.dart';
import 'package:tasty_choise_provider/future/home/domin/home_repo.dart';
import 'package:tasty_choise_provider/future/home/models/general_response.dart';

class HomeRepoImp extends HomeRepo {
  final Api api;

  HomeRepoImp({required this.api});

  @override
  EitherType<GeneralResponse<String>> termsOfUse() {
    return api.termsOfUse();
  }
}
