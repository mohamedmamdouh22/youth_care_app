part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsSuccess extends NewsState {
  List<NewsModel> newsList;
  NewsSuccess({required this.newsList});

}
