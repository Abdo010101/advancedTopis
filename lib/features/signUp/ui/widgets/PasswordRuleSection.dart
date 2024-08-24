import 'package:development/core/helpers/app_regex.dart';
import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:development/features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordRulesSection extends StatefulWidget {
  const PasswordRulesSection({super.key});

  @override
  State<PasswordRulesSection> createState() => _PasswordRulesSectionState();
}

class _PasswordRulesSectionState extends State<PasswordRulesSection> {
  late TextEditingController passwordController;

  bool isUpperCase = false;
  bool isLowerCase = false;
  bool isSpecialCase = false;
  bool isMinNumber = false;
  bool atOneNumber = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    addListenerToPassword();
  }

  void addListenerToPassword() {
    passwordController.addListener(() {
      setState(() {
        isUpperCase = AppRegex.hasUpperCase(passwordController.text);
        isLowerCase = AppRegex.hasLowerCase(passwordController.text);
        isSpecialCase = AppRegex.hasSpecialCharacter(passwordController.text);
        isMinNumber = AppRegex.hasMinLength(passwordController.text);
        atOneNumber = AppRegex.hasNumber(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customValdtionText(text: 'Has Upper Case', isUpperCase),
        verticalSpace(10),
        customValdtionText(text: 'Has Lower Case', isLowerCase),
        verticalSpace(10),
        customValdtionText(text: 'Has Special Char', isSpecialCase),
        verticalSpace(10),
        customValdtionText(text: 'Has Min 8 Lentgt', isMinNumber),
        verticalSpace(10),
        customValdtionText(text: 'Has at least one number', atOneNumber),
        verticalSpace(10),
      ],
    );
  }
}

Widget customValdtionText(
  bool isValid, {
  required String text,
}) {
  return Row(
    children: [
      CircleAvatar(
        radius: 3.w,
        backgroundColor: Colors.black,
      ),
      horizontalSpace(8),
      Text(text,
          style: TextStyles.font12DarkBlueRegular.copyWith(
              height: 1,
              color: isValid ? Colors.green : Colors.grey,
              decoration: isValid ? TextDecoration.lineThrough : null,
              decorationThickness: 1.5)),
    ],
  );
}
