import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fintech_app/core/network_utils/api_error_handler.dart';
import 'package:fintech_app/core/network_utils/api_error_model.dart';
import 'package:fintech_app/core/network_utils/api_result.dart';

abstract class NetworkStatusInfo {
  Future<bool> get isConnected;
  Future<ApiResult<T>> safeRequest<T>(
    Future<T> Function() request, {
    bool checkNet = true,
    Options? options,
  });
}

class NetworkStatusInfoImpl implements NetworkStatusInfo {
  final Connectivity _connectivity;

  NetworkStatusInfoImpl(this._connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result[0] != ConnectivityResult.none;
  }

  @override
  Future<ApiResult<T>> safeRequest<T>(
    Future<T> Function() request, {
    bool checkNet = true,
    Options? options,
  }) async {
    if (checkNet && !await isConnected) {
      return ApiResult.error(
        ApiErrorModel(message: "No internet connection"),
      );
    }

    try {
      final result = await request();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.error(ApiErrorHandler.handle(error));
    }
  }
}
