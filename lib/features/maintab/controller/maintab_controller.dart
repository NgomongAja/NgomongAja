import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainTabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var currentIndex = 0.obs;

  final List<String> tabList = ['Trending', 'Recent', 'Likes', 'Message'];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabList.length, vsync: this);
    currentIndex.value = tabController.index;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void changeTab(int index) {
    currentIndex.value = index;
    tabController.animateTo(index);
  }
}
