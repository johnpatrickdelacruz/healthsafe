import 'package:equatable/equatable.dart';
import 'package:healthsafe/network/errors.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInLoading extends SignInState {}

class SignInFailure extends SignInState {
  const SignInFailure({required this.error});

  final Errors error;

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'SignInFailure {error: $error}';
}
