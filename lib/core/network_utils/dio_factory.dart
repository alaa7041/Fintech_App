import 'package:dio/dio.dart';
import 'package:fintech_app/core/helpers/shared_prefernce_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../helpers/utils.dart';
import '../routing/route_manager.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeout = const Duration(seconds: 15);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout
        ..options.sendTimeout = timeout;
      await addDioHeaders();
      addDioInterceptors();

      return dio!;
    }
    return dio!;
  }

  static void setTokenAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static Future<void> addDioHeaders() async {
    final token = await SharedPrefHelper.getToken();
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void clearToken() {
    dio?.options.headers.remove('Authorization');
  }

  static void addDioInterceptors() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) async {
          final statusCode = error.response?.statusCode;
          final message = error.response?.data is Map
              ? (error.response?.data['message']?.toString().toLowerCase() ??
                  '')
              : '';

          if (statusCode == 401 && message.contains('unauthenticated')) {
            await SharedPrefHelper.clearToken();
            // Navigate to splash screen (beginning of the app)

            // RouteManager.navigateAndPopAll(const onBoardingScreen());
            return handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                response: error.response,
                error: 'Session expired, please login again',
                type: DioExceptionType.badResponse,
              ),
            );
          }
          return handler.next(error);
        },
      ),
    );

    // Pretty logger
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Accept-Language'] = Utils.isAR ? 'ar' : 'en';
          final requiresAuth = options.extra['auth'] != false;
          if (requiresAuth) {
            final token = await SharedPrefHelper.getToken();
            if (token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          } else {
            // auth: false → نشيل الهيدر
            options.headers.remove('Authorization');
          }
          return handler.next(options);
        },
      ),
    );

    // Pretty logger (for debugging)
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );
  }
}
