// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';

void main() async {
  final Dio dio = Dio();

  dynamic allTweets = await dio.get("https://dash.blocktalk.tv/items/tweet",
      options: Options(headers: {
        "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
      }));

  for (dynamic tweet in allTweets.data["data"]) {
    await dio.delete("https://dash.blocktalk.tv/items/tweet/${tweet["id"]}",
        options: Options(headers: {
          "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
        }));

    print("Deleted tweet with id ${tweet["id"]}");

    sleep(const Duration(seconds: 5));
  }
}
