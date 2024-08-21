import 'dart:developer';

import 'package:development/core/helpers/app_regex.dart';
import 'package:development/core/routing/app_router.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/core/widgets/app_text_button.dart';
import 'package:development/core/widgets/app_text_form_filed.dart';
import 'package:development/features/login/data/models/login_request_body.dart';
import 'package:development/features/login/logic/login_cubit.dart';
import 'package:development/features/login/ui/widgets/PasswordValdation.dart';
import 'package:development/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';

class EmailAndPassword extends StatefulWidget {
  EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordController;
  bool isObscure = true;
  bool hasOneNumber = false;
  bool hasUpperlLetter = false;
  bool hasMinLength = false;
  bool hasSpecialLetter = false;
  bool hasSmallLetter = false;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpListenerToPasswordField();
  }

  //**** we listen on passwrod to validate the rules*************** */

  setUpListenerToPasswordField() {
    passwordController.addListener(() {
      setState(() {
        hasUpperlLetter = AppRegex.hasUpperCase(passwordController.text);
        hasSmallLetter = AppRegex.hasLowerCase(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
        hasSpecialLetter =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasOneNumber = AppRegex.hasNumber(passwordController.text);
      });
    });
  }

  ///******************************************************************************* */
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return context.read<LoginCubit>().errorMessages['email'] ??
                    'the passowrd must not empty';
              }
              return null;
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(30),
          AppTextFormField(
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return 'the password must not empty';
              } else {
                return null;
              }
            },
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'password',
            obstureText: isObscure,
            pefixIcon: GestureDetector(
                onTap: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                child:
                    Icon(isObscure ? Icons.visibility_off : Icons.visibility)),
          ),
          verticalSpace(24),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              'Forget Passowrd!',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
          verticalSpace(24),
          AppTextButton(
              buttonText: 'Login',
              textStyle: TextStyles.font16WhiteMedium,
              onPressed: () {
                validateThenLoginFunction(context);
              }),
          verticalSpace(10),
          PasswordValdation(
            hasOneUpperCase: hasUpperlLetter,
            hasOneLowerCase: hasSmallLetter,
            hasOneSpecialChars: hasSpecialLetter,
            hasMinLength: hasMinLength,
            hasOneNumber: hasOneNumber,
          ),
          LoginBlocListenner(),
        ],
      ),
    );
  }
}

void validateThenLoginFunction(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().userLogin(
        loginRequestBody: LoginRequestBody(
            email: context.read<LoginCubit>().emailController.text.trim(),
            password:
                context.read<LoginCubit>().passwordController.text.trim()));
  }
}
