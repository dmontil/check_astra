import 'package:equatable/equatable.dart';

abstract class RecoverPassEvent extends Equatable {
  const RecoverPassEvent();
}
//FUNCIONES
class doRecoverPassEvent extends RecoverPassEvent{
  final String email;
  doRecoverPassEvent(this.email);
  @override
  List<Object> get props => [email];

}