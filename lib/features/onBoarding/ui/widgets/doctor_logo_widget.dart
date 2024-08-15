import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorLogoWidget extends StatelessWidget {
  const DoctorLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/doctor_logo.svg'),
        horizontalSpace(5.w),
        Text(
          'DocDoc',
          style: TextStyles.font24BlackBold,
        )
      ],
    );
  }
}
