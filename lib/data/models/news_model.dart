class NewsModel {
  final String title;
  final String time;
  final String des;
  final String image;
  NewsModel(
      {required this.title,
      required this.time,
      required this.des,
      required this.image});
  factory NewsModel.fromJson(jsonData) {
    return NewsModel(
      title:jsonData['title'],
    des:  jsonData['description'],
     image: jsonData['image'],
     time :jsonData['time']
    );
  }
}
