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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: model.mobileController,
            decoration: const InputDecoration(
              hintText: "Mobile",
              hintStyle: TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2)),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: model.passwordController,
            decoration: const InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 40)),
              onPressed: () {
                model.add(SubmitLogin());
              },
              child: const Text("Login"))
        ],
      ),
    );
  }
}
