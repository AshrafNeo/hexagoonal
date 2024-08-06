import 'dart:developer';

import 'package:domain/domain.dart';

import '../out/database_port.dart';
import '../out/network_port.dart';

class UserRepositoryImpl extends UserRepository {
  final DatabasePort databaseProvider;
  final NetworkPort networkPort;

  UserRepositoryImpl(this.databaseProvider, this.networkPort);

  @override
  Future<Either<NetworkError, User>> loginWithEmail(
      {required String email, required String password}) async {
    log("message loginWithEmail");
    await Future.delayed(Duration(seconds: 1));
    return Right(User());
  }

  @override
  Future<Either<DatabaseError, User>> saveUser(User user) async {
    log("message loginWithEmail");
    await Future.delayed(Duration(seconds: 1));
    return Right(User());
  }
}
