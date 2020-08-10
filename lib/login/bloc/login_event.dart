part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{}

class ValidateLogIn extends LoginEvent{
  @override
  List<Object> get props => [];
}