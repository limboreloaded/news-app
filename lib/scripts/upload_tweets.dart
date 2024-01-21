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

  List generatedNames = [];

  List<dynamic> staticTweets = [
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 #SHIB is not just a meme token! 🐕 With its growing community and innovative projects, this token is set to make waves in the crypto world. Keep an eye on the Shiba Inu army! 🌐🔥 #Crypto #SHIBArmy",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 #SNX, the backbone of the synthetic assets ecosystem, is powering the future of decentralized finance. Exciting times ahead as Synthetix continues to innovate and redefine the landscape. 🌐💸 #DeFi #SNX",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random(0).nextInt(8)],
      "content":
          "🛠️ Ready for real-world data on the blockchain? Look no further than #API3! This project is bridging the gap between blockchain and traditional data, opening up a world of possibilities. 🌐📊 #Blockchain #API3",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🦡 Building bridges in the decentralized finance space, #BADGER is creating opportunities for yield farmers and liquidity providers. Don't underestimate the power of the Badger DAO! 🌐💰 #DeFi #BADGERDAO",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "⚙️ Powering decentralized cloud computing, #RLC is a key player in the blockchain infrastructure game. As the demand for decentralized services grows, keep an eye on iExec! 🌐💻 #Blockchain #RLC",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Exciting times for #SNT! As a utility token for the Status network, it's facilitating private messaging and decentralized apps. The future of communication is decentralized! 🌐📲 #Crypto #SNT",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 Unlock the potential of decentralized exchanges with #ZRX! As the protocol for trading tokens on the Ethereum blockchain, it's at the forefront of the decentralized finance revolution. 🌐💱 #DeFi #ZRX",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "👀 Don't just invest, invest in what you love! Explore the world of decentralized fashion with #LOOKS. Fashion on the blockchain is not just a trend, it's the future! 🌐👗 #Crypto #DecentralizedFashion",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 Looking for a versatile blockchain platform? #ANY is your answer! With its focus on interoperability, it's connecting different blockchains for seamless transactions. 🌐🔗 #Blockchain #ANY",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Hop into the future of decentralized finance with #HOP! This cross-chain bridge is connecting different blockchain ecosystems, making it easier for assets to move fluidly. 🌐🌉 #DeFi #HOP",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "😎 #MEAN is not what it sounds! As the governance token for Mean Finance, it's driving decentralized lending and borrowing. Dive into the world of decentralized finance with MEAN! 🌐💸 #Crypto #MEANFinance",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Diversify your crypto portfolio with #INDEX, the governance token for the Index Cooperative. As the decentralized index provider, it's your ticket to a balanced and dynamic crypto investment strategy! 💹🚀 #Crypto #DeFi",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "⚓️ Navigate the crypto seas with #PORT! As a decentralized logistics protocol, it's revolutionizing supply chain management on the blockchain. Smooth sailing ahead for decentralized commerce! 🌐🚢 #Blockchain #PORTToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "💰 Looking for a decentralized finance powerhouse? Meet #PEFI! With its focus on scalable and low-cost transactions, it's paving the way for efficient DeFi solutions. The future of finance is here! 🌐💸 #DeFi #PEFIToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 Perpetual contracts, anyone? #PERP is leading the way in decentralized perpetual trading. Dive into the world of perpetual swaps with this innovative protocol! 🌐💱 #Crypto #PERPToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🐋 Dive into the depths of decentralized finance with #ORCA! As a cross-chain aggregator, it's simplifying the DeFi experience. Ride the waves of innovation with ORCA! 🌐🌊 #DeFi #ORCAToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🎨 Embrace the art of decentralized finance with #MLN! As the governance token for the decentralized autonomous organization (DAO) behind the digital art platform Aragon, it's shaping the future of digital art ownership. 🌐🖼️ #Crypto #MLNToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "☕️ Wake up to the future of decentralized lending with #JOE! As the token for Cream Finance, it's a key player in the DeFi space. Grab your coffee and explore the possibilities with JOE! 🌐💼 #DeFi #JOEToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🦙 Looking for a unique DeFi experience? Meet #YAK! As the governance token for the YAK Protocol, it's bringing innovation to decentralized stablecoins. Join the herd and explore the possibilities! 🌐🐾 #Crypto #YAKToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🦌 Venture into the wild world of decentralized finance with #ELK! As the token for the Elk Finance platform, it's unlocking opportunities for yield farmers and liquidity providers. 🌐💰 #DeFi #ELKToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Ready for decentralized applications on the blockchain? #APT is your ticket to the world of AppCoins, creating a universal digital advertising solution. It's not just a token; it's a gateway to the future of app ecosystems! 🌐📱 #Crypto #APTTokens",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Step into the decentralized world of gaming with #SDL! As the token for ESDL, it's leveling up the gaming experience with blockchain technology. Game on, crypto enthusiasts! 🎮🌐 #CryptoGaming #SDLToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "💸 Harness the power of decentralized finance with #SFI! As the governance token for sfinance, it's driving innovation in yield farming and liquidity provision. Explore the future of DeFi with SFI! 🌐💰 #DeFi #SFIToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "📐 Find the right angle for your crypto portfolio with #ANGLE! This token is making waves in the decentralized finance space, offering a fresh perspective on yield farming and liquidity provision. 🌐💹 #DeFi #ANGLEToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🐜 Dive into the ant colony of decentralized finance with #ANT! As the governance token for Aragon, it's shaping the future of decentralized organizations. Join the march towards a new era of governance! 🌐🏛️ #Crypto #ANTToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔮 Predict the future of decentralized forecasting with #REP! As the token for Augur, it's revolutionizing prediction markets on the blockchain. Get ready to forecast and earn with REP! 🌐🔍 #Crypto #REPToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🎮 Ready to explore the metaverse? #AXS is your ticket! As the native token for Axie Infinity, it's fueling the play-to-earn revolution. Level up your crypto game with AXS! 🌐🕹️ #CryptoGaming #AXSToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "⚖️ Balance your crypto portfolio with #BAL! As the governance token for the Balancer protocol, it's bringing stability and efficiency to decentralized finance. Stay balanced, stay profitable! 🌐💹 #DeFi #BALToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔗 Link up your decentralized finance journey with #LINK! As the native token for Chainlink, it's the backbone of decentralized oracles, connecting smart contracts to real-world data. The missing link to a more secure and decentralized future! 🌐🔗 #Crypto #LINKToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Must-have in your crypto toolkit: #MUST! As the governance token for the MustDAO, it's empowering decentralized insurance and lending. Secure your crypto assets with MUST! 🌐💼 #DeFi #MUSTToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String()
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "💼 Ready to earn interest and governance power? #COMP is the key! As the token for Compound, it's a driving force in the world of decentralized lending. Compound your crypto success with COMP! 🌐💸 #DeFi #COMPToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "Step into the decentralized metaverse with #MANA! As the native currency for Decentraland, it's your passport to virtual real estate, art, and experiences. Explore, create, and trade in the blockchain-based world! 🏰🎮 #Crypto #MANAToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "⚙️ Unlock the potential of digital payments with #MTL! As the MetalPay token, it's streamlining transactions and rewarding users for their engagement. Experience the future of finance with MTL! 💳🌐 #Crypto #MTLToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "☁️ Secure, private, and decentralized cloud storage? Look no further than #STORJ! As the token for the Storj network, it's reshaping the way we store and share data. Embrace the future of cloud storage with STORJ! 🌐🔒 #Crypto #STORJToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Facilitating decentralized payments and requests, #REQ is transforming the way we transact on the blockchain. Get ready for the future of finance, where every request is a smart contract away! 💸🔄 #Crypto #REQToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "📊 Navigate the decentralized data economy with #GRT! As the Graph token, it's powering queries and indexing for blockchain data. Discover the power of decentralized data with GRT! 🌐💡 #Crypto #GRTToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔮 Predict market outcomes with #GNO! As the governance token for Gnosis, it's at the forefront of decentralized prediction markets. Make informed decisions and explore the world of GNO! 🌐🔍 #Crypto #GNOToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "👻 Are you ready for the haunted world of decentralized finance? #GHST is the token for Aavegotchi, where DeFi meets NFTs in a playful and spooky way. Collect, play, and earn with GHST! 👻🌐 #Crypto #GHSTToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Speed up your crypto journey with #SRM! As the native token for Serum, it's powering fast and low-cost decentralized trading. Trade with speed and efficiency using SRM! 💹🌐 #Crypto #SRMToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🎶 Amplify your smart contracts with #BAND! As the native token for Band Protocol, it's connecting real-world data to the blockchain, ensuring reliable and secure smart contracts. BAND together for a decentralized future! 🌐🎵 #Crypto #BANDToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚜 Plow through the fields of decentralized finance with #MNGO! As the token for Mango Markets, it's cultivating opportunities for yield farmers and liquidity providers. Harvest the benefits with MNGO! 🌾💰 #DeFi #MNGOToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 Harness the power of decentralized stablecoins with #RSR! As the token for Reserve, it's playing a pivotal role in creating a stable and reliable currency for the digital age. Explore the future of stablecoins with RSR! 💹🌐 #Crypto #RSRToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚜 Cultivate your crypto portfolio with #FARM! As the governance token for Harvest Finance, it's sowing the seeds for decentralized farming and yield optimization. Harvest your rewards with FARM! 🌾💰 #DeFi #FARMToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🏛️ Dive into the world of ancient mythology with #GODS! As the token for the Gods Unchained gaming ecosystem, it's powering battles and trades on the blockchain. Join the immortal battle with GODS! 🌐🎮 #Crypto #GODSToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🧠 Unlock the potential of decentralized AI with #GLM! As the token for Golem, it's creating a global supercomputer for everyone. Contribute your computing power and be a part of the decentralized AI revolution! 💻🌐 #Crypto #GLMToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Inject some rocket fuel into your DeFi portfolio with #INJ! As the governance token for Injective Protocol, it's driving innovation in decentralized derivatives trading. Launch into a new era of finance with INJ! 🌐🚀 #DeFi #INJToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Put your address on the decentralized map with #ADDY! As the native token for the Address Protocol, it's revolutionizing decentralized identity and address systems. Navigate the blockchain with ADDY! 🗺️💡 #Crypto #ADDYToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🦙 Join the Alpaca revolution in decentralized finance with #ALPACA! As the governance token for Alpaca Finance, it's providing lending and borrowing opportunities in the DeFi landscape. Stake, farm, and earn with ALPACA! 🌐💸 #DeFi #ALPACAToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "⚔️ Arm yourself for decentralized battles with #ROOK! As the governance token for KeeperDAO, it's securing and optimizing DeFi protocols. Guard your assets and explore the decentralized fortress with ROOK! 🌐🛡️ #Crypto #ROOKToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 Navigate the decentralized stablecoin space with #ALCX! As the governance token for Alchemix, it's transforming the way we think about collateral-backed loans. Create magic in the DeFi cauldron with ALCX! 🌐🔮 #DeFi #ALCXToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "☀️ Shine a light on the future of decentralized finance with #RAY! As the token for Raydium, it's powering the Solana blockchain ecosystem. Experience speed, efficiency, and innovation with RAY! 🌐💡 #Crypto #RAYToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Govern your DeFi destiny with #MKR! As the governance token for MakerDAO, it's at the forefront of decentralized finance, providing stability and governance to the DAI stablecoin. Shape the future of finance with MKR! 💼💹 #Crypto #MKRToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 Gear up for decentralized perpetual trading with #DYDX! As the token for dYdX, it's revolutionizing the world of decentralized derivatives. Trade with confidence and flexibility using DYDX! 🌐💱 #DeFi #DYDXToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Unlock the power of interoperability with #XIN! As the native token for Mixin Network, it's bridging the gap between different blockchains, creating a seamless and efficient decentralized experience. Connect and transact with XIN! 🔗🚀 #Crypto #XINToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "💸 Experience stability in the volatile crypto market with #FRAX! As the algorithmic stablecoin, it's designed to maintain stability without the need for overcollateralization. Navigate the waves of crypto with FRAX! 🌐💹 #DeFi #FRAXToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🛍️ Tokenize your assets and shop on the blockchain with #TKN! As the native token for the Monolith platform, it's putting your crypto in your pocket. Spend, earn, and invest with TKN! 🌐💳 #Crypto #TKNToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Unlock the potential of layer-2 scaling with #OMG! As the token for the OMG Network, it's enhancing the scalability and speed of Ethereum transactions. Fast, secure, and ready for the decentralized future! 🌐💡 #DeFi #OMGToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Own a piece of the decentralized marketplace with #OGN! As the token for Origin Protocol, it's powering decentralized commerce and disrupting the e-commerce landscape. Shop, sell, and earn with OGN! 🛒💰 #Crypto #OGNToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "⚙️ Drive decentralized robotics with #RPL! As the token for Rocket Pool, it's decentralizing the staking of Ethereum. Join the decentralized pool and be a part of the future of blockchain security! 🌐🚀 #DeFi #RPLToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Anchor your applications to the blockchain with #ANKR! As the native token for Ankr, it's providing easy and affordable infrastructure solutions for blockchain developers. Build, deploy, and scale with ANKR! 💻🚀 #Crypto #ANKRToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔍 Explore the decentralized search ecosystem with #CRA! As the token for the Crust Network, it's incentivizing a decentralized storage network. Search, store, and secure your data with CRA! 🌐🔒 #DeFi #CRAToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "📈 Sail into the decentralized future with #SDT! As the native token for Synthetix, it's powering synthetic assets on the blockchain. Diversify your portfolio and trade with confidence using SDT! 🌐💹 #Crypto #SDTToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🍣 Savor the taste of decentralized finance with #SUSHI! As the governance token for SushiSwap, it's at the forefront of decentralized exchanges. Stake, swap, and sushi—dive into the DeFi feast! 🌐🍣 #DeFi #SUSHIToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 Unlock the potential of decentralized lending with #JUST! As the token for JustSwap, it's simplifying the lending and borrowing experience on the TRON blockchain. Trade, earn, and JUST do it! 🌐💸 #Crypto #JUSTToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Soar to new heights in decentralized finance with #EPS! As the native token for Ellipsis Finance, it's bringing efficiency to stablecoin swaps on the Binance Smart Chain. Stable, efficient, and ready for your DeFi journey! 🌐💹 #DeFi #EPSToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌀 Power your decentralized stablecoin with #QI! As the governance token for OlympusDAO, it's redefining the stablecoin landscape. Earn rewards and become part of the decentralized reserve with QI! 🌐💰 #Crypto #QIToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Navigate the decentralized trading landscape with #1INCH! As the token for 1inch Exchange, it's optimizing your trades across multiple DEXs. Maximize your efficiency and minimize your slippage with 1INCH! 💱🚀 #DeFi #1INCHToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔥 Heat up your crypto portfolio with #HOT! As the native token for Holo, it's fueling a decentralized hosting network. Host and earn in the decentralized internet of the future! 🌐🔥 #Crypto #HOTToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔒 Keep your assets secure in the decentralized world with #KEEP! As the token for the Keep Network, it's powering the infrastructure for private and secure data on public blockchains. Guard your assets with KEEP! 🌐🛡️ #DeFi #KEEPToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🏊 Dive into the decentralized liquidity pool with #POOL! As the governance token for PoolTogether, it's creating a no-loss savings game powered by DeFi. Pool your funds and win without risking a dime! 💸🌐 #Crypto #POOLToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Soar to new heights with #CVX! As the governance token for Convex Finance, it's optimizing yield farming on the Convex platform. Maximize your DeFi yields and conquer the crypto landscape with CVX! 🌐💹 #DeFi #CVXToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Linear Finance is disrupting the decentralized finance space with #LINA! As the protocol's native token, it's bridging traditional and digital assets. Linearize your investment strategy with LINA! 💹🚀 #Crypto #LINAToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "⚡️ Need fast and efficient trades? Look no further than #QUICK! As the governance token for QuickSwap, it's optimizing decentralized trading on the Polygon network. QuickSwap and earn with QUICK! 🌐💱 #DeFi #QUICKToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Power up your crypto journey with #AKRO! As the token for Akropolis, it's bringing decentralized finance solutions to the masses. Stake, earn, and build your financial future with AKRO! 💸🌐 #Crypto #AKROToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚁 Take flight with #FIDA! As the native token for Bonfida, it's fueling decentralized trading and liquidity. Soar to new heights in the crypto market with FIDA! 🌐💹 #DeFi #FIDAToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🛣️ Navigate the decentralized landscape efficiently with #ROUTE! As the governance token for Router Protocol, it's optimizing cross-chain communication. Route your way to seamless decentralized transactions with ROUTE! 🌐🔄 #Crypto #ROUTEToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔥 Yield Finance is heating up with #YFI! As the governance token for Yearn.finance, it's leading the way in decentralized yield optimization. Maximize your returns and stake with confidence using YFI! 💹🌐 #DeFi #YFIToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 Swap your way through the decentralized universe with #SWAP! As the native token for TrustSwap, it's powering smart escrow and token swaps. Trust and swap securely with SWAP! 🌐💱 #Crypto #SWAPToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌴 Explore the decentralized islands with #SLND! As the token for Solend, it's revolutionizing lending on the Solana blockchain. Stake, borrow, and lend with confidence in the decentralized world! 💰🌐 #DeFi #SLNDToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🥛 Milk the potential of decentralized finance with #MILK! As the token for Cream Finance, it's creating opportunities for yield farmers and liquidity providers. Stake, milk, and earn with MILK! 🌐💸 #Crypto #MILKToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 Synthetize your crypto experience with #SYN! As the governance token for Synthetic Protocol, it's bringing synthetic assets to the decentralized world. Trade and diversify with SYN! 💹🌐 #DeFi #SYNToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔄 Dive into the decentralized world of multi-chain trading with #DFYN! As the native token for the DFYN Exchange, it's streamlining decentralized finance on Polygon. Swap, stake, and earn with DFYN! 🌐💱 #Crypto #DFYNToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Unlock the potential of decentralized storage with #PNG! As the native token for the Peony Network, it's creating a secure and efficient decentralized file storage ecosystem. Plant the seeds of decentralized storage with PNG! 🌸🔒 #Crypto #PNGToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🍨 Satisfy your sweet tooth with #SUNDAE! As the native token for SundaeSwap, it's adding a flavorful twist to decentralized exchanges on the Cardano blockchain. Trade, stake, and indulge with SUNDAE! 🌐🍦 #DeFi #SUNDAEToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "✨ Cast a spell on the decentralized world with #SPELLTOKEN! As the governance token for Spell, it's weaving decentralized magic in the world of synthetic assets. Enchant your portfolio with SPELLTOKEN! 🌐🔮 #Crypto #SPELLTOKEN",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🥒 Pickle Finance is bringing a unique flavor to decentralized finance with #PICKLE! As the governance token, it's incentivizing users to provide liquidity and earn rewards. Pickle, stake, and savor the DeFi experience! 🌐💸 #DeFi #PICKLEToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🎶 Dance to the rhythm of decentralized finance with #LYRA! As the token for Lyra Finance, it's creating opportunities for yield farmers and liquidity providers. Join the decentralized dance with LYRA! 🌐🕺 #Crypto #LYRAToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Accelerate your decentralized finance journey with #VELO! As the native token for the Velas blockchain, it's fueling a high-performance ecosystem. Fast, scalable, and ready for the decentralized future with VELO! 🌐🚀 #DeFi #VELOToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔮 Predict the future of decentralized derivatives with #THALES! As the native token for Thales, it's at the forefront of creating a decentralized prediction market. See the future and stake with THALES! 🌐🔍 #Crypto #THALESToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Gelato Finance is shaping the future of decentralized automation with #GEL! As the governance token, it's powering a protocol for automated smart contract executions. Gelato, automate, and conquer the decentralized landscape! 🤖🌐 #DeFi #GELToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "⚡️ Empower your decentralized applications with #SUDO! As the governance token for sudo, it's adding a layer of decentralized administration to blockchain networks. SUDO your way to decentralized control! 🌐🔒 #Crypto #SUDOToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌊 Surf the waves of decentralized finance with #SBR! As the token for the Saber protocol, it's providing a stable and efficient bridge between different blockchains. Ride the Saber waves into the decentralized future! 🏄🌐 #Crypto #SBRToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🍔 Craving a taste of decentralized finance? Sink your teeth into #BURGER! As the governance token for BurgerSwap, it's flipping the script on decentralized exchanges. Swap, stake, and savor the flavor of DeFi with BURGER! 🌐🍔 #DeFi #BURGERToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "💸 Experience decentralized lending and borrowing with #AAVE! As the native token for Aave, it's redefining the lending landscape on the Ethereum blockchain. Borrow, lend, and earn with confidence using AAVE! 🌐💰 #Crypto #AAVEToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🦄 Unleash the power of decentralized governance with #UNI! As the governance token for Uniswap, it's leading the way in decentralized exchanges. Swap, stake, and participate in the UNIverse of decentralized finance! 🌐💱 #DeFi #UNIToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 The heart of decentralized finance beats with #ETH! As the native currency of the Ethereum blockchain, it's fueling smart contracts, DeFi protocols, and NFTs. ETH is the heartbeat of the decentralized revolution! 💙🚀 #Crypto #ETHToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🕸️ Connect and secure the decentralized web with #DOT! As the native token for Polkadot, it's facilitating interoperability between different blockchains. Dot your way to a decentralized future with DOT! 🌐🌐 #DeFi #DOTToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Soar into the Avalanche ecosystem with #AVAX! As the native token for Avalanche, it's powering decentralized applications and providing fast, low-cost transactions. Avalanche your way to decentralized success with AVAX! 🌐🏔️ #Crypto #AVAXToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "☀️ Shine a light on the Solana blockchain with #SOL! As the native token, it's bringing speed and efficiency to decentralized applications. SOL is illuminating the path to a decentralized future! 🌐💡 #DeFi #SOLToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "₿ Embrace the king of decentralized assets with #BTC! As the pioneer of cryptocurrencies, Bitcoin is the epitome of decentralized digital currency. Hold, trade, and secure your wealth with BTC! 🌐👑 #Crypto #BTCToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 Explore the decentralized cosmos with #AR! As the native token for Arweave, it's redefining permanent and decentralized data storage. Anchor your data securely in the decentralized universe with AR! 🌐🚀 #DeFi #ARToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🎈 Mine the future with #HNT! As the native token for Helium, it's transforming the way we connect and transfer data wirelessly. Join the decentralized network and start earning HNT for providing coverage! 🌐🛰️ #Crypto #HNTToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "♠️ Play your cards right with #ADA! As the native token for Cardano, it's at the forefront of blockchain innovation. Stake, build, and participate in the decentralized future with ADA! 🌐💳 #Crypto #ADAToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌊 Dive into the blockchain of the future with #FLOW! As the native token for Flow, it's powering decentralized applications and digital assets. Ride the Flow into a new era of blockchain technology! 🌐🚀 #Crypto #FLOWToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Experience the efficiency of decentralized finance with #ALGO! As the native token for Algorand, it's creating a seamless and scalable blockchain experience. Stake, transact, and build on the ALGO blockchain! 💹🔗 #DeFi #ALGOToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🚀 TRX is taking off! As the native token for TRON, it's powering a decentralized entertainment ecosystem. Stake, trade, and explore the TRON network with TRX! 🌐🎮 #Crypto #TRXToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🔥 Fuel your decentralized journey with #BNB! As the native token for Binance Coin, it's not just a utility token but a key player in the Binance Smart Chain. Trade, stake, and save on fees with BNB! 🌐💱 #DeFi #BNBToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌐 Dive into the Internet Computer with #ICP! As the native token for the Internet Computer Protocol, it's decentralizing the web and enabling smart contracts. Join the ICP revolution and explore a new era of the internet! 🌐🚀 #Crypto #ICPToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "🌊 Ride the Waves of decentralized possibilities with #WAVES! As the native token for the Waves platform, it's facilitating token creation and decentralized trading. Create, trade, and surf the Waves blockchain! 🌐🏄 #DeFi #WAVESToken",
      "link": "https://twitter.com",
      "posted_at": DateTime.now().toIso8601String(),
    },
    {
      "icon": staticImageUrls[Random().nextInt(8)],
      "content":
          "📐 Polygon is shaping the decentralized landscape with #MATIC! As the native token for the Polygon network, it's optimizing scalability and enabling seamless transactions. Connect, transact, and scale with MATIC! 🌐💠 #Crypto #MATICToken",
    }
  ];

  for (int i = 0; i < 100; i++) {
    final String name = faker.person.name();
    generatedNames.add(name);
  }

  for (int i = 0; i < 100; i++) {
    dynamic generatedTweet = {
      "author": generatedNames[i],
      "icon": staticTweets[i]["icon"],
      "content": staticTweets[i]["content"],
      "link": staticTweets[i]["link"],
      "posted_at": staticTweets[i]["posted_at"],
    };

    await dio.post("https://dash.blocktalk.tv/items/tweet",
        data: generatedTweet,
        options: Options(headers: {
          "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM",
        }));

    print("Posted $i. tweet!");

    sleep(const Duration(seconds: 5));
  }
}
