import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CountrycodePicker extends StatefulWidget {
  const CountrycodePicker({super.key});

  @override
  State<CountrycodePicker> createState() => _CountrycodePickerwidgetState();
}

class _CountrycodePickerwidgetState extends State<CountrycodePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
                  // labelText: 'Phone Number',
                  ),
              initialCountryCode: 'PK',
            ),
          )),
    ));
  }
}
