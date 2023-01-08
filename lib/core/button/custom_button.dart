import 'package:flutter/material.dart';
import 'package:quranazapp/core/constant.dart';

class CustomMaterialButton extends StatelessWidget {
  final Future<void> Function() onPressed;
  final String text;
  final TextStyle? textStyle;
  final BuildContext? context1;
  final bool maxSize;
  final Color? buttonColor;
  final double? width;
  final double? height;

  CustomMaterialButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.textStyle,
      this.buttonColor,
      required this.maxSize,
      this.context1,
      this.width,
      this.height})
      : super(key: key);

  void _completeProcess() async {
    await onPressed();
  }

  bool buttonStatus = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxSize == true ? double.infinity : null,
      child: MaterialButton(
        // color: snapshot.data == true? buttonColor ?? Theme.of(context1 ?? context).colorScheme.primary:Colors.grey,
        color: mainColor,
        elevation: 2,
        padding: const EdgeInsets.all(12),
        hoverElevation: 0,
        focusElevation: 0,
        height: height ?? 45,
        hoverColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minWidth: width ??
            (text.length >= 14
                ? 200
                : text.length > 10
                    ? 125
                    : 105),
        highlightElevation: 5,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () async {
          // buttonStatus != buttonStatus;
          // if(snapshot.data == true){
          //   _completeProcess();
          // menuCubit.updateButtonStatus(false);

          // }
          //             await Future.delayed(const Duration(seconds: 3));

          // menuCubit.updateButtonStatus(true);
          _completeProcess();
        },
        child: Text(
          text,
          style: textStyle ??
              Theme.of(context1 ?? context).textTheme.bodyText1!.copyWith(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
