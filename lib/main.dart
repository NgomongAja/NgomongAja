import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/common/config/supabase.dart';
import 'package:pengen_chat/common/presenter/app_presenter.dart';
import 'package:pengen_chat/features/onboarding/presentation/onboarding_view.dart';
import 'features/maintab/maintab.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.instance.initialization();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appPresenter = Get.put(AppPresenter());

    return Obx(() {
      return GetMaterialApp(
        title: 'Pengen Chat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: appPresenter.isLoggedIn.value ? MainTabBar() : OnboardingView(),
      );
    });
  }
}
