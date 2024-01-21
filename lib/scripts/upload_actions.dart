//! ACTION FIELDS:
//! AUTHOR,
//! ICON,
//! CONTENT

// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:faker/faker.dart';

List<String> staticImageUrls = [
  "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
  "https://pbs.twimg.com/profile_images/1020076514635927554/wbpai876_400x400.jpg",
  "https://static.hiphopdx.com/2021/08/dr-dre-getty-1200x675.jpg",
  "https://image.shutterstock.com/image-photo/head-shot-portrait-close-smiling-260nw-1714666150.jpg",
  "https://t4.ftcdn.net/jpg/04/44/53/99/360_F_444539901_2GSnvmTX14LELJ6edPudUsarbcytOEgj.jpg",
  "https://www.shutterstock.com/image-photo/headshot-portrait-smiling-african-american-260nw-1667439898.jpg",
  "https://www.shutterstock.com/image-photo/headshot-portrait-happy-millennial-man-260nw-1548802709.jpg",
  "https://media.istockphoto.com/id/1311084168/photo/overjoyed-pretty-asian-woman-look-at-camera-with-sincere-laughter.jpg?s=612x612&w=0&k=20&c=akS4eKR3suhoP9cuk7_7ZVZrLuMMG0IgOQvQ5JiRmAg=",
  "https://static.vecteezy.com/system/resources/thumbnails/008/931/593/small/confident-cheerful-male-lawyer-reads-business-news-has-gentle-smile-dressed-in-formal-clothes-poses-in-urban-setting-businessman-checks-email-or-updates-profile-on-digital-tablet-computer-photo.JPG",
  "https://www.stockvault.net/data/2008/04/28/104979/preview16.jpg",
  "https://t3.ftcdn.net/jpg/01/73/77/00/360_F_173770068_LRQyNUZQn9WtQyJoJsOEwK8qwBzypBm0.jpg"
];

