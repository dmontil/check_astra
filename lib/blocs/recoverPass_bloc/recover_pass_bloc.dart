import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:check_astra/provider/recoverPass_logic.dart';
import 'package:flutter/cupertino.dart';
import '../bloc.dart';

class RecoverPassBloc extends Bloc<RecoverPassEvent, RecoverPassState> {
  final RecoverPassLogic logic;

  RecoverPassBloc({@required this.logic});
  @override
  RecoverPassState get initialState => InitialRecoverPassState();

  @override
  Stream<RecoverPassState> mapEventToState(
    RecoverPassEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
