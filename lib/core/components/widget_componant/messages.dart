import 'package:flutter/material.dart';

import '../../themes/light-colors.dart';
import '../../themes/text_style.dart';

showErrorMessage({required String message, required context}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: normalTextStyle(color: Colors.white),
      ),
      backgroundColor: errorColor,
    ));

showSuccessMessage({required String message, required context}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: normalTextStyle(color: Colors.white),
      ),
      backgroundColor: primaryColor,
    ));
