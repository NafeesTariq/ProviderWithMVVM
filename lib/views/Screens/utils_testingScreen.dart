import 'package:flutter/material.dart';
import 'package:mvvm_project/utils/routes/rotes_named.dart';
import 'package:mvvm_project/views/Screens/HomeScreen_view.dart';

import '../../utils/utils.dart';

class UtilsTestingScreen extends StatefulWidget {
  const UtilsTestingScreen({super.key});

  @override
  State<UtilsTestingScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<UtilsTestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                //********Conventional Method **********/
                //Navigator.push(context,MaterialPageRoute(builder: (context) => HpomeScreen()));
                Navigator.pushNamed(context, RoutesName.home);
              },
              child: Center(child: Text("Click")),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Utils.toastMessage("Toast Message");
              },
              child: Center(child: Text("Click For Toast")),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Utils.flushBarErrorMessage("FlushBar Message", context);
              },
              child: Center(child: Text("Click For FlushBar")),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Utils.SnakBar("SnackBar Message", context);
              },
              child: Center(child: Text("Click For Snackbar")),
            ),
          ]),
    );
  }
}
