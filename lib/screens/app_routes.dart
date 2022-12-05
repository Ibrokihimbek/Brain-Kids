import 'package:flutter/material.dart';
import 'package:kids_brain/screens/home_page.dart';
import 'package:kids_brain/screens/login_page.dart';
import 'package:kids_brain/screens/questions_screens/arabic/arabic_question_page.dart';
import 'package:kids_brain/screens/questions_screens/english/english_question_page.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/arthimetic/arthimetik_page.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/arthimetic/math_exercise/math_exercises_page.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/mathematic_question_page.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/numbers/category_numbers/category_number_page.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/numbers/numbers_page.dart';
import 'package:kids_brain/screens/questions_screens/russian/russian_question_page.dart';
import 'package:kids_brain/screens/splash_page.dart';

abstract class RoutName {
  static const splash = 'splash';
  static const login = 'login';
  static const english = 'english';
  static const arabic = 'arabic';
  static const russian = 'russian';
  static const mathematic = 'mathematic';
  static const productInfo = 'productInfo';
  static const home = 'home';
  static const checkout = 'checkout';
  static const successPayment = 'successPayment';
  static const profile = 'profile';
  static const numbers = 'numbers';
  static const numbersCategory = 'numbersCategory';
  static const arthimetik = 'arthimetik';
  static const mathCategory = 'mathCategory';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RoutName.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutName.english:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => EnglishQuestionPage(
            english: args['englishAlphabet'],
          ),
        );
      case RoutName.arabic:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ArabicQuestionPage(
            arabic: args['arabicAlphabet'],
          ),
        );
      case RoutName.russian:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => RussianQuestionPage(
            russian: args['russianAlphabet'],
          ),
        );
      case RoutName.mathematic:
        return MaterialPageRoute(builder: (_) => MathematicQuestionPage());
      case RoutName.arthimetik:
        return MaterialPageRoute(builder: (_) => ArthimetikPage());
      case RoutName.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutName.numbers:
        return MaterialPageRoute(builder: (_) => NumberPage());
        case RoutName.mathCategory:
        return MaterialPageRoute(builder: (_) => MathExercisesPage());
      case RoutName.numbersCategory:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => NumbersCategoryPage(
            numbers: args['numbers'],
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
