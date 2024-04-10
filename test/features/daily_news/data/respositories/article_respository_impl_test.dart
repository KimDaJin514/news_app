import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:retrofit/dio.dart';

import 'article_respository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NewsApiService>()])
void main(){
  late MockNewsApiService mockNewsApiService;
  late ArticleRepositoryImpl repositoryImpl;

  setUp(() {
    mockNewsApiService = MockNewsApiService();
    repositoryImpl = ArticleRepositoryImpl(mockNewsApiService);
  });

  final List<ArticleEntity> tArticleList = [
    const ArticleEntity(
      id: 1,
      author: 'a',
      title: 't',
      description: 'd',
      url: 'u',
      urlToImage: 'i',
      publishedAt: '1',
      content: 'd',
    ),
    const ArticleEntity(
      id: 2,
      author: 'a',
      title: 't',
      description: 'd',
      url: 'u',
      urlToImage: 'i',
      publishedAt: '1',
      content: 'd',
    ),
  ];

  test('description', () {
    // when(mockNewsApiService.getNewsArticles()).thenAnswer((_) async => HttpResponse(data, ));

  });
}