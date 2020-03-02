import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}
//FUNCIONES

class doRegisterEvent extends RegisterEvent{
  final String email;
  final String password;
  final String password2;

  doRegisterEvent(this.email, this.password, this.password2);

  @override
  List<Object> get props => [email,password,password2];

}
