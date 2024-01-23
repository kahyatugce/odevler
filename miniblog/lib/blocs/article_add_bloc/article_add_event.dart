import 'package:image_picker/image_picker.dart';

abstract class ArticleAddEvent {}

class SubmitArticleAddEvent extends ArticleAddEvent {
  final XFile? selectedImage;
  final String title;
  final String content;
  final String author;

  SubmitArticleAddEvent(
      {required this.selectedImage,
      required this.title,
      required this.content,
      required this.author});
}

//ekleme kısmı reset gerektirebilir
class ResetFetchArticleAdd extends ArticleAddEvent {}
