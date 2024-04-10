import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity{
  const ArticleModel({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    author : json['author'] ?? 'null',
    title : json['title'].toString() ?? 'null',
    description : json['description'] ?? 'null',
    url : json['url'] ?? 'null',
    urlToImage : json['urlToImage'] ?? 'null',
    publishedAt : json['publishedAt'] ?? 'null',
    content : json['content'] ?? 'null',
  );

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content
    );
  }
}


