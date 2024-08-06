import 'dart:developer';

import 'package:app/dependencies.dart';
import 'package:app/feature/login/login_page_view.dart';
import 'package:app/feature/login/login_page_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:statemanagement_bloc/statemanagement_bloc.dart';

class LoginPage extends BasePage<LoginPageViewModel> {
  LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends BaseStatefulPage<LoginPageViewModel, LoginPage> {
  @override
  Widget buildView(BuildContext context, LoginPageViewModel model) {
    return LoginPageView(model);
  }

  @override
  LoginPageViewModel initModel() {
    log("CALL INIT", name: "initModel");
    return getIt.get<LoginPageViewModel>();
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  void onModelReady(LoginPageViewModel model) {
    log("onModelReady");
  }
}
