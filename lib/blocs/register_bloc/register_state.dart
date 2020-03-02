import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class InitialRegisterState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterinInBlocState extends RegisterState{
  @override
  List<Object> get props => [];
}
class RegisteredInBlocState extends RegisterState{
  final bool done;
  RegisteredInBlocState(this.done);
  @override
  List<Object> get props => [done];

}

class ErrorRegisterBlocState extends RegisterState{
  final String message;

  ErrorRegisterBlocState(this.message);

  @override
  List<Object> get props => [message];

}
