import 'package:app/feature/login/login_page_view.dart';
import 'package:app/feature/login/login_page_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:statemanagement_bloc/statemanagement_bloc.dart';

class LoginPage extends BasePage<LoginPageViewModel> {
  LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends BaseStatefulPage<LoginPageViewModel, LoginPage> {
  @override
  Widget buildView(BuildContext context, LoginPageViewModel model) {
    return LoginPageView(model);
  }
}
