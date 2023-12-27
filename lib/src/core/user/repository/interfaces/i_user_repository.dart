
import '../../models/user_model.dart';

abstract class IUserRepository{

 Future<UserModel> getUser();
 Future<void> logout();
}