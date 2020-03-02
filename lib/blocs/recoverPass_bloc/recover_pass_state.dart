import 'package:equatable/equatable.dart';

abstract class RecoverPassState extends Equatable {
  const RecoverPassState();
}

class InitialRecoverPassState extends RecoverPassState {
  @override
  List<Object> get props => [];
}
class RecoverinPassInBlocState extends RecoverPassState{
  @override
  List<Object> get props => [];
}
class RecoveredPassInBlocState extends RecoverPassState{
  final bool done;
  RecoveredPassInBlocState(this.done);
  @override
  List<Object> get props => [done];

}

class ErrorRecoverPassBlocState extends RecoverPassState{
  final String message;

  ErrorRecoverPassBlocState(this.message);

  @override
  List<Object> get props => [message];

}
