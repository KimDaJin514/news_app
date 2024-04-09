import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/use_cases/get_article_use_case.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()){
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async{
    final DataState<List<ArticleEntity>> dataSate = await _getArticleUseCase();

    switch(dataSate) {
      case DataSuccess<List<ArticleEntity>>():
        emit(RemoteArticlesDone(dataSate.data));
      case DataFailed<List<ArticleEntity>>():
        emit(RemoteArticlesError(dataSate.error!));
    }
  }
}