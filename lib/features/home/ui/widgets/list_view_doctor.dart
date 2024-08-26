import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewDoctor extends StatelessWidget {
  const ListViewDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsetsDirectional.only(bottom: 10.w),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Image.asset(
                        'assets/images/dummy.png',
                        fit: BoxFit.cover,
                        width: 120.w,
                        height: 120.h,
                      ),
                    ),
                    horizontalSpace(8),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DR Handy Andelsies',
                          style: TextStyles.font18DarkBlueBold,
                        ),
                        verticalSpace(10),
                        Text('General | RUSD Gatlo Ronaldos'),
                        verticalSpace(10),
                        Text('Helllo'),
                      ],
                    ))
                  ],
                ),
              );
            }));
  }
}
