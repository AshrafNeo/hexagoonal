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

    on<DataEvent>(_dataEvent);
  }

  void _submitLogin(SubmitLogin event, Emitter<LoginState> emit) async {
    log("mobileController ${mobileController.text}");
    log("passwordController ${passwordController.text}");

    final LoginUseCaseParams params =
        LoginUseCaseParams(emailOrPhone: "9090901234", password: "123456");
    RequestManager(params,
            createCall: () => _loginUseCase.execute(params: params))
        .asFlow()
        .listen((data) {
      add(DataEvent(userResponse: data));
    });
  }

  Future<void> _dataEvent(DataEvent event, Emitter<LoginState> emit) async {
    if (event.userResponse.status == Status.loading) {
      log("LOADING");
      emit(LoadingState());
    } else if (event.userResponse.status == Status.success) {
      log("SUCCESS");
      emit(SuccessState());
    } else if (event.userResponse.status == Status.error) {
      log("ERROR");
      emit(FailureState());
    }
  }

  @override
  Future<void> close() {
    mobileController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
