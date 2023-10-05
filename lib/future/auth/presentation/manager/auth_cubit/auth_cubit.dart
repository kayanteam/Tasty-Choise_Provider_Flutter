import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:tasty_choise_provider/core/storage/pref/shared_pref_controller.dart';
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';
import 'package:tasty_choise_provider/future/auth/domin/auth_repo.dart';
import 'package:tasty_choise_provider/future/auth/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;

  AuthCubit(this.repo) : super(AuthInitial());

  static AuthCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int socialIndex = 0;

  changeSelectSocial(int index) {
    socialIndex = index;
    emit(AuthInitial());
  }

  UserModel? user;
  bool isSubscribe = false;
  void loadDataUser() async {
    user = SharedPrefController().getDataUser();
    final response = await http.get(
        Uri.parse('https://taqiemi.loofy92.com/api/partners/profile'),
        headers: AppHelpers.getHeader());

    isSubscribe = jsonDecode(response.body)['data']['is_subscribed'];
    emit(AuthInitial());
  }

  bool agreeTerms = false;
  changeAgree(bool status) {
    agreeTerms = status;
    emit(AuthInitial());
  }

  String? pathImage;
  bool pickedImage = false;
  changeProfile() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pathImage = image.path;
      pickedImage = true;
      emit(AuthInitial());
    }
  }

  Future login(String email, String password) async {
    emit(AuthLoginLoading());
    (await repo.login(email: email, password: password)).fold(
      (l) {
        emit(AuthLoginFailuer(l));
      },
      (r) async {
        if (r.user != null) {
          user = UserModel.fromJson(r.user!);
          await SharedPrefController().saveDataUser(user!);
        }
        emit(AuthLoginSuccess(r.message));
      },
    );
  }

  Future updateProfileData(
    UserModel user,
    int categoryId,
  ) async {
    emit(AuthUpdateProfileLoading());
    (await repo.updateProfileData(
      user: user,
      categoryId: categoryId,
    ))
        .fold(
      (l) {
        emit(AuthUpdateProfileFailuer(l));
      },
      (r) async {
        if (r.data != null) {
          this.user = UserModel.fromJson(r.data!);
          await SharedPrefController().saveDataUser(this.user!);
        }
        emit(AuthUpdateProfileSuccess(r.message ?? ""));
      },
    );
  }

  Future register(
      {required String admin,
      required String email,
      required int categoryId,
      required String name,
      required String password}) async {
    emit(AuthRegisterLoading());
    (await repo.register(
            email: email,
            name: name,
            password: password,
            admin: admin,
            categoryId: categoryId))
        .fold(
      (l) {
        emit(AuthRegisterFailuer(l));
      },
      (r) async {
        emit(AuthRegisterSuccess(r.message ?? ""));
      },
    );
  }

  Future verifyCode(String email, String code, {bool saveData = true}) async {
    emit(AuthVerifyLoading());
    (await repo.verifyCode(email: email, code: code)).fold(
      (l) {
        emit(AuthVerifyFailuer(l));
      },
      (r) async {
        if (r.user != null && saveData) {
          user = UserModel.fromJson(r.user!);
          await SharedPrefController().saveDataUser(user!);
        }
        emit(AuthVerifySuccess(r.message ?? ""));
      },
    );
  }

  Future forgetPassword(String email) async {
    emit(AuthForgetPassLoading());
    (await repo.forgetPassword(email: email)).fold(
      (l) {
        emit(AuthForgetPassFailuer(l));
      },
      (r) async {
        emit(AuthForgetPassSuccess(r.message ?? ""));
      },
    );
  }

  Future resetPassword(
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    emit(AuthResetPassLoading());
    (await repo.resetPassword(
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    ))
        .fold(
      (l) {
        emit(AuthResetPassFailuer(l));
      },
      (r) async {
        emit(AuthResetPassSuccess(r.message ?? ""));
      },
    );
  }

  Future changePassword(
      String currentPass, String newPass, String passwordConfirmation) async {
    emit(AuthChangePassLoading());
    (await repo.changePassword(
            confirmPass: passwordConfirmation,
            newPass: newPass,
            currentPass: currentPass))
        .fold(
      (l) {
        emit(AuthChangePassFailuer(l));
      },
      (r) async {
        emit(AuthChangePassSuccess(r.message ?? ""));
      },
    );
  }
}
