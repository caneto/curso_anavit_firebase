
import '../../models/user_auth_model.dart';

abstract class ILoginRepository{

 Future<UserAuthModel> login(String email, String password);
}