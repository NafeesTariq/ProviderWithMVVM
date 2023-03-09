import 'package:flutter/material.dart';
import 'package:mvvm_project/repo/auth_repository.dart';
import 'package:mvvm_project/resources/components/countrypicker.dart';
import 'package:mvvm_project/utils/routes/rotes_named.dart';
import 'package:mvvm_project/utils/routes/routes.dart';
import 'package:mvvm_project/view_model/auth_viewmodel.dart';

import 'package:mvvm_project/views/Screens/otpLogin.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.

          primarySwatch: Colors.blue,
        ),
        home: OtpLogin(),
        // initialRoute: RoutesName.login,
        // onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
