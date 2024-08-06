import 'dart:developer';

import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement_bloc/statemanagement_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginPageViewModel extends BasePageViewModel<LoginEvent, LoginState> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final LoginUseCase _loginUseCase;

  LoginPageViewModel({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(LoginState()) {
    on<SubmitLogin>(_submitLogin);
  }

  void _submitLogin(SubmitLogin event, Emitter<LoginState> emit) async {
    log("mobileController ${mobileController.text}");
    log("passwordController ${passwordController.text}");

    final LoginUseCaseParams params = LoginUseCaseParams(
        emailOrPhone: mobileController.text, password: passwordController.text);
    RequestManager(params,
            createCall: () => _loginUseCase.execute(params: params))
        .asFlow()
        .listen((data) {
      if (data.status == Status.loading) {
        log("loading");
      } else if (data.status == Status.success) {
        log("success");
      }
    });
  }

  @override
  Future<void> close() {
    mobileController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
