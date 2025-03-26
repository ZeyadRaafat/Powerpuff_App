import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(PowerPuff());
}



class PowerPuff extends StatelessWidget {
  const PowerPuff({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
