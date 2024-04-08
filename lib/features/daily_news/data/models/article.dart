import 'package:news_app/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    String? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  factory ArticleModel.fromJson(Map<dynamic, String> map) => ArticleModel(
      id : map['id'] ?? '',
      author : map['author'],
      title : map['title'],
      description : map['description'],
      url : map['url'],
      urlToImage : map['urlToImage'],
      publishedAt : map['publishedAt'],
      content : map['content'],
    );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
