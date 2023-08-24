import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/utils/routes/Routes.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // home:Text('Asim'),
          initialRoute: RouteManager.getLoginScreen(),
          getPages: RouteManager.routeList,
        );
      },
    );
  }
}
