
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'pages/auth/home_login.dart';
import 'pages/auth/login.dart';
import 'pages/auth/recoverpass.dart';
import 'pages/auth/register.dart';
import 'pages/home/commandsAstra/commandsPage.dart';
import 'pages/home/gps/mapPage.dart';
import 'services/local_storage_service.dart';
import 'services/user_service.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        hintColor: Colors.black54,
        primaryColor: Colors.blue,
        canvasColor: Colors.transparent,
        fontFamily: "Montserrat",
      ),
      initialRoute:'homeLogin',
      routes: {
        'mapPage': (BuildContext context) => MapPage(),
        'commandsPage': (BuildContext context) => CommandsPage(),
        'homeLogin': (BuildContext context) => HomeLogin(),
        'loginPage' : (BuildContext context) => LoginPage(),
        'registerPage' : (BuildContext context) => RegisterPage(),
        'recoverPage' : (BuildContext context) => RecoverLoginPage(),
      },

    );
  }
}
Future setupLocator() async {
  GetIt locator = GetIt.I;
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);
  locator.registerSingleton<UserService>(UserService());

}




