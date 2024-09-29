import 'package:flutter/material.dart';
import '../../themes/light-colors.dart';
import '../../themes/text_style.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,
        this.action = TextInputAction.next,
        this.contentHorizontalPadding = 10,
        this.contentVerticalPadding = 10,
        this.horizontalPadding = 0,
        this.verticalPadding = 0,
        this.textAlign = TextAlign.start,
        this.onTap,
        this.controller,
        this.textInputType,
        this.validate,
        this.labelText,
        this.prefixIcon,
        this.onPressed,
        this.onChanged,
        this.labelSize,
        this.maxLines,
        this.hintText,
        this.suffixIcon,
        this.helpText,
        this.prefixIconColor=primaryColorLight
      })
      : super(key: key);

  final GestureTapCallback? onTap;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final FormFieldValidator<String>? validate;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onPressed;
  final TextInputAction? action;
  final Function(String)? onChanged;
  final double? labelSize;
  final double verticalPadding;
  final double horizontalPadding;
  final double contentVerticalPadding;
  final double contentHorizontalPadding;
  final TextAlign textAlign;
  final int? maxLines;
  final String? hintText;
  final String? helpText;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      textInputAction: action,
      onTap: onTap,
      controller: controller,
      keyboardType: textInputType,
      validator: validate,
      onChanged: onChanged,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: contentVerticalPadding, horizontal: contentHorizontalPadding),
        labelText: labelText,
        labelStyle: normalTextStyle(),
        hintStyle: normalTextStyle(),

        // errorStyle: normalTextStyle(color: errorColor,fontSize: 15),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(5),
        //   // borderSide: BorderSide(color: PmainColor),
        //   borderSide: const BorderSide(width: 2,color: primaryColorLight),
        // ),
        // disabledBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(5)),
        //   borderSide: BorderSide(width: 1, color:  primaryColorLight),
        // ),
        // errorBorder:  const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(5)),
        //   borderSide: BorderSide(width: 2, color: errorColor),
        // ),
        // focusedErrorBorder: const OutlineInputBorder(
        //
        //   borderRadius: BorderRadius.all(Radius.circular(5)),
        //   borderSide: BorderSide(width: 2, color: errorColor),
        // ),
        // //يمكن الكتابة فيه
        // enabledBorder:  OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(5),
        //   borderSide: BorderSide(width:2, color: borderColor),
        // ),
        prefixIcon: (prefixIcon!=null)?Icon(prefixIcon):null,
        suffixIcon: suffixIcon,
prefixIconColor: prefixIconColor,

      ),
      style: normalTextStyle(),
    );
  }
}