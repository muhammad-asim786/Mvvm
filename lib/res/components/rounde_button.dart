import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
        required this.text,
        this.press,
        this.fontsize,
        this.fontWeight})
      : super(key: key);
  final String? text;
  final Function? press;
  final double? fontsize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontFamily: "sego ui normal",
            fontSize: fontsize,
            fontWeight: fontWeight,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
