import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repository.dart';
import 'package:news_app/features/daily_news/domain/use_cases/get_article_use_case.dart';

import 'get_article_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ArticleRepository>()])
void main() {
  late GetArticleUseCase useCase;
  late MockArticleRepository mockArticleRepository;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
    // useCase = GetArticleUseCase(mockArticleRepository);

    useCase = GetArticleUseCase(FakeRepo());
  });

  test('should get news articles from the repository', () async {
    final List<ArticleEntity> tArticleList = [
      const ArticleEntity(
        id: "the-times-of-india",
        author: 'a',
        title: 't',
        description: 'd',
        url: 'u',
        urlToImage: 'i',
        publishedAt: '1',
        content: 'd',
      ),
      const ArticleEntity(
        id: "the-times-of-india",
        author: 'a',
        title: 't',
        description: 'd',
        url: 'u',
        urlToImage: 'i',
        publishedAt: '1',
        content: 'd',
      ),
    ];

    // // Stubbing the method call and providing a dummy value
    // when(mockArticleRepository.getNewsArticles())
    //     .thenAnswer((_) async => DataState.success(tArticleList));

    // Executing the useCase
    final result = await useCase();

    // Verifying the result type
    expect(result, isA<DataState<List<ArticleEntity>>>());
    //
    // // Verifying the result value
    expect((result as DataSuccess<List<ArticleEntity>>).data.first.id, '1');
    expect(result.data, fakeJson.map((e) => ArticleEntity.fromJson(e)).toList());

  });
}

class FakeRepo implements ArticleRepository{
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async{
    return DataState.success(fakeJson.map((e) => ArticleEntity.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": "1",
    "author": "Kathi Kruse",
    "title": "Here’s Why the Dealership Franchise Model is Here to Stay",
    "description": "I am an observer. I like to explore and examine certain trends and follow my instincts where they take me. When I was a CFO at dealerships, this kept the organization one or more steps ahead of the competition. I’m still practicing it and writing posts like t…",
    "url": "https://www.krusecontrolinc.com/heres-why-the-dealership-franchise-model-is-here-to-stay/",
    "urlToImage": "https://www.krusecontrolinc.com/wp-content/uploads/2024/04/Car-in-showroom-editorial-license-only-scaled.jpg",
    "publishedAt": "2024-04-09T01:04:19Z",
    "content": "I am an observer. I like to explore and examine certain trends and follow my instincts where they take me. When I was a CFO at dealerships, this kept the organization one or more steps ahead of the c… [+8935 chars]"
  },
  {
    "id": "2",
    "author": "Kathi Kruse",
    "title": "Here’s Why the Dealership Franchise Model is Here to Stay",
    "description": "I am an observer. I like to explore and examine certain trends and follow my instincts where they take me. When I was a CFO at dealerships, this kept the organization one or more steps ahead of the competition. I’m still practicing it and writing posts like t…",
    "url": "https://www.krusecontrolinc.com/heres-why-the-dealership-franchise-model-is-here-to-stay/",
    "urlToImage": "https://www.krusecontrolinc.com/wp-content/uploads/2024/04/Car-in-showroom-editorial-license-only-scaled.jpg",
    "publishedAt": "2024-04-09T01:04:19Z",
    "content": "I am an observer. I like to explore and examine certain trends and follow my instincts where they take me. When I was a CFO at dealerships, this kept the organization one or more steps ahead of the c… [+8935 chars]"
  },
];
