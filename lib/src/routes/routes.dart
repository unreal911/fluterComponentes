import 'package:flutter/material.dart';
import 'package:pr1/src/pages/alert_page.dart';
import 'package:pr1/src/pages/animated_container.dart';
import 'package:pr1/src/pages/avatar_page.dart';
import 'package:pr1/src/pages/card_pages.dart';
import 'package:pr1/src/pages/home_page.dart';
import 'package:pr1/src/pages/input_page.dart';
import 'package:pr1/src/pages/listview_page.dart';
import 'package:pr1/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getAppLocationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'animatedContainer': (BuildContext context) =>
        const AnimatedContainerPage(),
    'inputs': (BuildContext context) => const InputPage(),
    'slider': (BuildContext context) => const SliderPage(),
    'list': (BuildContext context) => const ListaPage(),
  };
}
