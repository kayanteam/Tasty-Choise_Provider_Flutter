import 'package:tasty_choise_provider/core/network/api.dart';
import 'package:tasty_choise_provider/future/home/models/general_response.dart';

abstract class HomeRepo {
  EitherType<GeneralResponse<String>> termsOfUse();
}
