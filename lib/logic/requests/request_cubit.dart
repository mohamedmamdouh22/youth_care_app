import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitial());
  String dep = 'القسم', stdferka = 'الفرقة';

  Future<void> appendRequest(
      {required String name,
      required String nat_id,
      required String stdemail,
      required String phone,
      required String dep,
      required String ferka}) async {
    emit(RequestLoading());
    CollectionReference requestCollection =
        FirebaseFirestore.instance.collection('takefuls');
    await requestCollection
        .add({
          'name': name,
          'natId': nat_id,
          'email': stdemail,
          'phone': phone,
          'depart': dep,
          'ferka': ferka,
          'requestOn': DateTime.now(),
        })
        .then((value) => emit(RequestSuccess()))
        .catchError((error) => emit(RequestFailure(
            errMessage: 'Something Wrong Within Adding Request')));
  }

  void setDepartement(String choice) {
    dep = choice;
    emit(RequestDepSetter());
  }

  void setFerka(String choice) {
    stdferka = choice;
    emit(RequestFerkaSetter());
  }
}
