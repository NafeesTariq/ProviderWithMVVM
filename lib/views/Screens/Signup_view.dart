import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/components/round_button.dart';
import '../../utils/routes/rotes_named.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_viewmodel.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignupView> {
  ValueNotifier<bool> _obsecuretext = ValueNotifier<bool>(true);
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    _obsecuretext.dispose();
    EmailController.dispose();
    PasswordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    // TODO: implement dispose
  }

  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Sign Up Screen")),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: emailFocusNode,
                onFieldSubmitted: (value) {
                  Utils.FieldFocusChang(
                      context, emailFocusNode, passwordFocusNode);
                },
                keyboardType: TextInputType.emailAddress,
                controller: EmailController,
                decoration: const InputDecoration(
                  label: Text("Email"),
                  hintText: " Enter Email ",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _obsecuretext,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: passwordFocusNode,
                    controller: PasswordController,
                    obscureText: _obsecuretext.value,
                    decoration: InputDecoration(
                        label: Text("Password"),
                        hintText: "Email",
                        prefixIcon: Icon(Icons.lock),
                        suffix: InkWell(
                            onTap: () {
                              _obsecuretext.value = !_obsecuretext.value;
                            },
                            child: _obsecuretext.value
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility))),
                  );
                },
              ),
              SizedBox(
                height: height * .095,
              ),
              RoundButton(
                  title: "Sign Up",
                  loading: authViewMode.SignUploading,
                  onPress: () {
                    if (EmailController.text.isEmpty) {
                      Utils.flushBarErrorMessage("Please Enter Email", context);
                    } else if (PasswordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Please Enter Password", context);
                    } else if (PasswordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          "Please Enter 6 Digit Password", context);
                    } else {
                      Map data = {
                        'email': EmailController.text.toString(),
                        'password': PasswordController.text.toString(),
                      };
                      authViewMode.SignUpApi(data, context);
                      print("Api hit");
                    }
                  }),
              SizedBox(height: height * 0.02),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: Text("Already have an account.... Login")),
            ]),
      ),
    );
  }
}
