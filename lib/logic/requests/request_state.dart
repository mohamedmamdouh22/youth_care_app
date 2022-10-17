part of 'request_cubit.dart';


abstract class RequestState {}

class RequestInitial extends RequestState {}
class RequestLoading extends RequestState {}
class RequestSuccess extends RequestState {}
class RequestFailure extends RequestState {
  String errMessage;
  RequestFailure({required this.errMessage});
}
class RequestDepSetter extends RequestState{}
class RequestFerkaSetter extends RequestState{}