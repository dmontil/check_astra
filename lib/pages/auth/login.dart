import 'package:check_astra/blocs/bloc.dart';
import 'package:check_astra/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:check_astra/models/user.dart';
import 'package:check_astra/provider/login_logic.dart';
import 'package:check_astra/services/local_storage_service.dart';
import 'package:check_astra/widgets/widgets.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Size _screenSize;
  LoginBlocBloc _loginBloc;
  TextEditingController emailController;
  TextEditingController passController;
  TextStyle styleText = TextStyle(color: Colors.white);
  LocalAuthentication _localAth;
  bool _isBiometricAvailable = false;
  bool _isFirstLaunch = false;
  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBlocBloc(logic: SimpleLogin());
    emailController = TextEditingController();
    passController = TextEditingController();
    _localAth = LocalAuthentication();
    _isFirstLaunch = checkFirstLaunch();
    if (_isFirstLaunch) {
      _localAth.canCheckBiometrics.then((b) {
        setState(() {
          _isBiometricAvailable = b;
        });
      });
    }

    if (kReleaseMode) {
      // PARA EN MODO DEBUG NO TENER QUE PONER PASS
    } else {
      emailController.text = "";
      passController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    return BlocProvider(
      create: (_) => _loginBloc,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: BlocListener<LoginBlocBloc, LoginBlocState>(
          listener: (context, state) {
            if (state is ErrorBlocState) {
              _showError(context, state.message);
            }
            if (state is LoggedInBlocState) {
              Navigator.pushNamed(context, 'commandsPage');
            }
          },
          child: BlocBuilder<LoginBlocBloc, LoginBlocState>(
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
                          child: Column(
                            children: <Widget>[
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
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    Positioned(
                                      child: Container(
                                        child: Text(
                                          "LOGIN",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20, top: 60),
                                child: WidgetsCustoms().input(Icon(Icons.email),
                                    "EMAIL", emailController, false, context),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: WidgetsCustoms().input(Icon(Icons.lock),
                                    "PASSWORD", passController, true, context),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: Container(
                                  child: WidgetsCustoms().button(
                                      "LOGIN",
                                      Colors.white,
                                      primary,
                                      primary,
                                      Colors.white,
                                      _doLogin),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              if (_isBiometricAvailable)
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 30,
                                      left: 20,
                                      right: 20,
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Container(
                                    child: WidgetsCustoms().button(
                                        "Usar huella dactilar",
                                        Colors.white,
                                        primary,
                                        primary,
                                        Colors.white,
                                        _doLoginWhitFinger),
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
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

  void _doLoginWhitFinger() async {
    bool didAuthenticate = await _localAth.authenticateWithBiometrics(
        localizedReason: "Iniciar sesion con huella");

    if (didAuthenticate) {
      User user = GetIt.I.get<LocalStorageService>().getUser();
      setState(() {
        emailController.text = user.userName;
        passController.text = user.password;
      });
      _doLogin();
    }
  }

  void _doLogin() {
    _loginBloc.add(DoLoginEvent(emailController.text, passController.text));
  }

  void _showError(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  decoration(String text, IconData icon) {
    return InputDecoration(
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent[100])),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      hintText: text,
      hintStyle: styleText,
    );
  }
}

bool checkFirstLaunch() {
  User user = GetIt.I.get<LocalStorageService>().getUser();
  if (user != null) return true;
  return false;
}
