import 'package:dartz/dartz.dart';
import 'package:morgan_e_commerce/Services/database_service.dart';
import 'package:morgan_e_commerce/Services/firebase/firebase_auth/FirebaseAuthService.dart';
import 'package:morgan_e_commerce/Services/local/auth_local_datasource.dart';
import 'package:morgan_e_commerce/core/config/constans/end_points.dart';
import 'package:morgan_e_commerce/core/utils/app_exceptions.dart';
import 'package:morgan_e_commerce/core/utils/debug_prints.dart';
import 'package:morgan_e_commerce/features/auth/model/register_model.dart';
import 'package:morgan_e_commerce/features/auth/model/user_data_model.dart';

abstract class AuthRepository {
  Future<Either<AppException, UserDataModel>> createUserWithEmailAndPassword(
      {required RegisterModel model});

  Future<Either<AppException, UserDataModel>> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<AppException, UserDataModel>> signInWithGoogle();

  Future<Either<AppException, UserDataModel>> signInWithFacebook();

  Future<void> addUserData(UserDataModel userData);

  Future<bool> isUserExist(String uid);
}

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepositoryImpl(
      {required this.databaseService, required this.firebaseAuthService});

  @override
  Future<Either<AppException, UserDataModel>> createUserWithEmailAndPassword(
      {required RegisterModel model}) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: model.email, password: model.password);

      final userData = UserDataModel(
          id: user?.uid ?? "",
          email: model.email ?? "",
          name: model.name ?? "");

      addUserData(userData);

      return Right(userData);
    } on AppException catch (e) {
      firebaseAuthService.userDelete();
      return Left(AppException(errorMessage: e.errorMessage));
    } catch (e) {
      firebaseAuthService.userDelete();
      return Left(AppException(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<AppException, UserDataModel>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);

      final userData = UserDataModel(
          id: user.uid ?? "",
          email: user.email ?? "",
          name: user.displayName ?? "");

      AuthLocalDataSource.setUserData(userData.toJson());

      return Right(userData);
    } on AppException catch (e) {
      return Left(AppException(errorMessage: e.errorMessage));
    } catch (e) {
      return Left(AppException(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<AppException, UserDataModel>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthService.signInWithGoogle();

      final userData = UserDataModel(
          id: user.uid ?? "",
          email: user.email ?? "",
          name: user.displayName ?? "");

      if (!await isUserExist(user.uid)) {
        addUserData(userData);
      }
      AuthLocalDataSource.setUserData(userData.toJson());
      return Right(userData);
    } catch (e) {
      firebaseAuthService.userDelete();
      return Left(AppException(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<AppException, UserDataModel>> signInWithFacebook() async {
    try {
      final user = await firebaseAuthService.signInWithFacebook();

      final userData = UserDataModel(
          id: user.uid ?? "",
          email: user.email ?? "",
          name: user.displayName ?? "");

      if (!await isUserExist(user.uid)) {
        addUserData(userData);
      }
      AuthLocalDataSource.setUserData(userData.toJson());
      return Right(userData);
    } catch (e) {
      printError("Facebook Sign-In Error: ${e.toString()}");
      firebaseAuthService.userDelete();
      return Left(AppException(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> addUserData(UserDataModel userData) async {
    databaseService.addData(
        path: EndPoints.userCollection,
        data: userData.toJson(),
        docId: userData.id);
  }

  @override
  Future<bool> isUserExist(String uid) {
    return databaseService.isDataExist(
        path: EndPoints.userCollection, docId: uid);
  }
}
