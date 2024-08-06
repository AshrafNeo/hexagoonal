part of 'login_page_viewmodel.dart';

class LoginEvent extends BaseEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class SubmitLogin extends LoginEvent {}
