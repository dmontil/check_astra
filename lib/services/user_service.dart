import 'package:check_astra/models/user.dart';

class UserService{
 User _user = User();
 UserService() {}

 User getCurrentUser() {
   return _user;
 }

 setCurrentUser(User user) {
   _user = user;
 }


}