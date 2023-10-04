import 'package:tasty_choise_provider/core/network/auth_api.dart';
import 'package:tasty_choise_provider/future/auth/domin/auth_repo.dart';
import 'package:tasty_choise_provider/future/auth/models/general_auth_response.dart';
import 'package:tasty_choise_provider/future/auth/models/user_model.dart';
import 'package:tasty_choise_provider/future/home/models/general_response.dart';

class AuthRepoImp extends AuthRepo {
  AuthRepoImp({required this.api});
  final AuthApi api;

  @override
  EitherType<GeneralAuthResponse<UserModel>> login({
    required String email,
    required String password,
  }) {
    return api.login(email, password);
  }

  @override
  EitherType<GeneralAuthResponse<UserModel>> register({
    required String admin,
    required String name,
    required String email,
    required String password,
    required int categoryId,
  }) {
    return api.register(
      admin: admin,
      name: name,
      categoryId: categoryId,
      password: password,
      email: email,
    );
  }

  @override
  EitherType<GeneralAuthResponse<UserModel>> verifyCode({
    required String email,
    required String code,
  }) {
    return api.verifyCode(email, code);
  }

  @override
  EitherType<GeneralAuthResponse> forgetPassword({
    required String email,
  }) {
    return api.forgetPassword(email);
  }

  @override
  EitherType<GeneralAuthResponse<void>> resetPassword({
    required String email,
    required String password,
    required String passwordConfirmation,
  }) {
    return api.resetPassword(email, password, passwordConfirmation);
  }

  @override
  EitherType<GeneralAuthResponse<void>> changePassword({
    required String currentPass,
    required String newPass,
    required String confirmPass,
  }) {
    return api.changePassword(currentPass, newPass, confirmPass);
  }

  @override
  EitherType<GeneralResponse> updateProfileData(
      {required UserModel user, required int categoryId}) {
    return api.updateProfileData(user, categoryId);
  }
}
