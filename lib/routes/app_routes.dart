import 'package:flutter/material.dart';
import 'package:application8/presentation/enter_card_details_screen/enter_card_details_screen.dart';

class AppRoutes {
  static const String enterCardDetailsScreen = '/enter_card_details_screen';

  static Map<String, WidgetBuilder> routes = {
    enterCardDetailsScreen: (context) => EnterCardDetailsScreen()
  };
}
