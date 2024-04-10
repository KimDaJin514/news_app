import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract interface class ArticleRepository {
  // Api methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();
  Future<void> saveArticles(ArticleEntity article);
  Future<void> removeArticles(ArticleEntity article);

}