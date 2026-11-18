
import 'package:ulangan_ahmadkenziejavasniscala/Menu/home_menu.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Page/detailmakanan_page.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Page/mainmenu_page.dart';
import 'package:ulangan_ahmadkenziejavasniscala/test.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Page/login_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Routes {
  static const String login = "/login";
  static const String home = "/home";
  static const String feat = "/feat";
  static const String profile = "/profile";
  static const String detailmakanan = "/detailmakanan";
  static const String mainmenu = "/mainmenu";


static final myPages = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: home, page: () => HomeMenu()),
    GetPage(name: detailmakanan, page: () => DetailmakananPage()),
    GetPage(name: mainmenu, page: () => MainMenuPage()),


  ];
}