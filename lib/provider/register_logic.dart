abstract class  RegisterLogic{
  Future<bool> register(String email, String password,password2);
}
class RegisterException implements Exception{}

class SimpleRegister extends RegisterLogic{
  @override
  Future<bool> register(String email, String password, password2) async {
    await Future.delayed(Duration(seconds: 2));
    if( password != password2){
      throw RegisterException();
    }
    print("Registrado");
    return true;
  }
}
