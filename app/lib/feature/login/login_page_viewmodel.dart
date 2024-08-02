import 'package:statemanagement_bloc/statemanagement_bloc.dart';

class LoginState extends BaseState {}

class LoginEvent extends BaseEvent {}

class LoginPageViewModel extends BasePageViewModel<LoginEvent, LoginState> {
  LoginPageViewModel() : super(LoginState()) {
    on<LoginEvent>((event, emit) {});
  }
}
