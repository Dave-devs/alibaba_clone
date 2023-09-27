import 'package:alibaba_clone/constants/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future flutterToast(String msg) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 14.sp,
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: blak,
    textColor: onBg,
  );
}
