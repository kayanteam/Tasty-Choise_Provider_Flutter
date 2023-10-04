// ignore_for_file: constant_identifier_names

class EndPoints {
  static const String BASE_URL = 'https://taqiemi.loofy92.com/api';
  // ! Auth
  static const String REGISTR = '/partners/register';
  static const String LOGIN = '/partners/login';
  static const String VERIFY_CODE = '/partners/verify-code';
  static const String FORGET_PASSWORD = '/partners/forget-password';
  static const String RESET_PASSWORD = '/partners/reset-password';

  static const String LOGOUT = '/partners/logout';
  static const String UPDATE_ACCOUNT_DATA = '/partners/update-profile';
  static const String CHANGE_PASSWORD = '/partners/change-password';

  static const String APP_CONFIG = '/partners/app';
  static const String HOME = '/partners/home';
  static const String PRODUCT = '/partners/products';
  static const String PRODUCT_UPDATED = '/partners/update-product';

  static const String ORDER = '/partners/showOrders?status=';
  static const String ORDER_STATUS = '/partners/updateOrder';

  static const String NOTIFICATIONS = '/partners/notifications';

  static const String APP_SETTINGS = '/partners/settings';

  static const String WALLET = '/partners/wallet';
  static const String REQUEST_MONY = '/partners/request-money';

  static const String SUBSCRIBTION = '/partners/subscriptions';
}
