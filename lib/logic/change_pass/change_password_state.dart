part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}
class ChangePasswordLoading extends ChangePasswordState {}
class ChangePasswordSuccess extends ChangePasswordState {}
class ChangePasswordFailure extends ChangePasswordState {
  String errormsg;
  ChangePasswordFailure({required this.errormsg});
}
