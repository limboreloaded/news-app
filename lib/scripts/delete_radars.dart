import 'dart:io';

import 'package:dio/dio.dart';

void main() async {
  final Dio dio = Dio();

  dynamic allRadars = await dio.get("https://dash.blocktalk.tv/items/radar",
      options: Options(headers: {
        "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
      }));

  for (dynamic radar in allRadars.data["data"]) {
    await dio.delete("https://dash.blocktalk.tv/items/radar/${radar["id"]}",
        options: Options(headers: {
          "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
        }));

    print("Deleted radar with id ${radar["id"]}");
  }
}
