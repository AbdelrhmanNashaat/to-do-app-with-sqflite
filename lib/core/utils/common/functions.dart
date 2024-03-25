import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constant.dart';
import '../../database/cache_helper.dart';
import '../../services/service_locator.dart';

class Functions {
  static Future<bool?> flutterToastMethod({required String msg}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: kDateColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static String formatDateWithoutTime({required DateTime? pickedDate}) {
    return pickedDate!.toIso8601String().split('T')[0];
  }

  static Future<Object?> visitOnBoarding(BuildContext context) async {
    return await getIt<CacheHelper>()
        .saveData(
          key: 'onBoarding',
          value: true,
        )
        .then(
          (value) => Navigator.pushReplacementNamed(context, '/home'),
        );
  }
}
