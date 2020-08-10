part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final FirebaseUser user;

  LoginSuccess({@required this.user});

  @override
  List<Object> get props => [this.user];
}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({@required this.errorMessage});

  @override
  List<Object> get props => [this.errorMessage];
}

class LoginValidating extends LoginState {
  final String loadingMessage;

  LoginValidating({@required this.loadingMessage});

  @override
  List<Object> get props => [this.loadingMessage];
}
