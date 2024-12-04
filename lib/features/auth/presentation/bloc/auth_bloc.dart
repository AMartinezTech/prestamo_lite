import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestamo_lite/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:prestamo_lite/core/common/entities/user.dart';
import 'package:prestamo_lite/features/auth/domain/usecases/current_user_use_case.dart';
import 'package:prestamo_lite/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:prestamo_lite/features/auth/domain/usecases/sign_with_email_password_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUseCase _loginUserUseCase;
  final SignWithEmailPasswordUseCase _signWithEmailPasswordUseCase;
  final AppUserCubit _appUserCubit;
  final CurrentUserUseCase _currentUserUseCase;

  AuthBloc({
    required SignWithEmailPasswordUseCase signWithEmailPasswordUseCase,
    required LoginUserUseCase loginUserUseCase,
    required AppUserCubit appUserCubit,
    required CurrentUserUseCase currentUserUseCase,
  })  : _loginUserUseCase = loginUserUseCase,
        _signWithEmailPasswordUseCase = signWithEmailPasswordUseCase,
        _appUserCubit = appUserCubit,
        _currentUserUseCase = currentUserUseCase,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final resp = await _signWithEmailPasswordUseCase(
      UserSignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    resp.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    final resp = await _loginUserUseCase(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    resp.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final resp = await _currentUserUseCase(NoPrams());
    resp.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _emitAuthSuccess(
    User user,
    Emitter<AuthState> emit,
  ) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
