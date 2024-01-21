import 'package:dio/dio.dart';
import 'package:network_logger/network_logger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

final cacheOptions = CacheOptions(
  store: MemCacheStore(),
  policy: CachePolicy.forceCache,
  hitCacheOnErrorExcept: [401, 403],
  maxStale: const Duration(hours: 1),
);

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio()
    ..interceptors.add(DioCacheInterceptor(options: cacheOptions));
  dio.interceptors.add(DioNetworkLogger());
  return dio;
});



//! EXAMPLES
// var response = await dio.get('https://www.foo.com');
// // Requesting with global options => status(304) => Content is read from cache store
// response = await dio.get('https://www.foo.com');
// // Requesting by modifying policy with refresh option
// // for this single request => status(200) => Content is written to cache store
// response = await dio.get('https://www.foo.com',
//   options: options.copyWith(policy: CachePolicy.refresh).toOptions(),
// );