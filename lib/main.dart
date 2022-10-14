import 'package:flutter/material.dart';
import 'package:youth_care/presentation/login/login_screen.dart';
import 'package:youth_care/presentation/splash/splash_screen.dart';

void main() {
  runApp(YouthCare());
}
class YouthCare extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        SplashScreen.id :(context) => SplashScreen(),
        LoginScreen.id :(context) => LoginScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }

}