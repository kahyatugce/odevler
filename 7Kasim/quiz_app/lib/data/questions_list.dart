import 'package:quiz_app/model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel("Aşağıdakilerden hangisi bir widget türüdür?", {
    "Stateful": true,
    "Constructor": false,
    "Class": false,
    "Const": false,
  }),
  QuestionModel("Flutter nedir?", {
    "Bir yazılım dili": false,
    "Bir mobil uygulama geliştirme çerçevesi": true,
    "Bir işletim sistemi": false,
  }),
  QuestionModel(
      "Flutter'ın hangi programlama dillerini kullanarak geliştirildiği?", {
    "Dart": true,
    "JavaScript": false,
    "Bir işletim sistemi": false,
    "Python": false
  }),
  QuestionModel("Flutter, hangi platformlarda kullanılabilir?", {
    "Yalnızca Android": false,
    "Hem Android hem iOS": true,
    "Yalnızca iOS": false,
  }),
  QuestionModel("Flutter'da arayüz geliştirmek için kullanılan kavram nedir?", {
    "Widget": true,
    "Modül": false,
    "Sınıf": false,
  }),
  QuestionModel("Flutter, hangi geliştirme modelini kullanır?",
      {"Reactive": true, "Proactive": false, "Passive": false}),
  QuestionModel("Flutter'da kullanılan özgün bir dil nedir?", {
    "JavaScript ": false,
    " Dart ": true,
    "Java ": false,
  }),
  QuestionModel("Flutter uygulamaları nasıl derlenir?", {
    " Native derleyici ile": false,
    " JIT derleyici ile": false,
    " AOT derleyici ile": true,
  }),
  QuestionModel(
      "Flutter'da veri yönetimi için yaygın olarak kullanılan paket hangisidir?",
      {
        " Retrofit": false,
        "Redux ": true,
        "Axios ": false,
      }),
  QuestionModel("Flutter'da Hot Reload ne işe yarar?", {
    "Uygulama yüklemesi ": false,
    "Kod değişikliklerinin anında uygulanması ": true,
    " Veri tabanı güncellemesi ": false,
  }),
  QuestionModel(
      "Flutter'ın geliştirme için kullanılan entegre geliştirme ortamı (IDE) hangisidir?",
      {
        "Android Studio ": true,
        "Visual Studio Code": false,
        " Xcode": false,
      }),
      
];
