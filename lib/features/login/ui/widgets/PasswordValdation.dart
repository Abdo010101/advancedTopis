import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/style.dart';
import 'package:flutter/material.dart';

class PasswordValdation extends StatelessWidget {
  const PasswordValdation(
      {super.key,
      required this.hasOneUpperCase,
      required this.hasOneLowerCase,
      required this.hasOneSpecialChars,
      required this.hasMinLength,
      required this.hasOneNumber});
  final bool hasOneUpperCase;
  final bool hasOneLowerCase;
  final bool hasOneSpecialChars;
  final bool hasMinLength;
  final bool hasOneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        makeValdationOnRow('has 1 one Upper case Letter ', hasOneUpperCase),
        verticalSpace(5),
        makeValdationOnRow('has 1 one Lower case Letter ', hasOneLowerCase),
        verticalSpace(5),
        makeValdationOnRow('has 1 Special Char Letter ', hasOneSpecialChars),
        verticalSpace(5),
        makeValdationOnRow('has 1 one Number ', hasOneNumber),
        verticalSpace(5),
        makeValdationOnRow('has Min length 8 ', hasMinLength),
      ],
    );
  }
}

Widget makeValdationOnRow(String message, bool hasValidated) {
  return Row(
    children: [
      CircleAvatar(
        radius: 3,
        backgroundColor: Colors.black,
      ),
      horizontalSpace(12),
      Text(
        message,
        style: TextStyles.font13BlueSemiBold.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationThickness: 2,
            decorationColor: Colors.green,
            color: hasValidated ? Colors.green : Colors.black),
      ),
    ],
  );


  
}
