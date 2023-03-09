import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mvvm_project/resources/components/countrypicker.dart';
import 'package:mvvm_project/resources/components/loginbutton.dart';
import 'package:mvvm_project/resources/components/round_button.dart';
import 'package:provider/provider.dart';
import 'package:country_picker/country_picker.dart';
import '../../view_model/auth_viewmodel.dart';
import 'package:country_picker/country_picker.dart';

class OtpLogin extends StatefulWidget {
  const OtpLogin({super.key});

  @override
  State<OtpLogin> createState() => _OtpLoginState();
}

class _OtpLoginState extends State<OtpLogin> {
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

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      HexColor("c9daaa"),
                      HexColor("71b2ac"),
                      // Color.fromARGB(0, 41, 230, 98),
                    ],
                  )),
                ),
                Positioned(
                  left: width * .6,
                  bottom: height * .75,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      "assets/images/shoes.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 480,
                  child: SizedBox(
                    height: 250,
                    width: 200,
                    child: Image.asset(
                      "assets/images/shirts.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Positioned(
                  left: width * .5,
                  bottom: height * .45,
                  child: Container(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        "assets/images/trouser.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: width * 1,
                  top: height * .62,
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: height * 0.25,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.red,
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ]),
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: IntlPhoneField(
                                      decoration: InputDecoration(
                                        labelText: 'Phone Number',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                        ),
                                      ),
                                      initialCountryCode: 'IN',
                                      onChanged: (phone) {
                                        print(phone.completeNumber);
                                      },
                                    )),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Text("Login"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
