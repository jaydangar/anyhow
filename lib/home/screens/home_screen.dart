import 'package:AnyHow/login/bloc/login_bloc.dart';
import 'package:AnyHow/widgets/drawer_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<LoginBloc>(context),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginSuccess) {
            FirebaseUser user = state.user;
            return DrawerWidget(user: user);
          }
          return Container();
        },
      ),
    );
  }
}
