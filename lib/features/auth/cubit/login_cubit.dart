import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morgan_e_commerce/Services/di/service_locator.dart';
import 'package:morgan_e_commerce/core/utils/base_state.dart';
import 'package:morgan_e_commerce/features/auth/model/user_login_model.dart';
import 'package:morgan_e_commerce/features/auth/repository/auth_repo.dart';

class LoginCubit extends Cubit<BaseState> {
  LoginCubit() : super(BaseInitial());
  final repo = getIt.get<AuthRepositoryImpl>();

  // Implementation of the LoginCubit
  Future<void> loginWithEmailAndPassword(UserLoginModel model) async {
    emit(BaseLoading());
    final result = await repo.signInWithEmailAndPassword(
        email: model.email, password: model.password);
    result.fold(
      (failure) => emit(BaseError(message: failure.errorMessage)),
      (response) => emit(BaseLoaded(response: response)),
    );
  }
  Future<void> loginWithGoogle() async {
    emit(GoogleLoading());
    final result = await repo.signInWithGoogle();
    result.fold(
      (failure) => emit(BaseError(message: failure.errorMessage)),
      (response) => emit(BaseLoaded(response: response)),
    );
  }
  Future<void> loginWithFacebook() async {
    emit(FBLoading());
    final result = await repo.signInWithFacebook();
    result.fold(
          (failure) => emit(BaseError(message: failure.errorMessage)),
          (response) => emit(BaseLoaded(response: response)),
    );
  }
}

class LoginLoading extends BaseState {}
class GoogleLoading extends BaseState {}
class FBLoading extends BaseState {}
