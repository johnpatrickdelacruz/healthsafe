import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationToSplash extends NavigationEvent {}

class NavigationToSignIn extends NavigationEvent {
  const NavigationToSignIn({required this.predicate});

  final bool predicate;

  @override
  List<Object> get props => [predicate];

  @override
  String toString() => 'NavigationToSignIn: {predicate: $predicate}';
}

class NavigationToEnterDistance extends NavigationEvent {
  const NavigationToEnterDistance({required this.predicate});

  final bool predicate;

  @override
  List<Object> get props => [predicate];

  @override
  String toString() => 'NavigationToEnterDistance: {predicate: $predicate}';
}

class NavigationToViewDistanceList extends NavigationEvent {
  const NavigationToViewDistanceList({required this.predicate});

  final bool predicate;

  @override
  List<Object> get props => [predicate];

  @override
  String toString() => 'NavigationToViewDistanceList: {predicate: $predicate}';
}
