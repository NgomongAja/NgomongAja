import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/features/maintab/maintab.dart';

class OnboardingPresenter extends GetxController {
  final pageController = PageController();

  var currentPage = 0.obs;

  final int totalPages = 3;

  @override
  void onInit() {
    super.onInit();

    pageController.addListener(() {
      int page = pageController.page?.round() ?? 0;
      if (currentPage.value != page) {
        currentPage.value = page;
      }
    });
  }

  void goToNextPage() {
    if (currentPage.value < totalPages - 1) {
      pageController.animateToPage(
        currentPage.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPreviousPage() {
    if (currentPage.value > 0) {
      pageController.animateToPage(
        currentPage.value - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void gotoHome() {
    Get.off(MainTabBar());
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
