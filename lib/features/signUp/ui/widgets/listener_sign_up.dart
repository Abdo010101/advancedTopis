import 'package:development/core/helpers/extention.dart';
import 'package:development/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:development/features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:development/features/signUp/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';

class EmitSignUpListener extends StatelessWidget {
  const EmitSignUpListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              });
        }, success: (signUpResponse) {
          context.pop();
          context.pushNamed(Routes.loginScreen);
        }, error: (message) {
          context.pop();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  icon: Icon(Icons.error),
                  content: Text(message),
                  actions: [
                    TextButton(
                      child: Text('Got it'),
                      onPressed: () {},
                    ),
                  ],
                );
              });
        });
      },
      child: SizedBox.shrink(),
    );
  }
}
