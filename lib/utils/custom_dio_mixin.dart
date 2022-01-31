import 'package:dio/dio.dart';

mixin CustomDioMixin {
  static Map<String, dynamic> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Charset': 'utf-8',
    'Cookie':
        'csrftoken=LLX3lj1U9tjJtiV7fiJMA3RiOWe3H5kA; ig_did=F13DFA13-932A-4E2E-90A4-3C8D8DCCD200; ig_nrcb=1; mid=YfHZzwAEAAF5mkRv3F0wjOTd2r8j'
  };
  static BaseOptions options = BaseOptions(
    headers: headers,
    validateStatus: (status) => true,
    responseType: ResponseType.json,
  );
  Dio dio = Dio(options);
}
