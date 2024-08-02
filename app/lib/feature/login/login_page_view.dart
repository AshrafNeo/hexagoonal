import 'package:app/feature/login/login_page_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:statemanagement_bloc/statemanagement_bloc.dart';

///
/// Multiple page view can be created on the base upon devices like web,mobile,tablet
///

class LoginPageView extends BasePageViewWidget<LoginPageViewModel> {
  LoginPageView(LoginPageViewModel model) : super(model);

  @override
  Widget build(BuildContext context, LoginPageViewModel model) {
    return const Center(
      child: Text("data"),
    );
  }
}
