import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable{
  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({
    this.id,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props => [
    id,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content
  ];

  ////
  factory ArticleEntity.fromJson(Map<String, dynamic> map) => ArticleEntity(
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
