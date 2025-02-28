import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeMenuCard extends StatelessWidget {
  final Color bgColor;
  final Widget icon;
  final String title;
  final Function()? onTap;
  const HomeMenuCard(
      {super.key,
      required this.bgColor,
      required this.icon,
      required this.title,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 2.sw,
        children: [
          Container(
            width: 30.sp,
            height: 30.sp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: bgColor),
            child: icon,
          ),
          Text(title)
        ],
      ),
    );
  }
}
