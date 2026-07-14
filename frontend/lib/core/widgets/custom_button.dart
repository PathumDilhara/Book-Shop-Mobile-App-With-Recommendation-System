import 'package:flutter/material.dart';

Widget customButton({
  required String title,
  required Color bgColor,
  required Color borderColor,
  required VoidCallback onTap,
  IconData? icon,
  Color textColor=Colors.white,
  double bh = 50,
  double bw=150,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: bw,
        height: bh,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (icon != null) SizedBox(width: 5),
              if (icon != null) Icon(icon, color: textColor,),
            ],
          ),
        ),
      ),
    ),
  );
}
