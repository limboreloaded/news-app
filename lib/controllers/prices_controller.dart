import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';
import 'package:bt_app/utils/tools.dart';
import 'package:bt_app/utils/dio.dart';

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

class AsyncPricesNotifier extends AsyncNotifier<List<CurrencyPillModel>> {
  @override
  Future<List<CurrencyPillModel>> build() async {
    final fetchedPrices = await _fetchPrices();

    await Future.delayed(const Duration(seconds: 1));
    return fetchedPrices;
  }

  Future<List<CurrencyPillModel>> _fetchPrices() async {
    final db = ref.read(AppDatabase.provider);

    try {
      await Future.delayed(const Duration(seconds: 1));

      List<CurrencyPillModel> pricesList = [];
      List<dynamic> fetchedPricesList = await db.getAllPrices();

      for (dynamic price in fetchedPricesList) {
        CurrencyPillModel formattedPrice = CurrencyPillModel.fromTable(price);
        pricesList.add(formattedPrice);
      }
      return pricesList;
    } catch (e) {
      return [];
    }
  }

  Future<void> populatePrices() async {
    final AppDatabase db = ref.read(AppDatabase.provider);
    final Dio dio = ref.read(dioProvider);

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

  Future<bool> canRefreshPrices() async {
    // final db = ref.read(AppDatabase.provider);
    // final Cron pricesUpdate = await db.getCronItem("prices");

    // DateTime now = DateTime.now();

    // if (now
    //     .subtract(const Duration(minutes: 1))
    //     .isBefore(DateTime.parse(pricesUpdate.lastUpdated))) {
    //   return true;
    // }
    // return false;
    return true;
  }
}

final pricesProvider =
    AsyncNotifierProvider<AsyncPricesNotifier, List<CurrencyPillModel>>(() {
  return AsyncPricesNotifier();
});
