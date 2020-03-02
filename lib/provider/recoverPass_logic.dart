abstract class  RecoverPassLogic{
  Future<bool> recoverPass(String email);
}
class RecoverPassException implements Exception{}

class SimpleRecover extends RecoverPassLogic{
  @override
  Future<bool> recoverPass(String email) async {
    await Future.delayed(Duration(seconds: 2));
    if( email != "test@test.com"){
      throw RecoverPassException();
    }
    print("Recuperando pass");
    return true;
  }
}
