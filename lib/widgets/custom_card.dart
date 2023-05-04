import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.icon2})
      : super(key: key);
  IconData icon;
  final title;
  IconData icon2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: .5, color: Colors.white),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(
                    icon,
                    color: Theme.of(context).accentColor,
                  )),
              SizedBox(
                width: 13,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                icon2,
                size: 18,
              )),
        ],
      ),
    );
  }
}
