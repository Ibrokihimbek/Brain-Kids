import 'package:flutter/material.dart';
import 'package:kids_brain/screens/home_page.dart';
import 'package:kids_brain/screens/login_page.dart';
import 'package:kids_brain/screens/questions_screens/arabic_question_page.dart';
import 'package:kids_brain/screens/questions_screens/english_question_page.dart';
import 'package:kids_brain/screens/questions_screens/mathematic_question_page.dart';
import 'package:kids_brain/screens/questions_screens/russian_question_page.dart';
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
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RoutName.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutName.english:
        return MaterialPageRoute(builder: (_) => EnglishQuestionPage());
      case RoutName.arabic:
        return MaterialPageRoute(builder: (_) => ArabicQuestionPage());
      case RoutName.russian:
        return MaterialPageRoute(builder: (_) => RussianQuestionPage());
      case RoutName.mathematic:
        return MaterialPageRoute(builder: (_) => MathematicQuestionPage());
      case RoutName.home:
        return MaterialPageRoute(builder: (_) => HomePage());

      // case RoutName.successPayment:
      //   return MaterialPageRoute(builder: (_) => SuccesPaymentPage());
      // case RoutName.productInfo:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (_) => ProductInfoPage(
      //       productInfo: args['productInfo'],
      //     ),
      //   );
      // case RoutName.search:
      //   return MaterialPageRoute(builder: (_) => SearchPage());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
