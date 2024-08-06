import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  @lazySingleton
  LoginUseCase createLocationUsecaseProvider(UserRepository repository) {
    return LoginUseCase(repository);
  }
}
