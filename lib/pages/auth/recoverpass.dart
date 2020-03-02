
import 'package:check_astra/blocs/bloc.dart';
import 'package:check_astra/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RecoverLoginPage extends StatefulWidget {
  @override
  _RecoverLoginPage createState() => _RecoverLoginPage();
}

class _RecoverLoginPage extends State<RecoverLoginPage> {
  TextStyle styleText = TextStyle(color: Colors.white);
  RecoverPassBloc _recoverPassBloc;
  TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();


  }
  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    return  BlocProvider(
      create: (_) => _recoverPassBloc,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: BlocListener<RecoverPassBloc, RecoverPassState>(
          listener: (context, state) {
            if (state is ErrorBlocState) {
              //   _showError(context, state.message);
            }
            if (state is LoggedInBlocState) {
              Navigator.pushNamed(context, 'register');
            }
          },
          child: BlocBuilder<RecoverPassBloc, RecoverPassState>(
            builder: (context, state) {
              return DecoratedBox(
                decoration: BoxDecoration(color: Theme.of(context).canvasColor),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 10,
                                top: 10,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    emailController.clear();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 30.0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          height: 50,
                          width: 50,
                        ),
                        SingleChildScrollView(
                          child: Column(children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 140,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    child: Align(
                                      child: Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).primaryColor),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 25, right: 15),
                                      child: Text(
                                        "CONTR",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  Positioned(
                                    child: Align(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 40, left: 10),
                                        width: 130,
                                        child: Text(
                                          "ASEÑA",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: WidgetsCustoms().input(Icon(Icons.email), "CORREO",
                                  emailController, false,context),
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                child: WidgetsCustoms().button("RECUPERAR", Colors.white, primary,
                                    primary, Colors.white, _doRecoverPass),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ]),
                        ),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height / 1.1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  void _doRecoverPass(){
  }
}
