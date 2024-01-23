import 'package:flutter/material.dart';

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
          color: color??Colors.grey
        ),
        width: 100,
        height: 100,
        child: Text(character, style: TextStyle(fontSize: 30,),
      ),
    ));
  }
}
