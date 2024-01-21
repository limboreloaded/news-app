import 'dart:convert';
import 'dart:math';

import 'package:bt_app/utils/tools.dart';
import 'package:bt_app/utils/database.dart';
import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:money2/money2.dart';

Future populateLastUpdated(AppDatabase db, Dio dio) async {
  Response<dynamic> fetchedLastUpdated =
      await dio.get("https://data.blocktalk.tv/last_updated");

  List<Cron> localLastUpdated = await db.getAllCronItems();

  if (fetchedLastUpdated.data.length == localLastUpdated.length) return;

  List<String> foundTables = [];

  for (Cron item in localLastUpdated) {
    foundTables.add(item.name);
  }

  for (dynamic item in fetchedLastUpdated.data) {
    if (!foundTables.contains(item["name"])) {
      //! Use id on entity generation, not a random string
      //* Auto id generation is possible only if the
      //* field has an .autoIncrement(). This field is already
      //* declared as a non primary key field, so id generation
      //* is impossible at this state. Specify if you want
      //* refactorisation on all tables.
      item["id"] = Random().nextInt(100).toString() + item["name"];
      item["table_name"] = item["name"];
      item["last_updated"] = DateTime.fromMillisecondsSinceEpoch(
              int.parse(item["last_updated"].toString()))
          .toString();
      item["created_at"] = DateTime.now().toString();
      await db.addCronItem(Cron.fromJson(item));
    }
  }
}

Future<void> populateNews(AppDatabase db, dio) async {
  final response = await dio.get("https://data.blocktalk.tv/news");

  List<dynamic> fetchedNews = response.data;

  Iterable<News> items = fetchedNews.map((e) {
    List<dynamic> foundTokens = pillsData.map((token) {
      String title = e["title"];
      if (title.toLowerCase().contains(token["name"].toLowerCase()) ||
          title.toLowerCase().contains(token["symbol"].toLowerCase())) {
        return token["id"];
      }
    }).toList();

    foundTokens.removeWhere((element) => element == null);
    e["project_id"] = jsonEncode(foundTokens);
    return News.fromJson(e);
  });
  await db.batch((batch) {
    batch.insertAll(db.newsTable, items);
  });
}

Future<void> populateArticles(AppDatabase db, Dio dio) async {
  final response = await dio.get("https://data.blocktalk.tv/articles");

  final List fetchedArticles = response.data;

  int index = 0;

  Iterable<Articles> items = fetchedArticles.map((e) {
    e["id"] = index.toString();
    index += 1;
    return Articles.fromJson(e);
  });
  await db.batch((batch) {
    batch.insertAll(db.articlesTable, items);
  });
}

Future<void> populateTweets(AppDatabase db, Dio dio) async {
  final response = await dio.get("https://data.blocktalk.tv/tweets");

  List<dynamic> fetchedTweets = response.data;

  Iterable<Tweets> items = fetchedTweets.map((e) {
    return Tweets.fromJson(e);
  });
  await db.batch((batch) {
    batch.insertAll(db.tweetsTable, items);
  });
}

Future<void> populateRadars(AppDatabase db, Dio dio) async {
  final response = await dio.get("https://data.blocktalk.tv/radar");

  List<dynamic> fetchedRadars = response.data;

  Iterable<Radars> items = fetchedRadars.map((e) {
    e["content"] = jsonEncode(e["content"]);
    return Radars.fromJson(e);
  });
  await db.batch((batch) {
    batch.insertAll(db.radarsTable, items);
  });
}

Future<void> populateDapps(AppDatabase db, Dio dio) async {
  final response = await dio.get("https://data.blocktalk.tv/dapps");

  List<dynamic> fetchedDapps = response.data;

  Iterable<Dapps> items = fetchedDapps.map((e) {
    return Dapps.fromJson(e);
  });
  await db.batch((batch) {
    batch.insertAll(db.dappsTable, items);
  });
}

Future<void> populateChains(AppDatabase db, Dio dio) async {
  final response = await dio.get("https://data.blocktalk.tv/chains");

  List<dynamic> fetchedChains = response.data;

  Iterable<Chains> items = fetchedChains.map((e) {
    return Chains.fromJson(e);
  });
  await db.batch((batch) {
    batch.insertAll(db.chainsTable, items);
  });
}

