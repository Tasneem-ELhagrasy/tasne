import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

void navigate({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushNamed(
    context,
    route,
    arguments: arg,
  );
}

void toast({required String message, required ToastStates state}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    textColor: AppColors.white,
    fontSize: 18,
    timeInSecForIosWeb: 3,
    backgroundColor: getState(state),
  );
}

enum ToastStates { error, success, warning }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.success:
      return AppColors.orange;
    case ToastStates.warning:
      return AppColors.yallow;
  }
}
