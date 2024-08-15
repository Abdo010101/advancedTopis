import 'package:development/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DotorImageWidget extends StatelessWidget {
  const DotorImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/svgs/back_ground_log_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0.0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  stops: [0.14, 0.7])),
          child: Image.asset('assets/images/Image.jpg'),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 30.h,
            child: Text(
              'Best Doctor Appointment App',
              textAlign: TextAlign.center,
              style: TextStyles.font32BlueBold.copyWith(
                height: 1.2,
              ),
            )),
      ],
    );
  }
}
