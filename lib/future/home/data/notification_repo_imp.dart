import 'package:tasty_choise_provider/core/network/home_api.dart';
import 'package:tasty_choise_provider/core/network/notification_api.dart';
import 'package:tasty_choise_provider/future/home/domin/notification_repo.dart';
import 'package:tasty_choise_provider/future/home/models/general_response.dart';

class NotificationRepoImp extends NotificationRepo {
  final NotificationApi api;

  NotificationRepoImp({required this.api});

  @override
  EitherType<GeneralResponse> notification() {
    return api.getNotification();
  }
}
