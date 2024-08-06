import 'package:app/dependencies.dart';
import 'package:app/feature/login/login_page_viewmodel.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:domain/domain.dart';

import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @Named("BaseUrl")
  String get baseUrl => FlavorConfig.instance.values.apiBaseUrl;

  @injectable
  LoginPageViewModel get loginPageViewModel =>
      LoginPageViewModel(loginUseCase: getIt.get<LoginUseCase>());
}
