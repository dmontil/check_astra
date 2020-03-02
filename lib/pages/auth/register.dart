import 'package:check_astra/blocs/bloc.dart';
import 'package:check_astra/provider/register_logic.dart';
import 'package:check_astra/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextStyle styleText = TextStyle(color: Colors.white);
  TextEditingController emailController;
  TextEditingController passController;
  TextEditingController pass2Controller;


  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
    pass2Controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    return BlocProvider(
      create: (_) => RegisterBloc(logic: SimpleRegister()),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is ErrorRegisterBlocState) {
              // _showError(context, state.message);
            }
            if (state is RegisteredInBlocState) {
              Navigator.pushNamed(context, '/');
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return  DecoratedBox(
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
                                    passController.clear();
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
                                      padding: EdgeInsets.only(bottom: 25, right: 40),
                                      child: Text(
                                        "REGI",
                                        style: TextStyle(
                                          fontSize: 30,
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
                                        padding: EdgeInsets.only(top: 40, left: 20),
                                        width: 130,
                                        child: Text(
                                          "STRO",
                                          style: TextStyle(
                                            fontSize: 30,
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
                              padding: EdgeInsets.only(bottom: 20),
                              child: WidgetsCustoms().input(Icon(Icons.lock), "CONTRASEÑA",
                                  passController, true,context),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                child: WidgetsCustoms().button("REGISTRAR", Colors.white, primary,
                                    primary, Colors.white, _doRegister),
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

  void _doRegister(){
    BlocProvider.of<RegisterBloc>(context).add(doRegisterEvent(emailController.text,passController.text,pass2Controller.text));
  }

}


