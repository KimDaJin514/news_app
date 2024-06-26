import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/use_cases/get_saved_article_use_case.dart';
import 'package:news_app/features/daily_news/domain/use_cases/remove_article_use_case.dart';
import 'package:news_app/features/daily_news/domain/use_cases/save_article_use_case.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticlesLoading()){

    on<GetSavedArticles> (onGetSavedArticles);
    on<RemoveArticle> (onRemoveArticles);
    on<SaveArticle> (onSaveArticles);
  }

  void onGetSavedArticles(GetSavedArticles event, Emitter<LocalArticleState> emit) async{
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticles(RemoveArticle removeArticle, Emitter<LocalArticleState> emit) async{
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticles(SaveArticle saveArticle, Emitter<LocalArticleState> emit) async{
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
