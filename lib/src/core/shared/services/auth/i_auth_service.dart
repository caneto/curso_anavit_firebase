
import '../../../../modules/login/models/user_auth_model.dart';

abstract class IAuthService {
  Future<String> login(String email, password);
  Future<void> logout();
  Future<UserAuthModel> getUser();
}