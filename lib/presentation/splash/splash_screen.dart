import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:youth_care/animation_route.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/presentation/login/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = 'splashscreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
  Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width/30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/benha.jpg'),
              SizedBox(height: size.height/10,),
              LinearPercentIndicator(
                      //width: MediaQuery.of(context).size.width - 50,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 3000,
                      percent: 1,
                      onAnimationEnd: () {
                        //Navigator.push(context, SlideRight(Page: LoginScreen()));
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      barRadius: Radius.circular(20),
                      progressColor: primaryColor,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}