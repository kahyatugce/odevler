import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_add_bloc/article_add_event.dart';
import 'package:miniblog/blocs/article_add_bloc/article_add_state.dart';
import 'package:miniblog/repositories/article_repository.dart';

class ArticleAddBloc extends Bloc<ArticleAddEvent, ArticleAddState> {
  final ArticleRepository articleRepository;
  ArticleAddBloc({required this.articleRepository})
      : super(ArticleAddInitial()) {
    on<SubmitArticleAddEvent>(_onSubmitArticleAdd);
    on<ResetFetchArticleAdd>(_onReset);
  }

  void _onSubmitArticleAdd(
      SubmitArticleAddEvent event, Emitter<ArticleAddState> emit) async {
    emit((ArticleAddLoading()));
    final gonder = await articleRepository.submit(
        event.selectedImage, event.title, event.content, event.author);
    emit(ArticleAddLoaded());
  }

  void _onReset(
      ResetFetchArticleAdd event, Emitter<ArticleAddState> emit) async {
    emit(ArticleAddInitial());
  }
}
