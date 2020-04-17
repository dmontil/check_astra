
import 'package:check_astra/models/user.dart';
import 'package:check_astra/services/local_storage_service.dart';
import 'package:check_astra/services/user_service.dart';
import 'package:get_it/get_it.dart';

abstract class  LoginLogic{
  Future<dynamic> login(String email, String password);
  Future<String> logout();
}
class LoginException implements Exception{}

class SimpleLogin extends LoginLogic{
  @override
  Future<String> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if(email !="ecooter" || password != "123"){
      throw LoginException();
    }
    User user = User(userName: email,password: password,token: "Tokem random");
    GetIt.I.get<LocalStorageService>().setUser(user);
    UserService().setCurrentUser(user);
    return user.token;
  }

  @override
  Future<String> logout() async {
    return "Saliste";
  }
}

class CustomLogin extends LoginLogic {
  @override
  Future login(String email, String password) {
    return null;
  }

  @override
  Future<String> logout() {
    return null;
  }


}








