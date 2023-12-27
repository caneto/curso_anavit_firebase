import '../../../../core/shared/services/auth/i_auth_service.dart';
import '../../models/user_model.dart';
import '../interfaces/i_user_repository.dart';

class UserRepository implements IUserRepository {
  UserRepository(this._authService);

  final IAuthService _authService;

  @override
  Future<UserModel> getUser() async {
    final authUser = await _authService.getUser();

    return UserModel();
  }

  @override
  Future<void> logout() async {
    await _authService.logout();
  }
}
