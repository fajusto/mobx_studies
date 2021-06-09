import 'package:flutter/material.dart';
import 'package:mobx_study/screens/login_screen.dart';
import 'package:mobx_study/stores/login_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

Map<int, Color> color = {
  50: Color.fromRGBO(124, 77, 255, .1),
  100: Color.fromRGBO(124, 77, 255, .2),
  200: Color.fromRGBO(124, 77, 255, .3),
  300: Color.fromRGBO(124, 77, 255, .4),
  400: Color.fromRGBO(124, 77, 255, .5),
  500: Color.fromRGBO(124, 77, 255, .6),
  600: Color.fromRGBO(124, 77, 255, .7),
  700: Color.fromRGBO(124, 77, 255, .8),
  800: Color.fromRGBO(124, 77, 255, .9),
  900: Color.fromRGBO(124, 77, 255, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF7C4DFF, color);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'MobX Tutorial',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          scaffoldBackgroundColor: Colors.deepPurpleAccent,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.deepPurpleAccent,
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: colorCustom,
          ),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
