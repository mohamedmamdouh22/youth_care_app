import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/logic/change_pass/change_password_cubit.dart';
import 'package:youth_care/logic/login/login_cubit.dart';
import 'package:youth_care/logic/news/news_cubit.dart';
import 'package:youth_care/logic/requests/request_cubit.dart';
import 'package:youth_care/presentation/layout/layout_screen.dart';
import 'package:youth_care/presentation/login/login_screen.dart';
import 'package:youth_care/presentation/news/add_news/add_news.dart';
import 'package:youth_care/presentation/news/news_screen.dart';
import 'package:youth_care/presentation/settings/change_password.dart';
import 'package:youth_care/presentation/settings/contact_screen.dart';
import 'package:youth_care/presentation/settings/dean_speech.dart';
import 'package:youth_care/presentation/splash/splash_screen.dart';
import 'package:youth_care/presentation/widgets/news_card.dart';
import 'firebase_options.dart';
import 'presentation/takeful/add_takeful.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(YouthCare());
}

class YouthCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RequestCubit(),
        ),
        BlocProvider(
          create: (context) => ChangePasswordCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: primaryColor, primaryColorLight: primaryColor),
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          AddNews.id: (context) =>const AddNews(),
          ChangePassword.id: (context) => ChangePassword(),
          DeanSpeech.id: (context) =>const DeanSpeech(),
          ContactScreen.id: (context) => ContactScreen(),
          NewsScreen.id: (context) => NewsScreen(),
          LayoutScreen.id: (context) => const LayoutScreen(),
          TakafulRequester.id: (context) => TakafulRequester()
          // AddNews.id: (context) => AddNews(),
        },
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
