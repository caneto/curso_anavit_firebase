import '../../../../modules/login/models/user_auth_model.dart';
import 'failures/login_failure.dart';
import 'failures/unauthenticated_failure.dart';
import 'i_auth_service.dart';

class AuthService implements IAuthService {
  @override
  Future<UserAuthModel> getUser() async {
    await Future.delayed(const Duration(seconds: 1));
    
    if(_user == null) {
      throw UnauthenticatedFailure('Não autenticado');
    }
    return _user!;
  }

  @override
  Future<String> login(String email, password) async {
     await Future.delayed(const Duration(seconds: 1));
    
    if (email == 'carlos@gmail.com') {
      _user = UserAuthModel(id: 'USER-ID', email: email);
    } else {
      throw LoginFailure('Credenciais invalidos');
    }
    
    return _user!.id;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

}

UserAuthModel? _user;