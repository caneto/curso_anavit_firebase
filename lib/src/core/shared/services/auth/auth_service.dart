import '../../../../modules/login/models/user_auth_model.dart';
import 'failures/login_failure.dart';
import 'failures/unauthenticated_failure.dart';
import 'i_auth_service.dart';

class AuthService implements IAuthService {
  @override
  Future<UserAuthModel> getUser() async {
    if(_user == null) {
      throw UnauthenticatedFailure('Não autenticado');
    }
    return _user!;
  }

  @override
  Future<String> login(String email, password) async {
     await Future.delayed(const Duration(seconds: 3));
    
    if (email == 'carlos@gmail.com') {
      _user = UserAuthModel(id: 'ID', email: email);
    } else {
      throw LoginFailure('Credenciais invalidos');
    }
    
    return _user!.id;
  }

  @override
  Future<void> logout() async {
    _user = null;
  }

}

UserAuthModel? _user;