

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youth_care/widgets/custom_button.dart';
import 'package:youth_care/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String id='loginscreen';
  String? userName;
   String? password;
  GlobalKey<FormState> fromKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: fromKey,
          child: ListView(
            children: [
              SizedBox(height: 50,),
              Image.asset('images/logo.jfif',
                height: 220,

              ),
              SizedBox(height: 40,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Color(0xff3f5061)),
                ),
              ),
              SizedBox(height: 20,),
             CustomFormTextField(hint: 'User Name',onChanged:(data){
               userName=data;
             },),

              CustomFormTextField(hint: 'Password',
                icon: IconButton(onPressed: (){},icon: Icon(Icons.visibility_off,color: Color(0xff3f5061),),),
                onChanged:(data){
                password=data;
              },
                obscureText: true,
              ),
              SizedBox(height: 40,),
              
              CustomButton(text: 'Login',
              onPressed: (){
                fromKey.currentState!.validate();

              },
              ),



            ],
          ),
        ),
      ),
    );
  }
}