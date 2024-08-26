import 'package:development/core/theming/style.dart';
import 'package:flutter/material.dart';

class CustomTextSpecialist extends StatelessWidget {
  const CustomTextSpecialist({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctor Speciality',
          style: TextStyles.font15DarkBlueMedium,
        ),
        const Spacer(),
        Text(
          'see All',
          style: TextStyles.font12BlueRegular,
        )
      ],
    );
  }
}
