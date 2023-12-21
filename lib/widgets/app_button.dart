// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isshort;
  double? width;
  String? text;
  ResponsiveButton({Key? key, this.isshort = true, this.width = 120, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        // width: isshort == false ? double.maxFinite : width,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$text',
              style: TextStyle(color: Colors.white),
            ),
            Image.asset('img/button-one.png')
          ],
        ),
      ),
    );
  }
}
