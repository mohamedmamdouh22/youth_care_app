import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/logic/change_pass/change_password_cubit.dart';
import 'package:youth_care/presentation/login/login_screen.dart';
import 'package:youth_care/presentation/widgets/custom_button.dart';
import 'package:youth_care/presentation/widgets/custom_text_field.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  static String id = 'changepass';
  String? newPass;
  String? oldPass;
  bool isAsync=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit,ChangePasswordState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is ChangePasswordLoading)
        {
          isAsync=true;
        }
        else if(state is ChangePasswordSuccess)
        {
          showTopSnackBar(
                context, const CustomSnackBar.success(message: 'Changed Successfully'));
          // BlocProvider.of<NewsCubit>(context).getNews()
         Navigator.pop(context);
          isAsync=false;
        }
        else if(state is ChangePasswordFailure)
        {
           showTopSnackBar(
                context, CustomSnackBar.error(message: state.errormsg));
          isAsync=false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isAsync,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Change Password'),
              backgroundColor: primaryColor,
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  CustomFormTextField(
                    hint: 'new password',
                    onChanged: (val) {
                      newPass = val;
                    },
                  ),
 
                  CustomButton(
                    text: 'Submit',
                    onPressed: () {

                      BlocProvider.of<ChangePasswordCubit>(context).ChangePassword(newPass: newPass!);
                      
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
