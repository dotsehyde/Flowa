import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeTopCard extends StatelessWidget {
  final String label;
  final Widget icon;
  final Function()? onTap;
  const HomeTopCard(
      {super.key, required this.label, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 0.5.sh,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30.sp,
            width: 30.sp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300),
            child: icon,
          ),
          Text(label)
        ],
      ),
    );
  }
}
