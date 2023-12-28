import '../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../shared/services/api/i_api_service.dart';
import '../../models/user_model.dart';
import '../interfaces/i_user_repository.dart';

class UserRepository implements IUserRepository {
  UserRepository(this._authService, this._apiService);

  final IAuthService _authService;
  final IApiService _apiService;

  @override
  Future<UserModel> getUser() async {
    final authUser = await _authService.getUser();

    final response = await _apiService.getByID('users', authUser.id);

    final user = UserModel.fromMap(response);

    return user;
  }

  @override
  Future<void> logout() async {
    await _authService.logout();
  }
}
