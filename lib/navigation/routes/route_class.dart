import 'package:belajar_flutter_get_x/navigation/pages/page1.dart';
import 'package:belajar_flutter_get_x/navigation/pages/page2.dart';
import 'package:belajar_flutter_get_x/navigation/pages/page3.dart';
import 'package:belajar_flutter_get_x/navigation/pages/page4.dart';
import 'package:belajar_flutter_get_x/navigation/pages/page5.dart';
import 'package:belajar_flutter_get_x/navigation/routes/route_name.dart';
import 'package:get/get.dart';

class RouteClass {
  static final routes = [
    GetPage(name: "/page1", page: () => Page1()),
    GetPage(name: "/page2", page: () => Page2()),
    GetPage(name: "/page3", page: () => Page3()),
    GetPage(name: "/page4", page: () => Page4()),
    GetPage(name: RouteNameNavigation.page5, page: () => Page5()),
  ];
}
