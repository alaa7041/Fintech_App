import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fintech_app/feature/portfolio/data/datasource/crypto_remote_datasource.dart';
import 'package:fintech_app/feature/portfolio/data/repo/crypto_repository_impl.dart';
import 'package:fintech_app/feature/portfolio/domain/repositories/crypto_repository.dart';
import 'package:fintech_app/feature/portfolio/domain/usecases/get_portfolio_usecase.dart';
import 'package:fintech_app/feature/portfolio/presentation/controller/portfolio_cubit.dart';
import 'package:get_it/get_it.dart';
import '../network_utils/api_service.dart';
import '../network_utils/dio_factory.dart';
import '../network_utils/network_status_info.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();

  // Connectivity + NetworkStatus
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<NetworkStatusInfo>(
      () => NetworkStatusInfoImpl(getIt()));

  // ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //  example 
  // getIt.registerLazySingleton<RegisterRepo>(
  //     () => RegisterRepo(getIt(), getIt()));
  // getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  getIt.registerLazySingleton<Dio>(() => dio);
getIt.registerFactory(() => PortfolioCubit());
  getIt.registerLazySingleton(() => GetPortfolioUseCase(getIt()));
    getIt.registerLazySingleton<CryptoRepository>(() => CryptoRepositoryImpl(remoteDataSource: getIt()));
    getIt.registerLazySingleton<CryptoRemoteDataSource>(() => CryptoRemoteDataSourceImpl(dio: getIt()));


}
