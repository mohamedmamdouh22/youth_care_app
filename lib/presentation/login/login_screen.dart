import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/logic/login/login_cubit.dart';
import 'package:youth_care/logic/news/news_cubit.dart';
import 'package:youth_care/presentation/layout/layout_screen.dart';
import 'package:youth_care/presentation/widgets/custom_button.dart';
import 'package:youth_care/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String id = 'loginscreen';
  bool isAsync=false;
  TextEditingController emialcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  String? userName;
  String? password;
  GlobalKey<FormState> fromKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
                if (state is LoginLoading) {
          isAsync = true;
        } else if (state is LoginSuccess) {
           showTopSnackBar(
                context, CustomSnackBar.success(message: 'Welcome Back !'));
          // BlocProvider.of<NewsCubit>(context).getNews();
          Navigator.pushNamedAndRemoveUntil(context, LayoutScreen.id, (route) => false);
          isAsync=false;
          emialcontroller.clear();
          passwordcontroller.clear();
          BlocProvider.of<LoginCubit>(context).visiblePassword=true;
        } else if(state is LoginFailure) {
              showTopSnackBar(
                context, CustomSnackBar.error(message: state.errMessage));
          isAsync=false;
          passwordcontroller.clear();
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall:isAsync ,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: fromKey,
                child: ListView(
                  children: [
                    
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      shoubra,
                      height: 220,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3f5061)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormTextField(
                      hint: 'User Name',
                      onChanged: (data) {
                        userName = data;
                      },
                    ),
                    CustomFormTextField(
                      hint: 'Password',
                      icon: IconButton(
                        onPressed: () {
                          BlocProvider.of<LoginCubit>(context).changePasswordVisibility();
                        },
                        icon: Icon(
                          !BlocProvider.of<LoginCubit>(context).visiblePassword ? Icons.visibility : Icons.visibility_off ,
                          color: primaryColor,
                        ),
                      ),
                      onChanged: (data) {
                        password = data;
                      },
                      obscureText: BlocProvider.of<LoginCubit>(context).visiblePassword,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                      text: 'Login',
                      onPressed: () {
                        fromKey.currentState!.validate();
                        BlocProvider.of<LoginCubit>(context).loginMethod(email: userName, password: password);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
