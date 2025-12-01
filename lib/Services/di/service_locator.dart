import 'package:get_it/get_it.dart';
import 'package:morgan_e_commerce/Services/firebase_auth/FirebaseAuthService.dart';
import 'package:morgan_e_commerce/features/auth/repository/auth_repo.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static init() {
    // Implementation goes here
    getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
    getIt.registerSingleton<AuthRepositoryImpl>(AuthRepositoryImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ));
  }
}
