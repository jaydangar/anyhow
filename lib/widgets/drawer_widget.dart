import 'package:AnyHow/category/screens/category_page.dart';
import 'package:AnyHow/order/screens/order_page.dart';
import 'package:AnyHow/product/bloc/product_bloc.dart';
import 'package:AnyHow/product/screens/product_screen.dart';
import 'package:AnyHow/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key key,
    @required this.user,
  }) : super(key: key);

  final FirebaseUser user;

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Widget body = ProductPage();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.lock_open),
              onPressed: () => Navigator.pop(context),
              tooltip: 'Sign out',
            )
          ],
          title: Text('Home'),
        ),
        body: body,
        drawer: Container(
          width: MediaQueryUtils(context: context).width * 0.75,
          child: Drawer(
            elevation: 4,
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountEmail: Text(widget.user.email),
                  accountName: Text(widget.user.displayName),
                  currentAccountPicture: Image.network(
                    widget.user.photoUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.apps),
                  onTap: () {
                    setState(() {
                      body = ProductPage();
                    });
                    Navigator.pop(context);
                  },
                  title: Text('products'),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  onTap: () {
                    setState(() {
                      body = OrderPage();
                    });
                    Navigator.pop(context);
                  },
                  title: Text('orders'),
                ),
                ListTile(
                  leading: Icon(Icons.category),
                  onTap: () {
                    setState(() {
                      body = CategoryPage();
                    });
                    Navigator.pop(context);
                  },
                  title: Text('categories'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
