import 'package:AnyHow/utils/utils.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        Stack(
          children: [
            Container(
              height: MediaQueryUtils(context: context).height,
              color: Colors.black,
              padding: EdgeInsets.all(2),
              child: Image.asset(
                'lib/assets/shop.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 4,
              left: 4,
              child: Text('Shopping'),
            )
          ],
        ),
        Stack(
          children: [
            Container(
              height: MediaQueryUtils(context: context).height,
              color: Colors.black,
              padding: EdgeInsets.all(2),
              child: Image.asset(
                'lib/assets/order.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 4,
              left: 4,
              child: Text('Orders'),
            )
          ],
        ),
        Stack(
          children: [
            Container(
              height: MediaQueryUtils(context: context).height,
              color: Colors.black,
              padding: EdgeInsets.all(2),
              child: Image.asset(
                'lib/assets/category.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 4,
              left: 4,
              child: Text('Purchase'),
            )
          ],
        ),
      ],
      shrinkWrap: true,
    );
  }
}
