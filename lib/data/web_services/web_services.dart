import 'package:approutertrial/helper/constants/strings.dart';
import 'package:dio/dio.dart';

class WebServices {
  Dio? dio;

  WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio!.get('characters');
      print(response.data.toString());
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }
}