Future<void> populateNfts(AppDatabase db, Dio dio) async {
  final response = await dio.get("https://data.blocktalk.tv/nfts");

  List<dynamic> fetchedNfts = response.data;

  Iterable<Nfts> items = fetchedNfts.map((e) {
    return Nfts.fromJson(e);
  });
  await db.batch((batch) {
    batch.insertAll(db.nftsTable, items);
  });
}

Future<void> populateCron(AppDatabase db, Dio dio) async {
  final response = await dio.get("https://data.blocktalk.tv/last_updated");

  List<dynamic> fetchedCron = response.data;

  Iterable<Cron> items = fetchedCron.map((e) => Cron.fromJson({
        'id': Random().nextInt(100).toString(),
        'table_name': e["name"],
        'last_updated': DateTime.fromMillisecondsSinceEpoch(0).toString(),
        'created_at': DateTime.now().toString()
      }));
  await db.batch((batch) {
    batch.insertAll(db.cronTable, items);
  });
}

Future<void> populatePrices(AppDatabase db, Dio dio) async {
  List<Prices> items = [];

  for (int i = 0; i < pillsData.length; i++) {
    try {
      dynamic e = pillsData[i];

      String symbol = e["symbol"];

      dynamic response = await dio.get(
          'https://api.binance.com/api/v3/ticker/24hr?symbol=${symbol}USDT');

      Decimal tokenPrice = Decimal.parse(response.data['prevClosePrice']);

      Money formattedTokenPrice =
          Money.parse(tokenPrice.toString(), code: 'USD');

      e["price"] = tokenPrice >= Decimal.fromInt(10000)
          ? '${tokenPrice.toString()[0]}${tokenPrice.toString()[1]}K'
          : formattedTokenPrice.format(getFormat(tokenPrice));
      e["is_price_up"] = double.parse(response.data['priceChange']) > 0;

      items.add(Prices.fromJson(e));
    } catch (error) {
      dynamic e = pillsData[i];
      items.add(Prices.fromJson(e));
    }
  }
  await db.batch((batch) {
    batch.insertAll(db.pricesTable, items);
  });
}

final List<Map<String, dynamic>> pillsData = [
  {
    'icon': 'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png',
    'symbol': 'BTC',
    'name': 'Bitcoin',
    'id': 'project-0'
  },
  {
    'icon': 'https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png',
    'symbol': 'ETH',
    'name': 'Ethereum',
    'id': 'project-2'
  },
  {
    'icon': 'https://s2.coinmarketcap.com/static/img/coins/64x64/7278.png',
    'symbol': 'AAVE',
    'name': 'Aave',
    'id': 'project-3'
  },
  {
    'icon': 'https://cryptologos.cc/logos/multi-collateral-dai-dai-logo.png',
    'symbol': 'DAI',
    'name': 'Dai',
    'id': 'project-4'
  },
  {
    'icon': 'https://s2.coinmarketcap.com/static/img/coins/200x200/1831.png',
    'symbol': 'BCH',
    'name': 'Bitcoin Cash',
    'id': 'project-5'
  },
  {
    'icon':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Uniswap_Logo.svg/1026px-Uniswap_Logo.svg.png',
    'symbol': 'UNI',
    'name': 'Uniswap',
    'id': 'project-6'
  },
  {
    'icon':
        'https://thegivingblock.com/wp-content/uploads/2021/07/Synthetix-Logo.png',
    'symbol': 'SNX',
    'name': 'Synthetix',
    'id': 'project-7'
  },
  {
    'icon': 'https://s2.coinmarketcap.com/static/img/coins/200x200/11840.png',
    'symbol': 'OP',
    'name': 'Optimism',
    'id': 'project-8'
  },
];

//! NEWS:
//! TITLE
//! SOURCE
//! IMAGE
//! PUBLISHED AT

//! EVENTS:
//! TITLE
//! ENTITY
//! CONTENT
//! COLOR
//! SCHEDULED_FOR

