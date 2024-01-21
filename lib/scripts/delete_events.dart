// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';

void main() async {
  final Dio dio = Dio();

  dynamic allEvents = await dio.get("https://dash.blocktalk.tv/items/event",
      options: Options(headers: {
        "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
      }));

  for (dynamic event in allEvents.data["data"]) {
    await dio.delete("https://dash.blocktalk.tv/items/event/${event["id"]}",
        options: Options(headers: {
          "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
        }));

    print("Deleted event with id ${event["id"]}");
  }
}
