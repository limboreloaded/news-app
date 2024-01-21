import 'dart:convert';
import 'dart:math';

import 'package:bt_app/utils/database.dart';

Future updateArticle(dynamic entry, AppDatabase db) async {
  Articles replacedArticle = Articles.fromJson(entry);
  await db.updateArticlesItem(replacedArticle);
}

Future addArticle(dynamic entry, AppDatabase db) async {
  Articles newArticle = Articles.fromJson(entry);
  await db.updateArticlesItem(newArticle);
}

Future updateDapp(dynamic entry, AppDatabase db) async {
  Dapps replacedDapp = Dapps.fromJson(entry);
  await db.updateDappItem(replacedDapp);
}

Future addDapp(dynamic entry, AppDatabase db) async {
  Dapps newDapp = Dapps.fromJson(entry);
  await db.addDappItem(newDapp);
}

Future updateAction(dynamic entry, AppDatabase db) async {
  entry["author"] = Random().nextInt(200).toString();
  Actions replacedAction = Actions.fromJson(entry);
  await db.updateActionsItem(replacedAction);
}

Future addAction(dynamic entry, AppDatabase db) async {
  Actions newAction = Actions.fromJson(entry);
  await db.addActionsItem(newAction);
}

Future updateNft(dynamic entry, AppDatabase db) async {
  Nfts replacedNft = Nfts.fromJson(entry);
  await db.updateNftItem(replacedNft);
}

Future addNft(dynamic entry, AppDatabase db) async {
  Nfts newNft = Nfts.fromJson(entry);
  await db.addNftItem(newNft);
}

Future updateEvent(dynamic entry, AppDatabase db) async {
  entry["viewed"] = false;
  entry["entities"] = jsonEncode(entry["entities"]);
  entry["url_image"] = "";
  Events replacedEvent = Events.fromJson(entry);
  await db.updateEventItem(replacedEvent);
}

Future addEvent(dynamic entry, AppDatabase db) async {
  entry["viewed"] = false;
  entry["entities"] = jsonEncode(entry["entities"]);
  entry["url_image"] = "";
  Events newEvent = Events.fromJson(entry);
  await db.addEventItem(newEvent);
}

Future updateNewsArticle(dynamic entry, AppDatabase db) async {
  entry["viewed"] = false;
  News replacedNews = News.fromJson(entry);
  await db.updateNewsItemByReplace(replacedNews);
}

Future addNewsArticle(dynamic entry, AppDatabase db) async {
  entry["viewed"] = false;
  News newItem = News.fromJson(entry);
  await db.addNewsItem(newItem);
}

Future updateTweet(dynamic entry, AppDatabase db) async {
  Tweets replacedTweet = Tweets.fromJson(entry);
  await db.updateTweetsItem(replacedTweet);
}

Future addTweet(dynamic entry, AppDatabase db) async {
  Tweets newTweet = Tweets.fromJson(entry);
  await db.addTweetsItem(newTweet);
}

Future updateRadar(dynamic entry, AppDatabase db) async {
  entry["content"] = jsonEncode(entry["content"]);
  entry["viewed"] = false;
  Radars replacedRadar = Radars.fromJson(entry);
  await db.updateRadarItem(replacedRadar);
}

Future addRadar(dynamic entry, AppDatabase db) async {
  entry["content"] = jsonEncode(entry["content"]);
  entry["viewed"] = false;
  Radars newRadar = Radars.fromJson(entry);
  await db.addRadarItem(newRadar);
}
