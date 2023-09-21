import 'dart:convert';
import 'package:alibaba_clone/constants/utils/snackbar.dart';
import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void httpErrorHandle({
  required Response response,
  required WidgetRef ref,
  required void Function() onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      flutterToast(jsonDecode(response.body)['msg']);
      break;
    case 500:
      flutterToast(jsonDecode(response.body)['error']);
      break;
    default:
      flutterToast(response.body);
  }
}
