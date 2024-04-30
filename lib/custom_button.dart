import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {

  final String character;
  final Color? color;

  final VoidCallback voidCallback;
  const Button({super.key, required this.character, required this.voidCallback, this.color,});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child:  Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color??Color(0xff1e2336),
        ),
        width: 100.w,
        height: 100.h,
        child: Text(character, style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