void main() async {
  final Dio dio = Dio();

  List generatedActions = [
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          " \$NEAR is showing strong bullish momentum, breaking through key resistance levels. Keep an eye on potential price continuation as the project gains attention for its innovative approach to decentralized applications.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$SCRT is experiencing increased trading activity, possibly due to recent developments in the Secret Network. Watch for potential breakout patterns and stay informed on project updates for strategic decisions.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$ONE is seeing heightened volatility with notable price fluctuations. Traders, be cautious and monitor market trends closely for potential trading opportunities. News catalysts may impact price action.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$DOGE is in the spotlight again with increased trading volume. Keep an eye on social media trends and possible influencers' mentions for potential price movements. Dogecoin memes may turn into trading opportunities!",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "The market for Kadena is displaying a bullish divergence. Traders, consider potential entry points as the project gains traction for its scalable and secure blockchain platform.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$MINA is making waves in the crypto space with innovative approaches to blockchain size. Stay tuned for updates and monitor price movements closely for potential trading opportunities."
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "Stacks is seeing increased interest as it continues to enhance decentralized applications on Bitcoin. Traders, assess potential entry points as the project gains momentum.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$ARB Market Action: Arbitrum is gaining attention for its role in Ethereum Layer 2 scaling. Keep an eye on developments, as this could impact trading activity. Traders, stay informed for strategic decisions.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "Aster is showing signs of upward momentum with increased trading volume. Traders, analyze potential entry points as the project gains attention for its unique approach to decentralized applications. ",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$GLMR Market Update: Glamour is catching the spotlight in the crypto market. Traders, monitor for potential trend reversals and stay informed on project developments as Glamour gains attention for its unique features.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$EVMOS is gaining attention for its unique approach to interoperability. Traders, keep an eye on potential price movements as the project continues to make waves in the crypto space."
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$OP is showing signs of increased trading activity. Watch for potential breakout patterns and stay informed on project updates for strategic trading decisions."
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "Kava is displaying positive market action, possibly fueled by recent developments in decentralized finance. Traders, assess potential entry points as the project gains traction in the DeFi space.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$LTC is experiencing notable price fluctuations. Traders, monitor market trends closely and stay updated on Litecoin's developments for potential trading opportunities.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "Technical Analysis: Cosmos is showing interesting technical patterns. Traders, consider potential entry points as the project gains attention for its innovative approach to blockchain interoperability. ",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$XTZ Market Update: Tezos is making waves with increased trading volume. Traders, analyze potential entry points as the project gains attention for its focus on smart contracts and decentralized applications.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$FIL is on the move with notable price changes. Traders, stay vigilant and monitor market trends closely for potential trading opportunities. News catalysts may influence price action. ",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$HBAR Alert: Hedera Hashgraph is attracting attention with increased trading activity. Traders, assess potential entry points and stay informed on project developments for strategic decisions.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$CELO Action: Celo is showing signs of upward momentum. Traders, analyze potential entry points as the project gains traction for its focus on mobile-friendly decentralized finance.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "Aurora Alert: \$AURORA is heating up in the crypto market. Traders, watch for potential trend reversals and stay informed on project updates as Aurora gains attention for its unique features.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "Market Update: Shiba Inu is experiencing a surge in trading activity, potentially influenced by recent developments. Traders, keep a close eye on the market for potential trading opportunities as SHIB gains attention."
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "Synthetix Alert: \$SNX is showing notable market action, possibly driven by increased interest in decentralized derivatives. Traders, assess potential entry points as Synthetix continues to innovate in the DeFi space."
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$API3 Surge: API3 is gaining momentum in the crypto market. Traders, watch for potential trend reversals and stay informed on project updates as API3 gains attention for its decentralized oracle solutions.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          " Badger DAO Alert: \$BADGER is on the move with increased trading volume. Traders, analyze potential entry points and stay updated on Badger DAO's developments for strategic trading decisions.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "iExec RLC Action: \$RLC is displaying market activity, possibly linked to advancements in decentralized cloud computing. Traders, assess potential entry points as iExec RLC gains attention for its role in the blockchain ecosystem.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@CryptoPro was followed by @TradeMaster, @BlockchainWhiz, @CryptoEnthusiast. Welcome to the crypto journey together! 🌐📈 #CryptoCommunity",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@TechInvestor was followed by @MarketInsider, @FinanceWhiz, @InvestmentGuru. A network of insights is forming! 📊💡 #InvestingNetwork",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@CryptoExplorer was followed by @TokenTracker, @DeFiPioneer, @NFTAdventurer. Embark on a decentralized adventure! 🚀🌐 #CryptoExploration",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@TechSavvy was followed by @InnovationGeek, @DigitalTrendsetter, @FutureTech. Dive into the latest tech trends together! 📱💻 #TechInnovation",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@MarketMaestro was followed by @TradingWiz, @ChartExpert, @InvestorInsight. The trading expertise network is expanding! 🔄💹 #MarketMasters",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@BlockchainBuff was followed by @CryptoCurator, @TokenTrendsetter, @DeFiDiscoverer. The blockchain insights circle is growing! 🔗📊 #BlockchainInsights",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@CryptoTraderX was followed by @AltcoinAficionado, @TokenEnthusiast, @NFTTrader. The crypto trading circle is getting stronger! 🔄📉 #CryptoTrading"
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@TechInnovator was followed by @DigitalInventor, @FutureTechLeader, @InnovationVisionary. Innovation is thriving in this network! 💡🌐 #TechInnovation",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@InvestmentPro was followed by @CryptoAnalyst, @StockStrategist, @MarketWizard. The investment expertise network is forming! 💼📈 #InvestmentInsights",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@NFTCollector was followed by @ArtEnthusiast, @DigitalCreator, @CryptoArtist. The NFT enthusiasts' network is expanding! 🎨🌐 #NFTCommunity",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@CryptoEnthusiast was followed by @BlockchainExplorer, @NFTGuru, @DecentralizedKing. Exciting times ahead in the crypto world! 🌐🔍",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@TechInnovator was followed by @FutureVisionary, @InnovationPioneer, @TechTrailblazer. Innovation is contagious, and this trio is making waves! 🚀💡",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@DigitalArtist was followed by @CreativeGenius, @NFTMastermind, @ArtisticExplorer. Brace yourselves for a masterpiece collaboration in the NFT space! 🎨🌐",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@EntrepreneurPro was followed by @StartupWhiz, @VentureMaven, @BizInnovator. The entrepreneurial journey is gaining more brilliant minds! 💼🚀",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@CryptoWatcher was followed by @MarketAnalyst, @TokenTrendsetter, @DeFiInsider. A powerhouse of crypto knowledge is assembling! Stay tuned for insights. 📊🚨",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@TechExplorer was followed by @AIInnovator, @TechFuturist, @QuantumTrailblazer. The tech universe is expanding with these visionaries leading the way! 🌐💻"
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@DataScientist was followed by @MachineLearningPro, @AnalyticsWhiz, @BigDataGuru. Data-driven minds converging for groundbreaking discoveries! 📈📊",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@Web3Pioneer was followed by @DecentralizedDev, @BlockchainBuilder, @SmartContractCoder. The future of the decentralized web is being crafted by these coding maestros! 🌐💻",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@InvestmentGuru was followed by @CryptoAnalyst, @StockMarketWhiz, @WealthBuilder. Financial wisdom is in abundance—prepare for insightful market analyses! 💹📊",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@SpaceExplorer was followed by @MarsPioneer, @GalacticAdventurer, @AstroInnovator. The cosmos is calling, and these pioneers are answering! 🌌🚀",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@CryptoPro was followed by @TradingGuru, @DigitalWhiz, @BlockchainKing. The crypto community is buzzing – are they onto the next big thing together? 🌐📈 #Crypto #FollowAlert"
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@TechInvestor was followed by @FutureTrader, @CoinResearcher, @BlockchainAnalyst. Are they forming a powerhouse of market insights? Stay tuned for collaborative insights! 📊💡 #Investing #FollowAlert",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@CryptoEnthusiast was followed by @NFTExplorer, @DeFiDynamo, @SmartContractor. The decentralized trio is assembling! What groundbreaking discussions are on the horizon? 🌐🤝 #CryptoCommunity #FollowAlert",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@ShortSeller was followed by @RiskManager, @BearishAnalyst, @OptionsWhiz. Is the bearish sentiment intensifying? Brace for potential market movements! 📉📊 #Trading #FollowAlert",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "@BlockchainDev was followed by @SmartContractor, @DeFiCoder, @CryptoEngineer. Is a collaborative project in the works? The blockchain minds are converging! 💻🚀 #Blockchain #FollowAlert",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$SNT has increased by 7.5%. The bulls are charging in the Status network! Keep an eye on potential momentum in the decentralized communication space. 🌐🚀 #SNT #CryptoUpdate"
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$ZRX has decreased by 3.2%. The 0x protocol is navigating a minor dip – is it a strategic entry point or a sign of market correction? Stay tuned for insights. 📊🔄 #ZRX #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$LOOKS has increased by 11.8%. The LOOKS token is catching eyes with a significant surge! What's driving the momentum in the decentralized beauty space? 👀🌐 #LOOKS #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$ANY has decreased by 4.6%. Anyswap is experiencing a slight dip. Is it a temporary pullback or an opportunity for strategic entry? Watch the decentralized cross-chain space closely. 🔄💹 #ANY #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$HOP has increased by 9.3%. HOPR is hopping into the spotlight with a notable surge! Is decentralized privacy gaining more attention? Stay informed on potential privacy trends. 🌐🕵️‍♂️ #HOP #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$MEAN has decreased by 2.8%. The Mean Finance protocol is navigating a minor downturn. Is this a momentary blip or a signal for a broader market adjustment? Watch for insights. 📊🔍 #MEAN #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$INDEX has increased by 5.6%. The Index Cooperative is seeing a positive shift – is decentralized index investing gaining popularity? Keep an eye on potential trends in this space. 🌐📈 #INDEX #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$PORT has decreased by 6.1%. The Portfolio token is experiencing a dip – is this a strategic entry point or a sign of market correction? Stay informed on the decentralized portfolio management space. 🔄📊 #PORT #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$PEFI has increased by 8.9%. The Penguin Finance token is soaring! What's driving the momentum in decentralized yield farming? Stay tuned for insights. 🚀💸 #PEFI #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$PERP has decreased by 3.4%. Perpetual Protocol is navigating a minor dip. Is this a tactical entry point or a signal for a broader market adjustment? Keep an eye on decentralized perpetual contracts. 🔄📉 #PERP #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$ORCA has increased by 6.7%. The Orca token is swimming into the spotlight with a notable surge! What's driving the momentum in the decentralized finance ecosystem? 🌊🚀 #ORCA #CryptoUpdate"
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$MLN has decreased by 4.2%. Melon Protocol is navigating a minor dip – is this a strategic entry point or a signal for a broader market adjustment? Stay tuned for insights. 📊🔄 #MLN #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$JOE has increased by 9.8%. The JOE token is brewing up a positive storm! What's percolating in the decentralized coffee farming space? Keep an eye on potential trends. ☕🌐 #JOE #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$YAK has decreased by 5.5%. The Yak token is experiencing a slight dip – is this a tactical entry point or a sign of market correction? Watch the decentralized yield farming space closely. 🔄💹 #YAK #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$ELK has increased by 7.1%. Elk Finance is leaping forward with a significant surge! What's propelling the momentum in decentralized finance? Stay informed on potential trends. 🌐🦌 #ELK #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$APT has decreased by 3.6%. The Apt token is navigating a minor downturn – is it a momentary blip or a signal for a broader market adjustment? Stay tuned for insights in the decentralized apartment space. 📊🏢 #APT #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$SDL has increased by 8.4%. The SDL token is surging with notable momentum! What's sparking interest in the decentralized storage space? Keep an eye on potential trends. 🚀🔐 #SDL #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$SFI has decreased by 6.2%. The Saffron Finance token is experiencing a dip – is this a strategic entry point or a sign of market correction? Stay informed on decentralized yield pools. 🔄📊 #SFI #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$ANGLE has increased by 5.9%. The Angle token is gaining angles with a positive shift! What's driving the momentum in decentralized finance? Stay tuned for insights. 🌐📈 #ANGLE #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$ANT has decreased by 4.9%. Aragon is navigating a minor dip – is this a tactical entry point or a signal for a broader market adjustment? Watch for insights in the decentralized governance space. 🔄📉 #ANT #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$REP has increased by 8.2%. Augur is making waves with a notable surge! What's driving the momentum in the decentralized prediction market space? Stay informed for potential insights. 🌐🚀 #REP #CryptoUpdate"
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$AXS has decreased by 3.5%. Axie Infinity is navigating a minor dip – is this a tactical entry point or a sign of market correction? Watch for insights in the decentralized gaming ecosystem. 🔄🎮 #AXS #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$BAL has increased by 6.9%. The Balancer token is balancing gains with a positive shift! What's propelling the momentum in decentralized liquidity pools? Keep an eye on potential trends. 🚀💧 #BAL #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$LINK has decreased by 4.8%. Chainlink is experiencing a slight dip – is this a strategic entry point or a signal for a broader market adjustment? Stay tuned for insights in the decentralized oracle space. 🔄🔗 #LINK #CryptoUpdate"
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "\$MUST has increased by 7.6%. The Must token is mustering strength with a significant surge! What's brewing in the decentralized lending and borrowing space? Stay informed for potential insights. 💸🌐 #MUST #CryptoUpdate",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 0x6B85aD4F6a7E86C349E1f16E44704e27104bDbC1 has purchased 150 COMP on Binance."
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🏠 0xFaCAdEe9876d3b8BeeF00232AbCdEf1234567890 has purchased 5000 MANA on Kraken."
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "⚙️ 0xAbCdEf1234567890BeEfAcEDeaDbEeF4567890123 has purchased 75 MTL on Coinbase Pro. Adding metal to the portfolio!",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "📦 0x987654321BeEfAcE1F2E3D4C5A6B7890aBcDeF12 has purchased 2000 STORJ on Gemini.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 0xBeEfCaFeDeAdBeEfBaAdDeEdC0De1234567890 has purchased 300 REQ on KuCoin. ",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 0xAbCdEf0123456789BeEfDeAdBaAdCaFeDc0De01 has purchased 1000 GRT on Bittrex.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "👻 0x987654321BeEfAcE1F2E3D4C5A6B7890aBcDeF12 has purchased 50 GNO on Bitstamp.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "👻 0xFaCAdEe9876d3b8BeeF00232AbCdEf1234567890 has purchased 120 GHST on Bitfinex. ",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚁 0x6B85aD4F6a7E86C349E1f16E44704e27104bDbC1 has purchased 250 SRM on Huobi.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🎸 0xAbCdEf0123456789BeEfDeAdBaAdCaFeDc0De01 has purchased 30 BAND on OKEx.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 0xAbCdEf0123456789BeEfDeAdBaAdCaFeDc0De01 has purchased 500 MNGO on Binance. "
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "📉 0xFaCAdEe9876d3b8BeeF00232AbCdEf1234567890 has purchased 100,000 RSR on Kraken.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "💸 0x6B85aD4F6a7E86C349E1f16E44704e27104bDbC1 has purchased 10 FARM on Coinbase.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "⚡ 0x987654321BeEfAcE1F2E3D4C5A6B7890aBcDeF12 has purchased 5,000 GODS on Gemini.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 0xAbCdEf0123456789BeEfDeAdBaAdCaFeDc0De01 has purchased 200 GLM on Bittrex.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 0xFaCAdEe9876d3b8BeeF00232AbCdEf1234567890 has purchased 100 INJ on Bitstamp. ",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🏢 0x6B85aD4F6a7E86C349E1f16E44704e27104bDbC1 has purchased 1,000 ADDY on Bitfinex.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🦙 0x987654321BeEfAcE1F2E3D4C5A6B7890aBcDeF12 has purchased 50 ALPACA on Huobi. ",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🛡️ 0xFaCAdEe9876d3b8BeeF00232AbCdEf1234567890 has purchased 2 ROOK on OKEx.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🧪 0xAbCdEf0123456789BeEfDeAdBaAdCaFeDc0De01 has purchased 25 ALCX on OKEx. ",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌊 0xAbCdEf0123456789BeEfDeAdBaAdCaFeDc0De01 has purchased 150 RAY on Binance.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 0xFaCAdEe9876d3b8BeeF00232AbCdEf1234567890 has purchased 2 MKR on Coinbase. ",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "⚙️ 0x6B85aD4F6a7E86C349E1f16E44704e27104bDbC1 has purchased 50 DYDX on Kraken. ",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 0x987654321BeEfAcE1F2E3D4C5A6B7890aBcDeF12 has purchased 1,000 XIN on Gemini.",
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌈 0xFaCAdEe9876d3b8BeeF00232AbCdEf1234567890 has purchased 300 FRAX on Bitstamp. ",
    },
  ];

  for (int i = 0; i < 100; i++) {
    final String name = faker.person.name();
    generatedActions[i]["author"] = name;

    await dio.post("https://dash.blocktalk.tv/items/action",
        data: generatedActions[i],
        options: Options(headers: {
          "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
        }));

    print("Posted $i. action!");
    sleep(const Duration(seconds: 5));
  }
}
