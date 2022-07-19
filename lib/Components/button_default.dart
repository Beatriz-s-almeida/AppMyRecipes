import 'package:flutter/material.dart';

class ButtonDefault extends StatefulWidget {
  final String title;
  final Function()? onPressed;

  const ButtonDefault({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  State<ButtonDefault> createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(widget.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 17 ),),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
            )));
  }
}
