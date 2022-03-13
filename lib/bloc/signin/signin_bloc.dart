import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthsafe/bloc/signin/signin_event.dart';
import 'package:healthsafe/bloc/signin/signin_state.dart';
import 'package:healthsafe/locator.dart';
import 'package:healthsafe/network/abstract_repositories/auth_repository_providing.dart';
import 'package:healthsafe/network/errors.dart';
import 'package:healthsafe/network/helper/connectivity_helper.dart';
import 'package:healthsafe/network/repositories/auth_repository.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(initialState) {
    on<SignInUserEvent>((event, emit) async {
      emit(SignInLoading());
      if (!(await ConnectionHelper.hasConnection())) {
        emit(const SignInFailure(error: Errors.NoNetwork));
        return;
      }

      try {
        var result = await _authRepository.signInUser();

        if (result != null) {
          emit(SignInSuccess());
        } else {
          emit(const SignInFailure(error: Errors.Generic));
        }
      } catch (error) {
        emit(const SignInFailure(error: Errors.Generic));
      }
    });
  }

  static SignInState get initialState => SignInInitial();

  final AuthRepositoryProviding _authRepository =
      serviceLocator<AuthRepository>();
}
