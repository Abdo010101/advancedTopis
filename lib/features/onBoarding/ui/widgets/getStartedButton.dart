import 'package:development/core/helpers/extention.dart';
import 'package:development/core/routing/app_router.dart';
import 'package:development/core/routing/routes.dart';
import 'package:development/core/theming/colors.dart';
import 'package:development/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.pushNamed(Routes.loginScreen);
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
            //! this property make you full control over the button form spaceing
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: MaterialStateProperty.all(Size(double.infinity, 52)),
            backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue)),
        child: Text(
          'Get Started',
          style: TextStyles.font16WhiteMedium,
        ));
  }
}
