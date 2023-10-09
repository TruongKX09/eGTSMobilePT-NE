import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? ontap;
  const MyButton({Key? key, required this.label, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffcbb682)),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
