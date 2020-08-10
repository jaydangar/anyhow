import 'package:AnyHow/login/bloc/login_bloc.dart';
import 'package:AnyHow/utils/routes.dart';
import 'package:AnyHow/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog = ProgressDialog(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('AnyHow'),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (dialog.isShowing()) {
            dialog.hide();
          }
          if (state is LoginValidating) {
            if (!dialog.isShowing()) {
              dialog.style(message: state.loadingMessage);
              dialog.show();
            }
          } else if (state is LoginFailure) {
            if (dialog.isShowing()) {
              dialog.hide();
            }
          } else if (state is LoginSuccess) {
            Navigator.pushNamed(context, Routing.HomePageRoute);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) => current != previous,
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      children: [
                        SignInBodyWidget(
                          backgroundColor: Colors.deepOrange,
                          message: 'Purchase',
                          asset: 'lib/assets/shop.jpg',
                        ),
                        SignInBodyWidget(
                          backgroundColor: Colors.deepPurple,
                          message: 'Order',
                          asset: 'lib/assets/order.jpg',
                        ),
                        SignInBodyWidget(
                          backgroundColor: Colors.black,
                          message: 'View',
                          asset: 'lib/assets/category.jpg',
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: FlatButton(
                        color: Theme.of(context).accentColor,
                        child: Text('Sign In'),
                        onPressed: () => BlocProvider.of<LoginBloc>(context)
                            .add(ValidateLogIn()),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SignInBodyWidget extends StatelessWidget {
  const SignInBodyWidget(
      {Key key,
      @required this.backgroundColor,
      @required this.message,
      @required this.asset})
      : super(key: key);

  final String message;
  final Color backgroundColor;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          color: backgroundColor,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Image.asset(
              asset,
              height: MediaQueryUtils(context: context).height * 0.5,
              width: MediaQueryUtils(context: context).width * 0.8,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            child: Text(
              message,
              style: TextStyle(
                  fontStyle: Theme.of(context).textTheme.headline6.fontStyle,
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.headline6.fontSize),
            ),
            alignment: Alignment.center,
          ),
        ]),
      ],
    );
  }
}
