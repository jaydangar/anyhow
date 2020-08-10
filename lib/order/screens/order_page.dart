import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        Container(
            color: Colors.black,
            padding: EdgeInsets.all(2),
            child: Image.asset(
              'lib/assets/category.jpg',
              fit: BoxFit.fill,
            )),
        Container(
            color: Colors.black,
            padding: EdgeInsets.all(2),
            child: Image.asset(
              'lib/assets/order.jpg',
              fit: BoxFit.fill,
            )),
        Container(
            color: Colors.black,
            padding: EdgeInsets.all(2),
            child: Image.asset(
              'lib/assets/shop.jpg',
              fit: BoxFit.fill,
            )),
      ],
      shrinkWrap: true,
    );
  }
}
