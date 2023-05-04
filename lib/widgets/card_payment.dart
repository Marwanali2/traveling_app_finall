import 'package:flutter/material.dart';

class CardPayment extends StatelessWidget {
  const CardPayment({Key key, @required this.title,@required this.image}) : super(key: key);
  final String title;
  final image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
      child: Container(padding: const EdgeInsets.only(left: 10,right: 14),
        decoration: BoxDecoration(
            border: Border.all(width: .5, color: Colors.white),
            borderRadius: BorderRadius.circular(12),

            color: Colors.white),

        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [


                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
                height: 50,
                width:105,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(6)),
                child:Image(image: AssetImage(image),fit: BoxFit.cover,)),
          ],
        ),
      ),
    );
  }
}
