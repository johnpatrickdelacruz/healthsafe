import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInUserEvent extends SignInEvent {
  const SignInUserEvent();

  @override
  String toString() => 'SignInUserEvent';
}
