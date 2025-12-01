import 'package:dartz/dartz.dart';
import 'package:morgan_e_commerce/Services/firebase_auth/FirebaseAuthService.dart';
import 'package:morgan_e_commerce/core/utils/app_exceptions.dart';
import 'package:morgan_e_commerce/features/auth/model/user_data_model.dart';

abstract class AuthRepository {
  Future<Either<AppException, UserDataModel>> createUserWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<AppException, UserDataModel>> signInWithEmailAndPassword(
      {required String email, required String password});
}

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthRepositoryImpl({required this.firebaseAuthService});

  @override
  Future<Either<AppException, UserDataModel>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserDataModel(
          id: user?.uid ?? "",
          email: user?.email ?? "",
          name: user?.displayName ?? ""));
    } on AppException catch (e) {
      return Left(AppException(errorMessage: e.errorMessage));
    } catch (e) {
      return Left(AppException(errorMessage: e.toString()));
    }
  }
  @override
  Future<Either<AppException,UserDataModel>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(UserDataModel(
          id: user.uid,
          email: user.email ?? "",
          name: user.displayName ?? ""));
    } on AppException catch (e) {
      return Left(AppException(errorMessage: e.errorMessage));
    } catch (e) {
      return Left(AppException(errorMessage: e.toString()));
    }
  }
}