List<dynamic> staticEvents = [
  [
    {
      "title": "Upbit Conference",
      "entity": "a3c45bf3-2b9d-466c-a843-970c9af62bd8",
      "content":
          "<p> \n                                                    \"... Explore emerging trends and multifaceted aspects of blockchain. Join us to delve into the rich tapestry of blockchain possibilities...\"\n                                             </p>",
      "color": "#D82122",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Upbit Conference",
      "entity": "777c287e-d041-492b-b2ba-e952d690d62e",
      "content":
          "<p> \n                                                    \"... Explore emerging trends and multifaceted aspects of blockchain. Join us to delve into the rich tapestry of blockchain possibilities...\"\n                                             </p>",
      "color": "#356DF3",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Upbit Conference",
      "entity": "ca21f0fb-dee8-4c5c-9844-41474835cdcf",
      "content":
          "<p> \n                                                    \"... Explore emerging trends and multifaceted aspects of blockchain. Join us to delve into the rich tapestry of blockchain possibilities...\"\n                                             </p>",
      "color": "#3399FF",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Upbit Conference",
      "entity": "add35259-ebdd-443b-b3cb-cae10c64561d",
      "content":
          "<p> \n                                                    \"... Explore emerging trends and multifaceted aspects of blockchain. Join us to delve into the rich tapestry of blockchain possibilities...\"\n                                             </p>",
      "color": "#3368FF",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Upbit Conference",
      "entity": "6d60b636-0c28-459e-9a05-579333b8e1c3",
      "content":
          "<p> \n                                                    \"... Explore emerging trends and multifaceted aspects of blockchain. Join us to delve into the rich tapestry of blockchain possibilities...\"\n                                             </p>",
      "color": "#E84142",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Upbit Conference",
      "entity": "157f4ede-6c84-423f-ac5f-11ec28f90430",
      "content":
          "<p> \n                                                    \"... Explore emerging trends and multifaceted aspects of blockchain. Join us to delve into the rich tapestry of blockchain possibilities...\"\n                                             </p>",
      "color": "#0555D5",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Upbit Conference",
      "entity": "f93947cd-c725-4e1f-aa5e-7473fe0dff0c",
      "content":
          "<p> \n                                                    \"... Explore emerging trends and multifaceted aspects of blockchain. Join us to delve into the rich tapestry of blockchain possibilities...\"\n                                             </p>",
      "color": "#3468D1",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Upbit Conference",
      "entity": "3d673df0-6df8-4dd3-a8c0-9feb2ba7d63a",
      "content":
          "<p> \n                                                    \"... Explore emerging trends and multifaceted aspects of blockchain. Join us to delve into the rich tapestry of blockchain possibilities...\"\n                                             </p>",
      "color": "#375BD2",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Upbit Conference",
      "entity": "ce19bfdc-f1d7-43c8-8335-766aa5ebe4f9",
      "content":
          "<p> \n                                                    \"... Explore emerging trends and multifaceted aspects of blockchain. Join us to delve into the rich tapestry of blockchain possibilities...\"\n                                             </p>",
      "color": "#9684F3",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Upbit Conference",
      "entity": "7b3bfd6b-ed6e-4704-8342-5a3a5d376da8",
      "content":
          "<p> \n                                                    \"... Explore emerging trends and multifaceted aspects of blockchain. Join us to delve into the rich tapestry of blockchain possibilities...\"\n                                             </p>",
      "color": "#1BE2AF",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Upbit Conference",
      "entity": "d1a3123e-3645-4366-8a50-d4cf88112fed",
      "content":
          "<p> \n                                                    \"... Explore emerging trends and multifaceted aspects of blockchain. Join us to delve into the rich tapestry of blockchain possibilities...\"\n                                             </p>",
      "color": "#6747ED",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Datapalooza",
      "entity": "fd672ebd-e415-4dc6-8a3d-e03ba334a4f0",
      "content":
          "<p> \n                                                    \"The event will cover R&D and tooling in The Graph ecosystem and across web3, focusing on use cases for dapps...,\" at 10 AM (GMT+3).\n                                             </p>",
      "color": "#141414",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Datapalooza",
      "entity": "d1a3123e-3645-4366-8a50-d4cf88112fed",
      "content":
          "<p> \n                                                    \"The event will cover R&D and tooling in The Graph ecosystem and across web3, focusing on use cases for dapps...,\" at 10 AM (GMT+3).\n                                             </p>",
      "color": "#6747ED",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "LabWeek23",
      "entity": "972059b4-6db4-480f-91ad-bb570164a8db",
      "content":
          "<p> \n                                                    \"... Builders, thinkers, innovators and leaders to share research and participate in a dynamic program of engineering workshops, summits...\"\n                                             </p>",
      "color": "#0190FF",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Dutch Blockchain Week",
      "entity": "f93947cd-c725-4e1f-aa5e-7473fe0dff0c",
      "content":
          "<p> \n                                                    \"... physical event of BCNL at ASML, we will also have tens of ecosysteem events all over The Netherlands during this week!\"\n                                             </p>",
      "color": "#3468D1",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "K:offee with Kadena",
      "entity": "165899a2-a6b1-46fd-9209-f78e1c976aaf",
      "content":
          "<p> \n                                                    \"We'll be joined by our hosts @KadenaDave and @RyanJLevy to talk about #DeFi on Kadena, with guests from the ecosystem,\" at 6 PM (UTC).\n                                             </p>",
      "color": "#B242A8",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "DApp Connect Night",
      "entity": "f2852cd6-2cb0-42fa-b709-71ebd1f6dc30",
      "content":
          "<p> \n                                                    \"DApp Connect Night by ZetaChain x TokenPocket x Sushi | 20 Kinds of Food | Talks | Networking | Live Dapp Demos,\" at 5 PM (GMT+3).\n                                             </p>",
      "color": "#FA51A0",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "DApp Connect Night",
      "entity": "f2852cd6-2cb0-42fa-b709-71ebd1f6dc30",
      "content":
          "<p> \n                                                    \"DApp Connect Night by ZetaChain x TokenPocket x Sushi... Talks | Networking | Live Dapp Demos,\" at 5 PM (GMT+3).\n                                             </p>",
      "color": "#FA51A0",
      "scheduled_for": "2023-11-13T00:00:00Z"
    },
    {
      "title": "Avalanche House Istanbul",
      "entity": "94ea4dfc-22a7-42f1-aed3-cf1b6d57feda",
      "content":
          "<p> \n                                                    \"... esteemed speakers, captivating performances, interactive art, and gaming activations all carefully curated to...,\" at 10 AM (GMT+3).\n                                             </p>",
      "color": "#A159A1",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Avalanche House Istanbul",
      "entity": "6d60b636-0c28-459e-9a05-579333b8e1c3",
      "content":
          "<p> \n                                                    \"... esteemed speakers, captivating performances, interactive art, and gaming activations all carefully curated to...,\" at 10 AM (GMT+3).\n                                             </p>",
      "color": "#E84142",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Avalanche House Istanbul",
      "entity": "67778af9-108c-4794-8c23-6a30739e8b2d",
      "content":
          "<p> \n                                                    \"... esteemed speakers, captivating performances, interactive art, and gaming activations all carefully curated to...,\" at 10 AM (GMT+3).\n                                             </p>",
      "color": "#F2716A",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "DBS",
      "entity": "b7bae285-b965-477d-b524-0ca88a41f94e",
      "content":
          "<p> \n                                                    \"Discover how Hedera is simplifying B2B connections, ensuring transparent and sustainable assets, boosting customer...,\" at 6 PM (CST).\n                                             </p>",
      "color": "#000000",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Future of Digital Assets",
      "entity": "06e346af-4c41-43f6-9990-94ec1c5bad3d",
      "content":
          "<p> \n                                                    \"Web3 leaders and investors come to meet the Wall Street firms charting the future of Digital Assets.\"\n                                             </p>",
      "color": "#A91970",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Future of Digital Assets",
      "entity": "6d60b636-0c28-459e-9a05-579333b8e1c3",
      "content":
          "<p> \n                                                    \"Web3 leaders and investors come to meet the Wall Street firms charting the future of Digital Assets.\"\n                                             </p>",
      "color": "#E84142",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Future of Digital Assets",
      "entity": "157f4ede-6c84-423f-ac5f-11ec28f90430",
      "content":
          "<p> \n                                                    \"Web3 leaders and investors come to meet the Wall Street firms charting the future of Digital Assets.\"\n                                             </p>",
      "color": "#0555D5",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Future of Digital Assets",
      "entity": "3d673df0-6df8-4dd3-a8c0-9feb2ba7d63a",
      "content":
          "<p> \n                                                    \"Web3 leaders and investors come to meet the Wall Street firms charting the future of Digital Assets.\"\n                                             </p>",
      "color": "#375BD2",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Future of Digital Assets",
      "entity": "22bd0cdf-0fc7-4a52-923b-60bc03d98064",
      "content":
          "<p> \n                                                    \"Web3 leaders and investors come to meet the Wall Street firms charting the future of Digital Assets.\"\n                                             </p>",
      "color": "#29ABE2",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Future of Digital Assets",
      "entity": "8b0a3194-af01-4837-bbb5-1d368f2e3188",
      "content":
          "<p> \n                                                    \"Web3 leaders and investors come to meet the Wall Street firms charting the future of Digital Assets.\"\n                                             </p>",
      "color": "#FF0A12",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Future of Digital Assets",
      "entity": "8b0a3194-af01-4837-bbb5-1d368f2e3188",
      "content":
          "<p> \n                                                    \"Web3 leaders and investors come to meet the Wall Street firms charting the future of Digital Assets.\"\n                                             </p>",
      "color": "#FF0A12",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Onchain Summit",
      "entity": "94ea4dfc-22a7-42f1-aed3-cf1b6d57feda",
      "content":
          "<p> \n                                                    \"​The event features curated content, panels, and technical workshops for builders and creators excited about scaling the OP Stack...\"\n                                             </p>",
      "color": "#A159A1",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Onchain Summit",
      "entity": "777c287e-d041-492b-b2ba-e952d690d62e",
      "content":
          "<p> \n                                                    \"​The event features curated content, panels, and technical workshops for builders and creators excited about scaling the OP Stack...\"\n                                             </p>",
      "color": "#356DF3",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Onchain Summit",
      "entity": "fd672ebd-e415-4dc6-8a3d-e03ba334a4f0",
      "content":
          "<p> \n                                                    \"​The event features curated content, panels, and technical workshops for builders and creators excited about scaling the OP Stack...\"\n                                             </p>",
      "color": "#141414",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Onchain Summit",
      "entity": "16a4973c-20df-470e-a263-5d2925569dbb",
      "content":
          "<p> \n                                                    \"​The event features curated content, panels, and technical workshops for builders and creators excited about scaling the OP Stack...\"\n                                             </p>",
      "color": "#FF9AA7",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Onchain Summit",
      "entity": "5ab82bf2-3836-45b5-8156-d34a10d98aa8",
      "content":
          "<p> \n                                                    \"​The event features curated content, panels, and technical workshops for builders and creators excited about scaling the OP Stack...\"\n                                             </p>",
      "color": "#E35169",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Sustainable Web3 SG 2023",
      "entity": "22bd0cdf-0fc7-4a52-923b-60bc03d98064",
      "content":
          "<p> \n                                                    \"... facilitate in-depth discussions on key topics, such as sustainable Web3, Decentralised Physical Infrastructure Networks (DePIN)...\"\n                                             </p>",
      "color": "#29ABE2",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Devconnect IST: BID",
      "entity": "0dc0a424-a879-4aab-854c-38c5222ed3f2",
      "content":
          "<p> \n                                                    \"The Responsible Revolution Day focuses on pragmatically supporting impact-driven startups, emphasizing the benefits they bring to society\"\n                                             </p>",
      "color": "#7B43D9",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Staking Gathering 2023",
      "entity": "fd672ebd-e415-4dc6-8a3d-e03ba334a4f0",
      "content":
          "<p> \n                                                    \"... an electrifying two-day event where we unravel the intricacies of staking and its ever-evolving landscape.\"\n                                             </p>",
      "color": "#141414",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Staking Gathering 2023",
      "entity": "65bec2b7-aa34-41ac-978b-40c7b69c3803",
      "content":
          "<p> \n                                                    \"... an electrifying two-day event where we unravel the intricacies of staking and its ever-evolving landscape.\"\n                                             </p>",
      "color": "#FF6A60",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Staking Gathering 2023",
      "entity": "b327c609-e030-4c8a-820b-6f12cbd3765c",
      "content":
          "<p> \n                                                    \"... an electrifying two-day event where we unravel the intricacies of staking and its ever-evolving landscape.\"\n                                             </p>",
      "color": "#5B6DEE",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "SZN7 Rarity Farming",
      "entity": "38998d9a-6b6d-40a9-963c-e2ebc4d482e5",
      "content":
          "<p> \n                                                    \"Rarity Farming SZN7 officially begins... 9PM EST | 2PM UTC\"\n                                             </p>",
      "color": "#FA35F3",
      "scheduled_for": "2023-11-14T00:00:00Z"
    },
    {
      "title": "Partnership X Spaces",
      "entity": "d97d01b0-38ce-420f-9818-57bac83a1150",
      "content":
          "<p> \n                                                    \"... discuss the incredible partnership between The Tezos Foundation and Musée d'Orsay alongside the launch...,\" at 6:30 PM (GMT).\n                                             </p>",
      "color": "#2C9BF7",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Kadena Campfire",
      "entity": "165899a2-a6b1-46fd-9209-f78e1c976aaf",
      "content":
          "<p> \n                                                    \"Big campfire coming next week! #NewKadena means more transparency, communication, and updates,\" at 5 PM (UTC).\n                                             </p>",
      "color": "#B242A8",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Infra Gardens Istanbul",
      "entity": "8474090c-b321-423c-b113-d58227dc8126",
      "content":
          "<p> \n                                                    \"... join a selected crowd of founders, builders, developers across ecosystems, verticals and layers of web3...,\" at 12:30 PM (GMT+3).\n                                             </p>",
      "color": "#20202F",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Infra Gardens Istanbul",
      "entity": "06c3320a-ff0d-4b2a-9bba-100ac06481bb",
      "content":
          "<p> \n                                                    \"... join a selected crowd of founders, builders, developers across ecosystems, verticals and layers of web3...,\" at 12:30 PM (GMT+3).\n                                             </p>",
      "color": "#008C73",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Infra Gardens Istanbul",
      "entity": "0dc0a424-a879-4aab-854c-38c5222ed3f2",
      "content":
          "<p> \n                                                    \"... join a selected crowd of founders, builders, developers across ecosystems, verticals and layers of web3...,\" at 12:30 PM (GMT+3).\n                                             </p>",
      "color": "#7B43D9",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Infra Gardens Istanbul",
      "entity": "d1a3123e-3645-4366-8a50-d4cf88112fed",
      "content":
          "<p> \n                                                    \"... join a selected crowd of founders, builders, developers across ecosystems, verticals and layers of web3...,\" at 12:30 PM (GMT+3).\n                                             </p>",
      "color": "#6747ED",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "UnStable Summit",
      "entity": "94ea4dfc-22a7-42f1-aed3-cf1b6d57feda",
      "content":
          "<p> \n                                                    \"The global stable coin conference.... @ Devconnect Babylon Bomonti, Istanbul.\"\n                                             </p>",
      "color": "#A159A1",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "UnStable Summit",
      "entity": "68fd8013-ceb5-4ab0-afa9-412f6bbd25da",
      "content":
          "<p> \n                                                    \"The global stable coin conference.... @ Devconnect Babylon Bomonti, Istanbul.\"\n                                             </p>",
      "color": "#E79787",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "UnStable Summit",
      "entity": "820f5d29-13cd-4c7a-bd4b-45427a6150fe",
      "content":
          "<p> \n                                                    \"The global stable coin conference.... @ Devconnect Babylon Bomonti, Istanbul.\"\n                                             </p>",
      "color": "#00E8F7",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "UnStable Summit",
      "entity": "680fd558-62d1-440a-9619-c72b6a227014",
      "content":
          "<p> \n                                                    \"The global stable coin conference.... @ Devconnect Babylon Bomonti, Istanbul.\"\n                                             </p>",
      "color": "#F3A727",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "UnStable Summit",
      "entity": "46978e31-c57f-48e4-b87d-6069b7abe9cb",
      "content":
          "<p> \n                                                    \"The global stable coin conference.... @ Devconnect Babylon Bomonti, Istanbul.\"\n                                             </p>",
      "color": "#35D080",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "UnStable Summit",
      "entity": "66796007-3455-4a99-8ef0-154f008302f8",
      "content":
          "<p> \n                                                    \"The global stable coin conference.... @ Devconnect Babylon Bomonti, Istanbul.\"\n                                             </p>",
      "color": "#65C7B5",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "UnStable Summit",
      "entity": "2f85e6bd-e1f0-4944-ac98-1881f505bde6",
      "content":
          "<p> \n                                                    \"The global stable coin conference.... @ Devconnect Babylon Bomonti, Istanbul.\"\n                                             </p>",
      "color": "#00D1FF",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Spartan Space",
      "entity": "2f85e6bd-e1f0-4944-ac98-1881f505bde6",
      "content":
          "<p> \n                                                    \"... dive into Valio, an asset management platform that enables users to delegate to managers, and discuss their...,\" at 4 PM (UTC).\n                                             </p>",
      "color": "#00D1FF",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "AMA with Co-founder",
      "entity": "d97d01b0-38ce-420f-9818-57bac83a1150",
      "content":
          "<p> \n                                                    Tezos holds an AMA with its co-founder @ArthurB at 17:00 (UTC). Participants can ask questions in real-time or by using #TezosAMA.\n                                             </p>",
      "color": "#2C9BF7",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "NvirWorld Web3 Studio AMA",
      "entity": "22bd0cdf-0fc7-4a52-923b-60bc03d98064",
      "content":
          "<p> \n                                                    \"NvirWorld, ICP, Project Seed, Shentu x AMA with Crypto Attacks DAO... Live Broadcast at 10:00 AM (UTC)\"\n                                             </p>",
      "color": "#29ABE2",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Arbitrum Day",
      "entity": "ca21f0fb-dee8-4c5c-9844-41474835cdcf",
      "content":
          "<p> \n                                                    \"... event filled with keynotes, panel discussions, technical workshops, governance talks, and more.\"\n                                             </p>",
      "color": "#3399FF",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "SmileyWorld Partnership",
      "entity": "b9487516-f57d-4386-a3d5-c6c236df50f3",
      "content":
          "<p> \n                                                    \"Smiley, the renowned fashion and lifestyle brand, is hitting the virtual streets of Decentraland fresh off their groundbreaking NFT...\"\n                                             </p>",
      "color": "#FF3C55",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "Blockchain Jungle 2023",
      "entity": "0dc0a424-a879-4aab-854c-38c5222ed3f2",
      "content":
          "<p> \n                                                    \"... A day of inspiring talks, interactive workshops, and collaborative sessions that will reshape the future of blockchain...\"\n                                             </p>",
      "color": "#7B43D9",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "IdOS Connect",
      "entity": "5d524370-8055-4cb8-a80f-4a39df2b7af2",
      "content":
          "<p> \n                                                    \"​​​Listen to panels about Identity, User Data, and Privacy led by industry experts ​​​Network, have drinks...,\" from 3 to 9 PM (GMT+3).\n                                             </p>",
      "color": "#E6E6E6",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "Status Reborn: AMA",
      "entity": "b327c609-e030-4c8a-820b-6f12cbd3765c",
      "content":
          "<p> \n                                                    \"... get as excited about our new direction and new apps as we are!! That's why we're holding an AMA live...,\" at 4 PM (UTC).\n                                             </p>",
      "color": "#5B6DEE",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "DS Summit",
      "entity": "06c3320a-ff0d-4b2a-9bba-100ac06481bb",
      "content":
          "<p> \n                                                    \"Decentralized Scaling Summit... immerse yourself in workshops, panels and talks about privacy, consumer applications, interoperability...\"\n                                             </p>",
      "color": "#008C73",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "DS Summit",
      "entity": "df7b1b11-4e59-48f8-bc47-4bcb60a0102f",
      "content":
          "<p> \n                                                    \"Decentralized Scaling Summit... immerse yourself in workshops, panels and talks about privacy, consumer applications, interoperability...\"\n                                             </p>",
      "color": "#01E6A0",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "ICP.Hub CryptoFriday",
      "entity": "22bd0cdf-0fc7-4a52-923b-60bc03d98064",
      "content":
          "<p> \n                                                    \"ICP Hub Turkey will unveil their incredible mission to propel ICP adoption in Turkey and worldwide, with a sneak peek...,\" at 7 PM (GMT+3).\n                                             </p>",
      "color": "#29ABE2",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "WalletConnect Dev Update",
      "entity": "b7bae285-b965-477d-b524-0ca88a41f94e",
      "content":
          "<p> \n                                                    Join the Hedera @WalletConnect Working Group on Spaces for a deep insight into their ongoing projects at 11 AM (ET).\n                                             </p>",
      "color": "#000000",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "PrivConnect",
      "entity": "39873f66-6f4c-49c2-bfd7-580cd3af26db",
      "content":
          "<p> \n                                                    \"Join us... for a deep dive into the most pressing privacy issues. Discover technological solutions from our members...,\" at 12:00.\n                                             </p>",
      "color": "#1C1C1C",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "Open Data Günü",
      "entity": "a3c45bf3-2b9d-466c-a843-970c9af62bd8",
      "content":
          "<p> \n                                                    \"... delves deep into Web3 data, bridging blockchain insights with app-level verticals and AI intersections... gather, network, learn...\"\n                                             </p>",
      "color": "#D82122",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "Open Data Günü",
      "entity": "6afc4c24-86f0-40e4-972e-ad1f44f28a99",
      "content":
          "<p> \n                                                    \"... delves deep into Web3 data, bridging blockchain insights with app-level verticals and AI intersections... gather, network, learn...\"\n                                             </p>",
      "color": "#626362",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "Open Data Günü",
      "entity": "6d60b636-0c28-459e-9a05-579333b8e1c3",
      "content":
          "<p> \n                                                    \"... delves deep into Web3 data, bridging blockchain insights with app-level verticals and AI intersections... gather, network, learn...\"\n                                             </p>",
      "color": "#E84142",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "Open Data Günü",
      "entity": "0dc0a424-a879-4aab-854c-38c5222ed3f2",
      "content":
          "<p> \n                                                    \"... delves deep into Web3 data, bridging blockchain insights with app-level verticals and AI intersections... gather, network, learn...\"\n                                             </p>",
      "color": "#7B43D9",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "Open Data Günü",
      "entity": "ce19bfdc-f1d7-43c8-8335-766aa5ebe4f9",
      "content":
          "<p> \n                                                    \"... delves deep into Web3 data, bridging blockchain insights with app-level verticals and AI intersections... gather, network, learn...\"\n                                             </p>",
      "color": "#9684F3",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "Open Data Günü",
      "entity": "5d524370-8055-4cb8-a80f-4a39df2b7af2",
      "content":
          "<p> \n                                                    \"... delves deep into Web3 data, bridging blockchain insights with app-level verticals and AI intersections... gather, network, learn...\"\n                                             </p>",
      "color": "#E6E6E6",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "Open Data Günü",
      "entity": "4be97fd5-bd79-4bcc-bdbf-6b8001c75eea",
      "content":
          "<p> \n                                                    \"... delves deep into Web3 data, bridging blockchain insights with app-level verticals and AI intersections... gather, network, learn...\"\n                                             </p>",
      "color": "#01B2EC",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "Open Data Günü",
      "entity": "d1a3123e-3645-4366-8a50-d4cf88112fed",
      "content":
          "<p> \n                                                    \"... delves deep into Web3 data, bridging blockchain insights with app-level verticals and AI intersections... gather, network, learn...\"\n                                             </p>",
      "color": "#6747ED",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "YGG Web3 Games Summit",
      "entity": "157f4ede-6c84-423f-ac5f-11ec28f90430",
      "content":
          "<p> \n                                                    \"... Join us for a week of high profile talks, a huge gaming expo, and esports tournaments to watch out for!\"\n                                             </p>",
      "color": "#0555D5",
      "scheduled_for": "2023-11-18T00:00:00Z"
    },
    {
      "title": "Light Client Summit",
      "entity": "46978e31-c57f-48e4-b87d-6069b7abe9cb",
      "content":
          "<p> \n                                                    \"... interact with contributors to the light client ecosystem for project presentations and protocol discussions...,\" at 10 AM (UTC+3).\n                                             </p>",
      "color": "#35D080",
      "scheduled_for": "2023-11-18T00:00:00Z"
    },
    {
      "title": "Devconnect Istanbul",
      "entity": "ca21f0fb-dee8-4c5c-9844-41474835cdcf",
      "content":
          "<p> \n                                                    \"Devconnect is a week-long gathering of independent Ethereum events to learn, share, and make progress together.\"\n                                             </p>",
      "color": "#3399FF",
      "scheduled_for": "2023-11-19T00:00:00Z"
    },
    {
      "title": "Devconnect Istanbul",
      "entity": "3d673df0-6df8-4dd3-a8c0-9feb2ba7d63a",
      "content":
          "<p> \n                                                    \"Devconnect is a week-long gathering of independent Ethereum events to learn, share, and make progress together.\"\n                                             </p>",
      "color": "#375BD2",
      "scheduled_for": "2023-11-19T00:00:00Z"
    },
    {
      "title": "Devconnect Istanbul",
      "entity": "5ab82bf2-3836-45b5-8156-d34a10d98aa8",
      "content":
          "<p> \n                                                    \"Devconnect is a week-long gathering of independent Ethereum events to learn, share, and make progress together.\"\n                                             </p>",
      "color": "#E35169",
      "scheduled_for": "2023-11-19T00:00:00Z"
    },
    {
      "title": "Devconnect Istanbul",
      "entity": "d1a3123e-3645-4366-8a50-d4cf88112fed",
      "content":
          "<p> \n                                                    \"Devconnect is a week-long gathering of independent Ethereum events to learn, share, and make progress together.\"\n                                             </p>",
      "color": "#6747ED",
      "scheduled_for": "2023-11-19T00:00:00Z"
    },
    {
      "title": "Delegation Program",
      "entity": "3fc36e08-2f30-4b93-aa81-e1b6109e7f89",
      "content":
          "<p> \n                                                    The Evmos Foundation Delegation program is live and accepting applications.\n                                             </p>",
      "color": "#B40028",
      "scheduled_for": "2023-11-19T00:00:00Z"
    }
  ]
];

//! ACTIONS:
//! AUTHOR
//! ICON
//! CONTENT