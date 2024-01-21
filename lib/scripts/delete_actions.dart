import 'dart:io';

import 'package:dio/dio.dart';

void main() async {
  final Dio dio = Dio();

  dynamic allActions = await dio.get("https://dash.blocktalk.tv/items/action",
      options: Options(headers: {
        "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
      }));

  for (dynamic action in allActions.data["data"]) {
    await dio.delete("https://dash.blocktalk.tv/items/action/${action["id"]}",
        options: Options(headers: {
          "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
        }));

    print("Deleted action with id ${action["id"]}");

    sleep(const Duration(seconds: 5));
  }
}
