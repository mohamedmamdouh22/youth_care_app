import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  final user = FirebaseAuth.instance.currentUser;
  void ChangePassword({required String newPass}) async
  {
    emit(ChangePasswordLoading());
    try{
      await user?.updatePassword(newPass);
      emit(ChangePasswordSuccess());
    }catch(e){
      emit(ChangePasswordFailure(errormsg: e.toString()));
    }

  }
}
