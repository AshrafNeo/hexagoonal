part of 'login_page_viewmodel.dart';

class LoginEvent extends BaseEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class SubmitLogin extends LoginEvent {}

class LoadingEvent extends LoginEvent {}

class SuccessEvent extends LoginEvent {}

class FailureEvent extends LoginEvent {}

class DataEvent extends LoginEvent {
  final Resource<User> userResponse;

  DataEvent({required this.userResponse});

  @override
  List<Object?> get props => [userResponse];
}
