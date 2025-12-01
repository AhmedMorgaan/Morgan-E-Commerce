import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morgan_e_commerce/Services/di/service_locator.dart';
import 'package:morgan_e_commerce/core/utils/base_state.dart';
import 'package:morgan_e_commerce/features/auth/model/register_model.dart';
import 'package:morgan_e_commerce/features/auth/repository/auth_repo.dart';

class RegisterCubit extends Cubit<BaseState> {
  RegisterCubit() : super(BaseInitial());
  final repo = getIt.get<AuthRepositoryImpl>();

  // Implementation of the RegisterCubit
  Future<void> registerUserWithEmailAndPassword(RegisterModel model) async {
    emit(BaseLoading());
    final eitherFailureOrSuccess = await repo.createUserWithEmailAndPassword(
        email: model.email, password: model.password);
    eitherFailureOrSuccess.fold(
      (failure) => emit(BaseError(message: failure.errorMessage)),
      (response) => emit(BaseLoaded(response: response)),
    );
  }
}
