import 'package:development/core/widgets/app_text_form_filed.dart';
import 'package:development/features/login/ui/widgets/password_valdiation.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              // if (value == null ||
              //     value.isEmpty ||
              //     !AppRegex.isEmailValid(value)) {
              //   return 'Please enter a valid email';
              // }
            },
            //    controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            //    controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            // isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
          // PasswordValidations(
          //   hasLowerCase: hasLowercase,
          //   hasUpperCase: hasUppercase,
          //   hasSpecialCharacters: hasSpecialCharacters,
          //   hasNumber: hasNumber,
          //   hasMinLength: hasMinLength,
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
