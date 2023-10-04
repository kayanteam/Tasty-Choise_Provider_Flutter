import 'package:tasty_choise_provider/core/network/home_api.dart';
import 'package:tasty_choise_provider/future/home/models/general_response.dart';

abstract class NotificationRepo {
  EitherType<GeneralResponse> notification();
}
