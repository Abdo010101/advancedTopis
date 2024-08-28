import 'dart:developer';

import 'package:development/core/helpers/cache_helper.dart';
import 'package:development/core/helpers/constants.dart';
import 'package:development/core/helpers/extention.dart';
import 'package:development/core/routing/routes.dart';
import 'package:development/core/theming/colors.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/features/login/data/models/login_response/login_response.dart';
import 'package:development/features/login/logic/login_cubit.dart';
import 'package:development/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListenner extends StatelessWidget {
  const LoginBlocListenner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  ));
                });
          },
          success: (loginResponse) async {
            context.pop();
            // we need to save token in sharred pref
           
            context.pushNamed(Routes.homeScreen);
          },
          error: (String message) {
            context.pop();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    icon: const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    content: Text(
                      message,
                      style: TextStyles.font13BlueSemiBold,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            'Got it',
                            style: TextStyles.font12GrayRegular,
                          )),
                    ],
                  );
                });
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

