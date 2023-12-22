import 'package:chat_firebase/src/modules/login/models/user_auth_model.dart';

abstract class ILoginRepository{

 Future<UserAuthModel> login(String email, String password);
}