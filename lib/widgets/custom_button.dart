import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  CustomButton({required this.text,required this.onPressed,this.isLoading=false});
  String text;
  VoidCallback onPressed;
  final bool  isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
        //  minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width,50,)),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 100,vertical: 20)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)))
      ),
      onPressed: onPressed,
      child: isLoading? SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,

        ),
      ): Text(
        "$text",
        style: TextStyle(
            color: Colors.white,
            fontSize: 22
        ),
      ),
    );
  }
}
