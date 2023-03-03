import 'package:flutter/material.dart';

import '../color.dart';

class RoundButton extends StatelessWidget {
  //params
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.ButtonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: loading
            ? CircleAvatar()
            : Center(
                child: loading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        title,
                        style: TextStyle(color: AppColors.WhiteColor),
                      ),
              ),
      ),
    );
  }
}
