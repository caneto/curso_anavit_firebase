
import '../../../../core/shared/failures/app_failure.dart';
import '../../models/user_auth_model.dart';
import '../interfaces/i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  @override
  Future<UserAuthModel> login(String email, String password) async {
    
    await Future.delayed(const Duration(seconds: 3));
    
    if (email == 'carlos@gmail.com') {
      return UserAuthModel(
        id: '',
        email: email,
      );
    } else {
      throw AppFailure('Erro ao Logar');
    }
  }
}
