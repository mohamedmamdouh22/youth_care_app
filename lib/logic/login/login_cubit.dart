import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool visiblePassword = true;

    void changePasswordVisibility(){
      visiblePassword = !visiblePassword;
      emit(PasswordVisibilityState());
    }
  Future<void> loginMethod({required email,required password}) async {
    emit(LoginLoading());
    try {
  final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password
  );
  emit(LoginSuccess());
}on FirebaseAuthException catch (e) {
    
       if (e.code == 'user-not-found') { 
            emit(LoginFailure(errMessage: 'user not found'));
             } else if (e.code == 'wrong-password') {
            emit(LoginFailure(errMessage: 'wrong password'));
            }
    }catch (e) {
      emit(LoginFailure(errMessage: 'something went wrong'));
    }
  }
}
