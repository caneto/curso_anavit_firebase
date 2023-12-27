import '../../../../core/shared/services/auth/i_auth_service.dart';
import '../../models/user_auth_model.dart';
import '../interfaces/i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  LoginRepository(this._authService);

  final IAuthService _authService;

  @override
  Future<UserAuthModel> login(String email, String password) async {
    await _authService.login(email, password);

    return _authService.getUser();
  }
}
