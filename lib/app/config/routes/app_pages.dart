import 'package:adi_quiz/app/config/routes/app_routes.dart';
import 'package:adi_quiz/presentation/get/bindings/home/home_binding.dart';
import 'package:adi_quiz/presentation/get/bindings/quiz/quiz_binding.dart';
import 'package:adi_quiz/presentation/get/bindings/result/result_binding.dart';
import 'package:adi_quiz/presentation/get/bindings/topic/topic_binding.dart';
import 'package:adi_quiz/presentation/ui/pages/home/home_page.dart';
import 'package:adi_quiz/presentation/ui/pages/quiz/quiz_page.dart';
import 'package:adi_quiz/presentation/ui/pages/result/result_page.dart';
import 'package:adi_quiz/presentation/ui/pages/topic/topic_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.topic,
      page: () => TopicPage(),
      binding: TopicBinding(),
    ),
    GetPage(
      name: AppRoutes.quiz,
      page: () => QuizPage(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: AppRoutes.result,
      page: () => ResultPage(),
      binding: ResultBinding(),
    ),
  ];
}
