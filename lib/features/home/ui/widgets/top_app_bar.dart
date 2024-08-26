import 'package:development/core/theming/colors.dart';
import 'package:development/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Mohamed',
                  style: TextStyles.font18DarkBlueBold,
                ),
                Text(
                  'How Are you Today?',
                  style: TextStyles.font12GrayRegular,
                )
              ],
            ),
          ),
          /** spacer not effected with expanded this or this not toggther */
          // Spacer(),
          CircleAvatar(
            radius: 25.w,
            backgroundColor: ColorsManager.moreLighterGray,
            child: SvgPicture.asset('assets/svgs/notification.svg'),
          )
        ],
      ),
    );
  }
}
