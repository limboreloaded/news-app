import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

void main() async {
  final Dio dio = Dio();

  final formattedEvents = [];

  final savedTweets = {};
  final savedActions = {};

  final tweetsResponse = await dio.get("https://dash.blocktalk.tv/items/tweet",
      options: Options(headers: {
        "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
      }));

  final actionsResponse =
      await dio.get("https://dash.blocktalk.tv/items/action",
          options: Options(headers: {
            "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
          }));

  List staticEvents = [
    {
      "title": "Partnership X Spaces",
      "entity": "d97d01b0-38ce-420f-9818-57bac83a1150",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"... discuss the incredible partnership between The Tezos Foundation and Musée d'Orsay alongside the launch...,\" at 6:30 PM (GMT).\n                                             </p>",
      "color": "#2C9BF7",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Kadena Campfire",
      "entity": "165899a2-a6b1-46fd-9209-f78e1c976aaf",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"Big campfire coming next week! #NewKadena means more transparency, communication, and updates,\" at 5 PM (UTC).\n                                             </p>",
      "color": "#B242A8",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "UnStable Summit",
      "entity": "94ea4dfc-22a7-42f1-aed3-cf1b6d57feda",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    \"The global stable coin conference.... @ Devconnect Babylon Bomonti, Istanbul.\"\n                                             </p>",
      "color": "#A159A1",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Infra Gardens Istanbul",
      "entity": "8474090c-b321-423c-b113-d58227dc8126",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"... join a selected crowd of founders, builders, developers across ecosystems, verticals and layers of web3...,\" at 12:30 PM (GMT+3).\n                                             </p>",
      "color": "#20202F",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Spartan Space",
      "entity": "2f85e6bd-e1f0-4944-ac98-1881f505bde6",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    \"... dive into Valio, an asset management platform that enables users to delegate to managers, and discuss their...,\" at 4 PM (UTC).\n                                             </p>",
      "color": "#00D1FF",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "J.P. Morgan Partnership",
      "entity": "6d60b636-0c28-459e-9a05-579333b8e1c3",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"Onyx by J.P. Morgan Leverages Avalanche Evergreen\"\n                                             </p>",
      "color": "#E84142",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "L2DAYS Istanbul",
      "entity": "94ea4dfc-22a7-42f1-aed3-cf1b6d57feda",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    \"Our curated agenda zeroes in on technological innovations and security frontiers, all within the larger framework of Devconnect Istanbul.\"\n                                             </p>",
      "color": "#A159A1",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Genesis XBT",
      "entity": "345eb243-2c0b-4ee3-a70f-8668cd8b3f5c",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"... bring together market makers, miners, family offices, regulators, traders, developers, global crypto thought-leaders...\"\n                                             </p>",
      "color": "#F0B90B",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "AMA with Co-founder",
      "entity": "d97d01b0-38ce-420f-9818-57bac83a1150",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    Tezos holds an AMA with its co-founder @ArthurB at 17:00 (UTC). Participants can ask questions in real-time or by using #TezosAMA.\n                                             </p>",
      "color": "#2C9BF7",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "NvirWorld Web3 Studio AMA",
      "entity": "22bd0cdf-0fc7-4a52-923b-60bc03d98064",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"NvirWorld, ICP, Project Seed, Shentu x AMA with Crypto Attacks DAO... Live Broadcast at 10:00 AM (UTC)\"\n                                             </p>",
      "color": "#29ABE2",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Web3 Builders Brunch",
      "entity": "a3c45bf3-2b9d-466c-a843-970c9af62bd8",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    \"​​​Fuel your creativity and mingle with fellow web3 builders and founders at our builders meetup!\"\n                                             </p>",
      "color": "#D82122",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Tezos Live AMA",
      "entity": "d97d01b0-38ce-420f-9818-57bac83a1150",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    Tezos Co-Founder, @ArthurB will host a live AMA session. Questions can be submitted live or using #TezosAMA.\n                                             </p>",
      "color": "#2C9BF7",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Ideathon Second Session",
      "entity": "add35259-ebdd-443b-b3cb-cae10c64561d",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    Second session of the Astar-powered Ideathon covering motivation and non-DeFi web3 use cases.\n                                             </p>",
      "color": "#3368FF",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Ethereum 2030",
      "entity": "f2f3ffc9-8028-4902-9732-4975a86ef217",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    \"... half-day of engaging keynote speeches, in-depth panel discussions, valuable networking opportunities, and audience engagement...\"\n                                             </p>",
      "color": "#4F78EA",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Partnership with DWF Labs",
      "entity": "430a290d-8b8c-4c7f-83d4-66ab10e8506e",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    Kava has entered into a strategic partnership with DWFLabs to boost its DeFi ecosystem.\n                                             </p>",
      "color": "#FF4039",
      "scheduled_for": "2023-11-15T00:00:00Z"
    },
    {
      "title": "Arbitrum Day",
      "entity": "ca21f0fb-dee8-4c5c-9844-41474835cdcf",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"... event filled with keynotes, panel discussions, technical workshops, governance talks, and more.\"\n                                             </p>",
      "color": "#3399FF",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "SmileyWorld Partnership",
      "entity": "b9487516-f57d-4386-a3d5-c6c236df50f3",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    \"Smiley, the renowned fashion and lifestyle brand, is hitting the virtual streets of Decentraland fresh off their groundbreaking NFT...\"\n                                             </p>",
      "color": "#FF3C55",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "Indodax Listing",
      "entity": "5ab82bf2-3836-45b5-8156-d34a10d98aa8",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    Indodax lists OP (@optimismFND) with OP/USDT at 2:00 PM (UTC+7).\n                                             </p>",
      "color": "#E35169",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "Blockchain Jungle 2023",
      "entity": "0dc0a424-a879-4aab-854c-38c5222ed3f2",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"... A day of inspiring talks, interactive workshops, and collaborative sessions that will reshape the future of blockchain...\"\n                                             </p>",
      "color": "#7B43D9",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "IdOS Connect",
      "entity": "5d524370-8055-4cb8-a80f-4a39df2b7af2",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"​​​Listen to panels about Identity, User Data, and Privacy led by industry experts ​​​Network, have drinks...,\" from 3 to 9 PM (GMT+3).\n                                             </p>",
      "color": "#E6E6E6",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "Status Reborn: AMA",
      "entity": "b327c609-e030-4c8a-820b-6f12cbd3765c",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    \"... get as excited about our new direction and new apps as we are!! That's why we're holding an AMA live...,\" at 4 PM (UTC).\n                                             </p>",
      "color": "#5B6DEE",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "DS Summit",
      "entity": "06c3320a-ff0d-4b2a-9bba-100ac06481bb",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    \"Decentralized Scaling Summit... immerse yourself in workshops, panels and talks about privacy, consumer applications, interoperability...\"\n                                             </p>",
      "color": "#008C73",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "SALT IConnections Asia",
      "entity": "06e346af-4c41-43f6-9990-94ec1c5bad3d",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"... convenes over 1,000 of the world's leading alternative investment managers, entrepreneurs and policymakers...\"\n                                             </p>",
      "color": "#A91970",
      "scheduled_for": "2023-11-16T00:00:00Z"
    },
    {
      "title": "Dutch Blockchain Week",
      "entity": "f93947cd-c725-4e1f-aa5e-7473fe0dff0c",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"... physical event of BCNL at ASML, we will also have tens of ecosysteem events all over The Netherlands during this week!\"\n                                             </p>",
      "color": "#3468D1",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "ICP.Hub CryptoFriday",
      "entity": "22bd0cdf-0fc7-4a52-923b-60bc03d98064",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"ICP Hub Turkey will unveil their incredible mission to propel ICP adoption in Turkey and worldwide, with a sneak peek...,\" at 7 PM (GMT+3).\n                                             </p>",
      "color": "#29ABE2",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "LabWeek23",
      "entity": "972059b4-6db4-480f-91ad-bb570164a8db",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"... Builders, thinkers, innovators and leaders to share research and participate in a dynamic program of engineering workshops, summits...\"\n                                             </p>",
      "color": "#0190FF",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "WalletConnect Dev Update",
      "entity": "b7bae285-b965-477d-b524-0ca88a41f94e",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    Join the Hedera @WalletConnect Working Group on Spaces for a deep insight into their ongoing projects at 11 AM (ET).\n                                             </p>",
      "color": "#000000",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "PrivConnect",
      "entity": "39873f66-6f4c-49c2-bfd7-580cd3af26db",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"Join us... for a deep dive into the most pressing privacy issues. Discover technological solutions from our members...,\" at 12:00.\n                                             </p>",
      "color": "#1C1C1C",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "Open Data Günü",
      "entity": "a3c45bf3-2b9d-466c-a843-970c9af62bd8",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    \"... delves deep into Web3 data, bridging blockchain insights with app-level verticals and AI intersections... gather, network, learn...\"\n                                             </p>",
      "color": "#D82122",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "Singapore Fintech Fest",
      "entity": "06e346af-4c41-43f6-9990-94ec1c5bad3d",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"Hear from 800+ speakers across 7 stages at SFF. Global public and private sector leaders will convene on the Festival Stage to shape...\"\n                                             </p>",
      "color": "#A91970",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "ETHGlobal Istanbul",
      "entity": "a3c45bf3-2b9d-466c-a843-970c9af62bd8",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    ETHGlobal Istanbul is an event bringing together some of the top minds and experts in Ethereum Ecosystem to Istanbul.\n                                             </p>",
      "color": "#D82122",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "Game Launch On HyperPlay",
      "entity": "38998d9a-6b6d-40a9-963c-e2ebc4d482e5",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    Spirit Force Arena, a Battle Royale game built on Aavegotchi, soft-launches on HyperPlay Gaming platform at 5 PM (UTC).\n                                             </p>",
      "color": "#FA35F3",
      "scheduled_for": "2023-11-17T00:00:00Z"
    },
    {
      "title": "YGG Web3 Games Summit",
      "entity": "157f4ede-6c84-423f-ac5f-11ec28f90430",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    \"... Join us for a week of high profile talks, a huge gaming expo, and esports tournaments to watch out for!\"\n                                             </p>",
      "color": "#0555D5",
      "scheduled_for": "2023-11-18T00:00:00Z"
    },
    {
      "title": "Light Client Summit",
      "entity": "46978e31-c57f-48e4-b87d-6069b7abe9cb",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"... interact with contributors to the light client ecosystem for project presentations and protocol discussions...,\" at 10 AM (UTC+3).\n                                             </p>",
      "color": "#35D080",
      "scheduled_for": "2023-11-18T00:00:00Z"
    },
    {
      "title": "Devconnect Istanbul",
      "entity": "ca21f0fb-dee8-4c5c-9844-41474835cdcf",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    \"Devconnect is a week-long gathering of independent Ethereum events to learn, share, and make progress together.\"\n                                             </p>",
      "color": "#3399FF",
      "scheduled_for": "2023-11-19T00:00:00Z"
    },
    {
      "title": "Delegation Program",
      "entity": "3fc36e08-2f30-4b93-aa81-e1b6109e7f89",
      "entity_type": "chain",
      "content":
          "<p> \n                                                    The Evmos Foundation Delegation program is live and accepting applications.\n                                             </p>",
      "color": "#B40028",
      "scheduled_for": "2023-11-19T00:00:00Z"
    },
    {
      "title": "DIA & Origin Talk",
      "entity": "819ff934-9f85-4b54-9569-91d733e6d0e7",
      "entity_type": "dapp",
      "content":
          "<p> \n                                                    Join DIAdata_org as they discuss how DIA's oracles power new DeFi use cases for Origin Protocol at 3 PM (UTC).\n                                             </p>",
      "color": "#1A82FF",
      "scheduled_for": "2023-11-21T00:00:00Z"
    }
  ];

  for (dynamic event in staticEvents) {
    dynamic tokenEntry;

    if (event["entity_type"] == "chain") {
      tokenEntry = await getChainEntry(event["entity"], dio);
    } else {
      tokenEntry = await getDappEntry(event["entity"], dio);
    }

    final tweetEntry =
        findTweetEntry(tweetsResponse.data["data"], tokenEntry["token_name"]);

    final actionEntry =
        findActionEntry(actionsResponse.data["data"], tokenEntry["token_name"]);

    if (tweetEntry != null) savedTweets[event["id"]] = tweetEntry;
    if (actionEntry != null) savedActions[event["id"]] = actionEntry;
  }

  for (dynamic event in staticEvents) {
    formattedEvents.add({
      "title": event["title"],
      "content": event["content"],
      "color": event["color"],
      "scheduled_for": event["scheduled_for"],
      "entity": [
        {"item": event["entity"], "collection": event["entity_type"]},
        {"item": savedActions[event["id"]], "collection": "action"},
        {"item": savedTweets[event["id"]], "collection": "tweet"}
      ]
    });
  }

  for (dynamic event in formattedEvents) {
    dynamic baseEvent = {
      "title": event["title"],
      "content": event["content"],
      "color": event["color"],
      "scheduled_for": event["scheduled_for"],
      "entity": []
    };

    final response = await dio.post("https://dash.blocktalk.tv/items/event",
        data: jsonEncode(baseEvent),
        options: Options(headers: {
          "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM"
        }));

    dynamic responseData = response.data["data"];

    for (dynamic eventEntity in event["entity"]) {
      dynamic addedEntity = {
        "event_id": responseData["id"],
        "item": eventEntity["item"],
        "collection": eventEntity["collection"]
      };

      await dio.post("https://dash.blocktalk.tv/items/event_entity",
          data: jsonEncode(addedEntity),
          options: Options(headers: {
            "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM"
          }));

      print(
          "Uploaded event entity for event ${responseData["id"]} of type ${eventEntity["collection"]}");
    }

    sleep(const Duration(seconds: 2));
  }
}

dynamic getDappEntry(String id, Dio dio) async {
  final response = await dio.get("https://dash.blocktalk.tv/items/dapp/$id",
      options: Options(headers: {
        "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
      }));

  return response.data["data"];
}

dynamic getChainEntry(String id, Dio dio) async {
  final response = await dio.get("https://dash.blocktalk.tv/items/chain/$id",
      options: Options(headers: {
        "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
      }));

  return response.data["data"];
}

dynamic findTweetEntry(List tweets, String tokenName) {
  for (dynamic tweet in tweets) {
    if (tweet["content"].contains(tokenName)) {
      return tweet;
    }
  }
}

dynamic findActionEntry(List actions, String tokenName) {
  for (dynamic action in actions) {
    if (action["content"].contains(tokenName)) {
      return action;
    }
  }
}
