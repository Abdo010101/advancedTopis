import 'package:development/core/theming/style.dart';
import 'package:development/core/widgets/app_text_button.dart';
import 'package:development/core/widgets/app_text_form_filed.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';

class EmailAndPassword extends StatefulWidget {
  EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            hintText: 'Email',
          ),
          verticalSpace(30),
          AppTextFormField(
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
              onPressed: () {})
        ],
      ),
    );
  }
}
