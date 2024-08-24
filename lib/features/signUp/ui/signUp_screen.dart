import 'dart:developer';

import 'package:development/core/di/dependency_injection.dart';
import 'package:development/core/helpers/app_regex.dart';
import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/core/widgets/app_text_button.dart';
import 'package:development/core/widgets/app_text_form_filed.dart';
import 'package:development/features/login/ui/widgets/terms_and_contions.dart';
import 'package:development/features/signUp/data/models/signUp_request_model.dart';
import 'package:development/features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:development/features/signUp/logic/cubit/sign_up_state.dart';
import 'package:development/features/signUp/ui/widgets/PasswordRuleSection.dart';
import 'package:development/features/signUp/ui/widgets/have_an_account.dart';
import 'package:development/features/signUp/ui/widgets/listener_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocBuilder<SignUpCubit, SignUpState>(
          bloc: cubit,
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
                vertical: 20.h,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyles.font24BlueBold,
                      ),
                      verticalSpace(8),
                      Text(
                        'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                        style: TextStyles.font14GrayRegular,
                      ),
                      verticalSpace(36),
                      AppTextFormField(
                          hintText: 'name',
                          controller:
                              context.read<SignUpCubit>().nameController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return cubit.errorMessage['name'] ??
                                  'Field Must be Not Empty';
                            } else if (cubit.errorMessage['name'] != null) {
                              return cubit.errorMessage['name'].toString();
                            }
                            return null;
                          }),
                      verticalSpace(16),
                      AppTextFormField(
                          hintText: 'email',
                          controller:
                              context.read<SignUpCubit>().emaiController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field Must be Not Empty';
                            } else if (cubit.errorMessage['email'] != null) {
                              return cubit.errorMessage['email'].toString();
                            }
                            return null;
                          }),
                      verticalSpace(16),
                      AppTextFormField(
                          hintText: 'phone',
                          controller:
                              context.read<SignUpCubit>().phoneController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field Must be Not Empty';
                            } else if (cubit.errorMessage['phone'] != null) {
                              return cubit.errorMessage['phone'].toString();
                            }
                            return null;
                          }),
                      verticalSpace(16),
                      AppTextFormField(
                          hintText: 'password',
                          obstureText: cubit.isObscurePassword,
                          pefixIcon: GestureDetector(
                            onTap: () {
                              cubit.passwordToggleVisibilty();
                              log(cubit.isObscurePassword.toString());
                            },
                            child: cubit.isObscurePassword
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                          controller: cubit.passwordController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field Must be Not Empty';
                            } else if (cubit.errorMessage['password'] != null) {
                              return cubit.errorMessage['password'].toString();
                            }
                            return null;
                          }),
                      verticalSpace(16),
                      AppTextFormField(
                          hintText: 'confirm Password',
                          obstureText: context
                              .read<SignUpCubit>()
                              .isObscureConfirmPassword,
                          pefixIcon: Icon(Icons.visibility),
                          controller: context
                              .read<SignUpCubit>()
                              .confirmPasswordController,
                          validator: (String? val) {
                            if (val == null || val.isEmpty) {
                              return 'Field Must be Not Empty';
                            } else if (cubit.errorMessage['password'] != null) {
                              return cubit.errorMessage['password'].toString();
                            }
                            return null;
                          }),
                      verticalSpace(20),
                      PasswordRulesSection(),
                      AppTextButton(
                          buttonText: 'Sign Up',
                          textStyle: TextStyles.font16WhiteSemiBold,
                          onPressed: () {
                            valdationSignUp(context);
                          }),
                      verticalSpace(20),
                      TermsAndConditionsText(),
                      verticalSpace(20),
                      Center(child: HaveAccountText()),
                      EmitSignUpListener(),
                      verticalSpace(40),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void valdationSignUp(BuildContext context) {
    context.read<SignUpCubit>().errorMessage.clear();
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().doSignUp();
    }
  }
}
