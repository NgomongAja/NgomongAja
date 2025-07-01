import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/pages/onboarding/presentation/onboarding_presenter.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final OnboardingPresenter presenter = Get.put(OnboardingPresenter());

  Widget pageOne() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("lib/assets/images/onboarding1.png"),
          SizedBox(height: 24),
          Text(
            "NGOMONG BEBAS TANPA NAMA",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          SizedBox(height: 24),
          Text(
            "NgomongAja adalah tempat anonim buat kamu curhat, cerita, atau sekadar ngeluh tanpa profil, tanpa jejak.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget pageTwo() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("lib/assets/images/onboarding2.png"),
          SizedBox(height: 24),
          Text(
            "Thread akan hilang otomatis",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          SizedBox(height: 24),
          Text(
            "Semua thread bakal auto-delete dalam 7 hari. Jadi, kamu bebas cerita tanpa takut disimpan selamanya.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget pageThree() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("lib/assets/images/onboarding3.png"),
          SizedBox(height: 24),
          Text(
            "DM orang secara anonim",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          SizedBox(height: 24),
          Text(
            "Kamu bisa ngobrol langsung lewat DM tanpa harus tahu siapa dia. Yang penting nyambung!",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              presenter.gotoHome();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              minimumSize: Size(200, 50),
            ),
            child: Text("Get Started", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildDots(int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(presenter.totalPages, (index) {
        bool isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: isActive ? 16 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: isActive
                ? Colors.deepPurple
                : Colors.deepPurple.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: presenter.pageController,
            children: [pageOne(), pageTwo(), pageThree()],
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Obx(() => _buildDots(presenter.currentPage.value)),
          ),
        ],
      ),
    );
  }
}
