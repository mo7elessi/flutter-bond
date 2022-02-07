import 'package:famcare/config/service_provider.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/auth_local_data_source.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/datasources/auth_response_converter.dart';
import 'data/repositories/auth_repository.dart';
import 'data/services/apple_id_login_service.dart';
import 'data/services/google_account_login_service.dart';
import 'presentation/activation/activation_cubit.dart';
import 'presentation/bloc/auth_bloc.dart';
import 'presentation/complete_registeration/complete_registration_cubit.dart';
import 'presentation/forget_password/forget_password_cubit.dart';
import 'presentation/login/login_cubit.dart';
import 'presentation/register/register_cubit.dart';
import 'presentation/reset_password/reset_password_cubit.dart';
import 'presentation/social_account_login/apple_id_login/apple_id_login_cubit.dart';
import 'presentation/social_account_login/google_account_login/google_account_login_cubit.dart';

class AuthServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => AuthRemoteDataSource(it.get()));
    it.registerFactory(() => AuthLocalDataSource(it.get()));
    it.registerLazySingleton(() => AuthRepository(it.get(), it.get()));
    it.registerFactory(() => GoogleAccountLoginService());
    it.registerFactory(() => AppleIdLoginService());

    it.registerFactory(() => RegisterCubit(it.get()));
    it.registerFactory(() => CompleteRegistrationCubit(it.get()));
    it.registerFactory(() => LoginCubit(it.get()));
    it.registerFactory(() => GoogleAccountLoginCubit(it.get(), it.get()));
    it.registerFactory(() => AppleIdLoginCubit(it.get(), it.get()));
    it.registerFactory(() => ForgetPasswordCubit(it.get()));
    it.registerFactory(() => ActivationCubit(it.get()));
    it.registerFactory(() => ResetPasswordCubit(it.get()));

    it.registerFactory(() => AuthBloc(it.get()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) =>
      AuthResponseConverter.convert<T>(json);
}
