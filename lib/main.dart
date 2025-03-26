import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'src/core/network_structure/http_service/http_service.dart';
import 'src/features/users/presentation/pages/users_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpService.instance.init(client: http.Client());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        child = GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Task',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const UsersPage(),
          // MyBankExamPage(),
        );
        return child;
      },
    );
  }
}
