import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthsafe/bloc/navigation/navigation_event.dart';
import 'package:healthsafe/network/services/navigation_services.dart';
import 'package:healthsafe/views/router.dart';
import '../../locator.dart';

class NavigationBloc extends Bloc<NavigationEvent, dynamic> {
  static int get initialState => 0;

  final NavigationService _navigationService =
      serviceLocator<NavigationService>();
  dynamic arguments;

  NavigationBloc() : super(initialState) {
    on<NavigationToSplash>((event, emit) {
      _navigationService.navigateTo(Routes.splash, false);
    });
    on<NavigationToSignIn>((event, emit) {
      _navigationService.navigateTo(Routes.signin, event.predicate);
    });
    on<NavigationToEnterDistance>((event, emit) {
      _navigationService.navigateTo(Routes.enterDistance, event.predicate);
    });
    on<NavigationToViewDistanceList>((event, emit) {
      _navigationService.navigateTo(Routes.viewDistanceList, event.predicate);
    });
  }
}
