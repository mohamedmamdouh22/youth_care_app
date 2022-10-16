import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:youth_care/data/models/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  List<NewsModel> newsList=[];
  NewsCubit() : super(NewsInitial());
    CollectionReference news =
      FirebaseFirestore.instance.collection('news');
  void getNews()
  {
    try {
  news.orderBy('time').snapshots().listen((event) {
    newsList.clear();
    for (var doc in event.docs) {
      print(doc);
      newsList.add(NewsModel.fromJson(doc));
    }
    
    emit(NewsSuccess(newsList: newsList));
  });
} on Exception catch (e) {
  // TODO
  print('fail to load');
}
  }
}
