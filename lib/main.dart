import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'app_router.dart';
import 'core/services/local_storage_service.dart';
import 'features/cupit/splash_cupit.dart';
import 'features/view_models/theme_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();

  runApp(
    BlocProvider(
      create: (_) => SplashCubit(),
      child: PowerPuff(),
    ),
  );
}

class PowerPuff extends StatelessWidget {
  const PowerPuff({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeViewModel themeViewModel = Get.put(ThemeViewModel());
    return Obx(() => GetMaterialApp(
      theme: themeViewModel.currentTheme.value,
      getPages: AppRouter.routes,
      debugShowCheckedModeBanner: false,
    ));
  }
}
