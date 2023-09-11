import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_mvvm/widgets/constants.dart';

class TextFieldWideget extends StatelessWidget {
  final TextEditingController controller;
  // final Widget icon;
  final Widget iconData;
  final Widget? suffixIcon;
  final bool? numberField;
  final bool obscureText;
  final String hint;
  const TextFieldWideget({
    super.key,
    required this.iconData,
    required this.hint,
    this.numberField,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.kwhiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGreeyColor.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 2,
            offset: const Offset(
              5,
              7,
            ),
          )
        ],
      ),
      child: Center(
          child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: iconData,
            ),
          ),
          if (numberField == true)
            Container(
              padding: const EdgeInsets.all(5),
              child: const Row(
                children: [
                  Text("+ 91"),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                hintText: hint,
                filled: true,
                fillColor: AppColors.kwhiteColor,
                hintStyle:
                    TextStyle(color: AppColors.kGreeyColor.withOpacity(0.7)),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
