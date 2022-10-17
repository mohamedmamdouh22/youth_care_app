part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsSuccess extends NewsState {
  List<NewsModel> newsList;
  NewsSuccess({required this.newsList});
}

class ImageSelected extends NewsState {
  String name;

  File file;
  ImageSelected({
    required this.name,
    required this.file,
  });
}

class ReadyToPublish extends NewsState {}

class Publishing extends NewsState {}

class PublishedSuccessfully extends NewsState {}
