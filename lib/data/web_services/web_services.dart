import 'package:approutertrial/helper/constants/strings.dart';
import 'package:dio/dio.dart';

class WebServices {
  Dio? dio;

  WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio!.get('characters');

      return response.data;
    } on Exception {
      return [];
    }
  }

  Future<List<dynamic>> getCharacterQoutes(String charname) async {
    try {
      Response response =
          await dio!.get('quote', queryParameters: {'author': charname});

      return response.data;
    } on Exception {
      return [];
    }
  }

  Future<List<dynamic>> getDeath() async {
    try {
      Response response = await dio!.get('deaths');
      print(response.data);

      return response.data;
    } on Exception {
      return [];
    }
  }
}
