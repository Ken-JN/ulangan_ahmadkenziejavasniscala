import 'package:flutter/material.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Menu/feat_menu.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Menu/home_menu.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Menu/profile_menu.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> listPages = [
    HomeMenu(),
    FeatMenu(),
    ProfileMenu(),
  ];
}