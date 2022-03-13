import 'package:healthsafe/network/abstract_repositories/auth_repository_providing.dart';
import 'package:healthsafe/network/services/auth_service.dart';

import '../../locator.dart';

class AuthRepository extends AuthRepositoryProviding {
  final AuthService _authService = serviceLocator<AuthService>();

  @override
  Future<dynamic> signInUser() async => await _authService.signInUser();

  @override
  Future<dynamic> signOutUser() async => await _authService.signOutUser();
}
