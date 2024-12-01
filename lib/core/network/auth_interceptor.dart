import 'package:bridgefy/core/constants/app_strings.dart';
import 'package:bridgefy/core/utils/storage.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppStrings.baseUrl,
      headers: {Headers.acceptHeader: Headers.jsonContentType},
    ),
  );

  /// detedted late
  /// naira ali [29/10/2024]
  String? token;
  String? refreshToken;

  bool _isRefreshing = false;

  final _requestsNeedRetry =
      <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  ///edited by naira ali [29/10/2024]
  ///  Constructor that ensures tokens are fetched asynchronously.
  AuthInterceptor() {
    _initializeTokens();
  }

  ///deleted getToken() and getRefreshToke() methods and replace them with a _initializeTokens to wait tell the token load
  Future<void> _initializeTokens() async {
    token = await Storage.instance.storage.read(key: 'token');
    refreshToken = await Storage.instance.storage.read(key: 'refreshToken');
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    ///edited by Naira [29/10/2024]
    // Wait until tokens are fully loaded.
    await _initializeTokens();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null &&
        err.response?.statusCode == 401 &&
        !err.requestOptions.path.contains(AppStrings.refreshToken)) {
      if (!_isRefreshing) {
        _isRefreshing = true;

        _requestsNeedRetry.add((options: err.requestOptions, handler: handler));
        String? refreshedAccessToken = await refreshingToken();

        if (refreshedAccessToken != null) {
          for (var requestNeedRetry in _requestsNeedRetry) {
            requestNeedRetry.options.headers['Authorization'] =
                'Bearer $refreshedAccessToken';

            dio.fetch(requestNeedRetry.options).then((response) {
              requestNeedRetry.handler.resolve(response);
            }).catchError((e) {
              requestNeedRetry.handler.reject(e);
            });
          }
        } else {
          for (var requestNeedRetry in _requestsNeedRetry) {
            requestNeedRetry.handler.reject(err);
          }
        }

        _requestsNeedRetry.clear();
        _isRefreshing = false;
      } else {
        _requestsNeedRetry.add((options: err.requestOptions, handler: handler));
      }
    } else {
      return handler.next(err);
    }
  }

  Future<String?> refreshingToken() async {
    var response = await dio
        .post(AppStrings.refreshToken, data: {'refresh_token': refreshToken});
    if (response.statusCode == 200) {
      return await parseToken(response);
    } else {
      await Storage.instance.storage.delete(key: 'token');
      await Storage.instance.storage.delete(key: 'refreshToken');
      var prefs = await SharedPreferences.getInstance();
          prefs.clear();
      
      return null;
    }
  }

  Future<String?> parseToken(Response<dynamic> response) async {
    token = response.data['data']['token'];
    refreshToken = response.data['data']['refreshToken'];

    await Storage.instance.storage.write(key: 'token', value: token);
    await Storage.instance.storage
        .write(key: 'refreshToken', value: refreshToken);
    return token;
  }
}
