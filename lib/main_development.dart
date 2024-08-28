import 'package:development/core/di/dependency_injection.dart';
import 'package:development/core/helpers/cache_helper.dart';
import 'package:development/core/helpers/constants.dart';
import 'package:development/core/helpers/extention.dart';
import 'package:development/core/routing/app_router.dart';
import 'package:development/doc_app.dart';
import 'package:development/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();

  // to fix text being hidden  bug in screen util in realse mode
  await checkingLoginUser();
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

checkingLoginUser() async {
  String? token = await CacheHelper.getString(SharredKeys.userToken);
  if (!token.isNullorEmpty()) {
    isLogin = true;
  } else {
    isLogin = false;
  }
}
