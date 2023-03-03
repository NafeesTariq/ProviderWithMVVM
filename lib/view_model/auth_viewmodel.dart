import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/utils/routes/rotes_named.dart';
import 'package:mvvm_project/utils/utils.dart';

import '../repo/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUploading = false;
  bool get SignUploading => _signUploading;
  setsignUpLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _myrepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage("Login Successful", context);
      Navigator.pushNamed(context, RoutesName.home);

      if (kDebugMode) {
        print(
          value.toString(),
        );
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        setLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setsignUpLoading(true);
    _myrepo.SignUpApi(data).then((value) {
      setsignUpLoading(false);
      Utils.flushBarErrorMessage("Sign Up Successful", context);
      print("Signup Successful");
      //Navigator.pushNamed(context, RoutesName.home);

      if (kDebugMode) {
        print(
          value.toString(),
        );
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        setsignUpLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
