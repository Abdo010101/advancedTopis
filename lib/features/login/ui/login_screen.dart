import 'package:development/core/di/dependency_injection.dart';
import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/core/widgets/app_text_button.dart';
import 'package:development/features/login/logic/login_cubit.dart';
import 'package:development/features/login/logic/login_state.dart';
import 'package:development/features/login/ui/widgets/dont_have_acount.dart';
import 'package:development/features/login/ui/widgets/email_and_password.dart';
import 'package:development/features/login/ui/widgets/terms_and_contions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return Column(
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
                      Column(
                        children: [
                          EmailAndPassword(),
                        ],
                      ),
                      verticalSpace(36),
                      TermsAndConditionsText(),
                      verticalSpace(36),
                      Align(
                          alignment: AlignmentDirectional.center,
                          child: DontHaveAccountText())
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
