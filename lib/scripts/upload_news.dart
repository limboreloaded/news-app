import "dart:convert";
import "dart:io";

import "package:dio/dio.dart";

//! UPLOAD NEWS ARTICLES SCRIPT

// https://cryptonews-api.com/api/v1/category?section=general&items=3&page=1&token=a21ujjagofrmbv45hf1dife7mikdpsqx9bw4jxpt

// final cacheOptions = CacheOptions(
//   store: MemCacheStore(),
//   policy: CachePolicy.forceCache,
//   hitCacheOnErrorExcept: [401, 403],
//   maxStale: const Duration(hours: 1),
// );

final dio = Dio();

const List<String> relevantOutlets = ["Cointelegraph", "Coindesk"];

//! NEWS:
//! TITLE
//! SOURCE
//! IMAGE
//! PUBLISHED AT

void main() async {
  List<dynamic> staticNews = [
    {
      //! NO RELATION
      "source":
          "https://cointelegraph.com/news/champ-medici-web3-communities-nfts-music-gaming",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-11/70f38473-cae8-4d6e-9df3-ea352622c5a4.jpg",
      "title": "Champ Medici talks Web3 communities, NFTs, music and gaming",
      "published_at": "1699448400"
    },
    {
      //! POLYGON
      "source":
          "https://cointelegraph.com/news/polygon-labs-near-announce-zk-prover-wasm-integration",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-11/c13f352a-5806-4c41-9b54-cd3ead89d1b3.jpg",
      "title": "Polygon Labs and Near announce ZK prover for WASM integration",
      "published_at": "1699462920",
    },
    {
      //! ETHEREUM
      "source":
          "https://cointelegraph.com/news/nft-sales-volume-november-blur-opensea",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-11/f2964557-e5cf-41a5-a156-fc5457a501aa.jpg",
      "title": "NFT sales volume jumps to \$129M in November — Nansen data",
      "published_at": "1699290120",
    },
    {
      //! BITCOIN
      "source":
          "https://cointelegraph.com/news/el-salvador-bitcoin-atm-lightning-network-upgrade",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-11/c45e90e2-96e8-404a-ab38-bb8b4d34df4e.jpg",
      "title":
          "El Salvador Bitcoin ATM network to receive Lightning Network upgrade",
      "published_at": "1699437720"
    },
    {
      //! AAVE
      "source":
          "https://cointelegraph.com/news/aave-pauses-several-markets-feature-issue",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-11/c0addbf2-d8ef-422e-9ffa-d6dd06091e82.jpg",
      "title": "Aave pauses several markets after reports of feature issue",
      "published_at": "1699092120",
    },
    {
      //! BITCOIN
      "source":
          "https://cointelegraph.com/news/3-satoshi-era-bitcoin-wallets-transfer-230m-in-btc-after-6-year-dormancy",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-11/e7346764-b73e-45f5-9297-38de5ed93112.jpg",
      "title":
          "3 Satoshi-era Bitcoin wallets transfer \$230M in BTC after 6-year dormancy",
      "published_at": "1698919320",
    },
    {
      //! AXIE INFINITY
      "source":
          "https://cointelegraph.com/news/axie-infinity-developer-brings-japanese-web2-games-to-ronin",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-11/b64dc2a0-72f7-4588-a240-d3e18b92875e.jpg",
      "title": "Axie Infinity developer brings Japanese Web2 games to Ronin",
      "published_at": "1698919320"
    },
    {
      //! MULTICHAIN
      "source":
          "https://cointelegraph.com/news/multichain-transactions-confirmed-queue-unwinds",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-11/14df054c-a93d-4f41-b0e2-211c9f2c186f.jpg",
      "title":
          "Breaking: Some Multichain transactions are confirmed as queue unwinds",
      "published_at": "1698832920"
    },
    {
      //! BITCOIN
      "source":
          "https://cointelegraph.com/news/invesco-galaxy-spot-bitcoin-etf-added-to-dtcc-website",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-11/c3f343c4-f02c-478d-a156-ef6ee32e979a.jpg",
      "title": "Invesco Galaxy spot Bitcoin ETF joins BlackRock on DTCC site",
      "published_at": "1698832920"
    },
    {
      //! ETHEREUM
      "source":
          "https://cointelegraph.com/news/ethereum-layer-2-continue-to-be-diverse-vitalik-buterin",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/7204d1a6-6d34-4b2a-87a0-3ac3a92792e4.jpg",
      "title":
          "Ethereum layer 2s will continue to have diverse approaches to scaling — Vitalik Buterin",
      "published_at": "1698746520",
    },
    {
      //! BITCOIN
      "source":
          "https://cointelegraph.com/news/no-concerns-over-bitcoin-halving-supply-shock-says-bitvavo-ceo",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/7ecf001c-30aa-479b-b36d-a295ca03bb70.jpg",
      "title":
          "No concerns over Bitcoin halving supply shock, says Bitvavo CEO",
      "published_at": "1698746520",
    },
    {
      //! AVALANCHE
      "source":
          "https://cointelegraph.com/news/avax-blockchain-explorer-to-shut-down-etherscan-fees-draw-controversy",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/3d988897-9678-4ee3-b5fb-b9e335a04f30.jpg",
      "title":
          "Avalanche blockchain explorer to shut down as Etherscan fees draw controversy",
      "published_at": "1698660120",
    },
    {
      //! NO RELATION
      "source":
          "https://cointelegraph.com/news/nft-artwork-regulation-uk-government-mintable-zach-burks",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/47211cd5-53cb-4b0f-97bc-7f48502153f8.jpg",
      "title": "UK risks regulating NFTs the wrong way, says Mintable CEO",
      "published_at": "1698573720",
    },
    {
      //! DYDX
      "source":
          "https://cointelegraph.com/news/dydx-dex-launches-layer-1-blockchain",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/963f0529-63d0-4db8-baf6-2a280a1ecc1a.jpg",
      "title":
          "dYdX launches layer-1 blockchain, validators and stakers set to receive all fees",
      "published_at": "1698397320",
    },
    {
      //! BITCOIN
      "source":
          "https://cointelegraph.com/news/bitcoin-dominance-hits-54-ahead-btc-halving",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/934a0f23-d414-45d8-bff4-3463df934d82.jpg",
      "title":
          "Bitcoin dominance hits 54% — Highest in 2.5 years as BTC halving approaches",
      "published_at": "1698310920",
    },
    {
      //! POLYGON
      "source":
          "https://cointelegraph.com/news/polygon-launches-pol-token-contract-ethereum-eventually-replace-matic",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/c8d353a5-fb44-4512-a2f9-78d87814b012.jpg",
      "title":
          "Polygon launches POL token contract on Ethereum to eventually replace MATIC",
      "published_at": "1698224520",
    },
    {
      //! DYDX
      "source":
          "https://cointelegraph.com/news/dydx-publishes-open-source-code-anticipation-phased-mainnet-launch",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/3b875a12-2723-42f2-9d08-fdebc6e6b48f.jpg",
      "title":
          "dYdX publishes its open-source code in anticipation of phased mainnet launch",
      "published_at": "1698138120",
    },
    {
      //! UNISWAP
      "source":
          "https://cointelegraph.com/news/uniswap-hayden-adams-burns-650b-haycoin-speculation",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/54709968-4b5f-4f2b-bc87-f021c6f675c3.jpg",
      "title": "Uniswap founder burns \$650B in HayCoin against speculation",
      "published_at": "1697878920",
    },
    {
      //! UNISWAP
      "source":
          "https://cointelegraph.com/news/busy-week-uniswap-platypus-recovers-90-hacked-funds-finance-redefined",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/5333e955-f229-4cb7-acbc-995b3a3ab0fe.jpg",
      "title":
          "Busy week for Uniswap, and Platypus recovers 90% of hacked funds: Finance Redefined",
      "published_at": "1697792520"
    },
    {
      //! UNISWAP
      "source":
          "https://cointelegraph.com/news/uniswap-uni-dex-charge-0-15-swap-fees-beginning-oct-17",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/64744b4b-03d5-4fc7-ae5e-90a68030defe.jpg",
      "title": "Uniswap to charge 0.15% swap fees beginning Oct. 17",
      "published_at": "1697446920"
    },
    {
      //! BITCOIN
      "source":
          "https://cointelegraph.com/news/what-happens-if-sec-appeal-grayscale-spot-bitcoin-etf-ruling",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/69c2b128-2853-4ca3-b599-885b0a95b823.jpg",
      "title": "",
      "published_at": "1697187720",
    },
    {
      //! UNISWAP
      "source":
          "https://cointelegraph.com/news/uniswap-launches-android-wallet-beta-for-google-play",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/dbf4a281-8fe8-42c7-a384-28ebc8b0cb21.jpg",
      "title": "Uniswap launches Android wallet beta for Google Play",
      "published_at": "1697101320",
    },
    {
      //! NO RELATION
      "source":
          "https://cointelegraph.com/news/trezor-new-hardware-wallet-metal-recovery-seed-backup",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/bba6d71c-4515-4d60-b5c5-837bdf6cbbd7.jpg",
      "title":
          "Trezor releases new hardware wallet and metal private key backup",
      "published_at": "1697101320",
    },
    {
      //! POLYGON
      "source":
          "https://cointelegraph.com/news/circle-launches-usdc-tokens-on-polygon",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/60ee8148-5dc3-4622-b1f1-d5aa92b90590.jpg",
      "title": "Circle rolls out native USDC tokens on Polygon",
      "published_at": "1696928520",
    },
    {
      //! BITCOIN
      "source":
          "https://cointelegraph.com/news/bitcoin-openai-ceo-sam-altman-joe-rogan-excited",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/4772d333-1b53-4135-a75c-41a4234dcee6.jpg",
      "title":
          "Bitcoin is a ‘super logical’ step on the tech tree — OpenAI CEO",
      "published_at": "1696842120",
    },
    {
      //! ETHEREUM
      "source":
          "https://cointelegraph.com/news/ethereum-merge-made-network-more-centralized",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/afdc069e-2d43-4938-9c10-9fcdcc6ab2f3.jpg",
      "title":
          "Rise of Ethereum staking came at cost of higher centralization — JPMorgan",
      "published_at": "1696582920",
    },
    {
      //! OPTIMISM
      "source":
          "https://cointelegraph.com/news/optimism-network-launches-testnet-fault-proof-system-pursuit-decentralization",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/6adeb153-cfb7-4851-a20d-7be0af11d83b.jpg",
      "title":
          "Optimism network launches testnet fault-proof system in pursuit of decentralization",
      "published_at": "1696323720",
    },
    {
      //! ETHEREUM
      "source":
          "https://cointelegraph.com/news/vitalik-buterin-dao-staking-pool",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-10/7deb7d0f-df82-4c0f-b156-a9d5d62f20dd.jpg",
      "title":
          "Vitalik Buterin voices concerns over DAOs approving ETH staking pool operators",
      "published_at": "1696150920",
    },
    {
      //! NO RELATION
      "source":
          "https://cointelegraph.com/news/nft-artist-cancer-support-140-k-charity",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-09/d050cf92-729c-4ce9-84ac-d26ecfd97f24.jpg",
      "title": "NFT artist raises \$140K for cancer support charity",
      "published_at": "1695978120",
    },
    {
      //! UNISWAP
      "source":
          "https://cointelegraph.com/news/uniswap-foundation-targets-62-million-additional-funding",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-09/f23618f6-152e-4cfb-bb68-c7a4a5c2286d.jpg",
      "title": "Uniswap Foundation targets \$62M in additional funding",
      "published_at": "1695805320",
    },
    {
      //! OPTIMISM
      "source":
          "https://cointelegraph.com/news/optimism-op-slides-before-scheduled-token-unlock",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-09/e00af4a9-bef7-40f8-b10c-68fdbde7ed06.jpg",
      "title":
          "Optimism OP token slips 10% in week ahead of \$30M token unlock",
      "published_at": "1695718920",
    },
    {
      //! ARBITRUM
      "source":
          "https://cointelegraph.com/news/arbitrum-dao-takes-56million-of-unclaimed-arb-tokens",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-09/89fc4257-4df3-444b-9da8-45a559f9c56b.jpg",
      "title":
          "Arbitrum DAO takes \$56M of unclaimed ARB as airdrop deadline ends",
      "published_at": "1695632520"
    },
    {
      //! NO RELATION
      "source":
          "https://cointelegraph.com/news/coinbase-ceo-warns-ai-regulation-calls-for-decentralization",
      "image":
          "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=717/https://s3.cointelegraph.com/uploads/2023-09/c8ab94f7-6ed0-4756-b92e-afd04ee84978.jpg",
      "title":
          "Coinbase CEO warns against AI regulation, calls for decentralization",
      "published_at": "1695459720",
    },
    {
      //! NO RELATION
      "source":
          "https://www.coindesk.com/business/2023/11/10/poloniex-hot-wallets-hacked-65m-seemingly-stolen-on-chain-data/",
      "image":
          "https://www.coindesk.com/resizer/OXEyPFhIhLWKz9_g7L8jIQcYTms=/1056x594/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/V42AF25WPBFHBNZBV6YQB4E224.jpg",
      "title":
          "Poloniex Hot Wallets Hacked With \$114M Seemingly Stolen: On-Chain Data",
      "published_at": "1699618007",
    },
    {
      //! ETHEREUM
      "source":
          "https://www.coindesk.com/markets/2023/11/10/was-ethers-bitcoin-beating-surge-a-one-off-or-has-the-tide-really-turned/",
      "image":
          "https://www.coindesk.com/resizer/_3Qno8PfZb7wSW2amAekdtsiYTM=/1056x594/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/3KMCCY62IVHNLMLCT3MHFCQMOQ.jpg",
      "title":
          "Was Ether's Bitcoin-Beating Surge a One-Off, or Has The Tide Really Turned?",
      "published_at": "1699614407",
    },
    {
      //! ETHEREUM
      "source":
          "https://www.coindesk.com/business/2023/11/09/blackrocks-ethereum-etf-plan-is-confirmed-in-nasdaq-filing/",
      "image":
          "https://www.coindesk.com/resizer/MY7xv39FgM0-1MWnf12vPqhJjBw=/2112x1188/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/CJHBVQZDPNFZNA4SF7HHQ22QBU.jpg",
      "title": "BlackRock's Ethereum ETF Plan Is Confirmed in Nasdaq Filing",
      "published_at": "1699564007",
    },
    {
      //! OPTIMISM
      "source":
          "https://www.coindesk.com/business/2023/09/21/optimism-foundation-sells-157m-op-tokens-citing-treasury-management/",
      "image":
          "https://www.coindesk.com/resizer/EgcaIrTVnmVwwx0iM-UdZFdH9Kk=/1056x594/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/CJAX6OS4LRCSXHOB4MEKPE7TQY.jpg",
      "title":
          "Optimism Foundation Sells \$157M OP Tokens, Citing 'Treasury Management'",
      "published_at": "1695276407",
    },
    {
      //! SYNTHETIX
      "source":
          "https://www.coindesk.com/business/2023/09/04/synthetix-posts-125-gain-amid-binance-outflows-bucks-bearish-bitcoin-trend/",
      "image":
          "https://www.coindesk.com/resizer/Fl_Yn0n5DKeae-a49EAxTKTftbk=/2112x996/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/7M4MFQ3DLVE3VNRN64RL32JACM.png",
      "title":
          "Synthetix Posts 12.5% Gain Amid Binance Outflows, Bucks Bearish Bitcoin Trend",
      "published_at": "1693807607",
    },
    {
      //! BALANCER
      "source":
          "https://www.coindesk.com/markets/2023/08/22/balancer-depositors-pull-nearly-100m-in-crypto-after-vulnerability-warning/",
      "image":
          "https://www.coindesk.com/resizer/sVqVgfl5AQ80hl77KHqbUoDpEMQ=/1056x594/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/UPHMJKB225C4NMIK5BZLG3U42I.jpg",
      "title":
          "Balancer Depositors Pull Nearly \$100M in Crypto After Vulnerability Warning",
      "published_at": "1692684407",
    },
    {
      //! ARBITRUM
      "source":
          "https://www.coindesk.com/tech/2023/08/04/arbitrums-most-popular-dex-goes-live-with-new-version-offering-doge-pools-at-40/",
      "image":
          "https://www.coindesk.com/resizer/1QCUzbz1k9yj0-ScRhJlGjHQauo=/1056x704/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/HXKKCBFJDNG4TKE2EZOIZUP5JY.jpg",
      "title":
          "Arbitrum's Most Popular DEX Goes Live With New Version Offering DOGE Pools at 40%",
      "published_at": "1691129207"
    },
    {
      //! SHIBA INU
      "source":
          "https://www.coindesk.com/markets/2023/07/21/move-over-shiba-inu-crypto-community-flirts-with-hamster-race-betting/",
      "image":
          "https://www.coindesk.com/resizer/DiVpi98v0GOaaAMD1qs90yoPoDA=/2112x1188/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/N7GNPYQPUZCJDPV5L4Z3OXOZZE.png",
      "title":
          "Move Over Shiba Inu: Crypto Community Flirts With Hamster Race Betting",
      "published_at": "1689919607",
    },
    {
      //! CHAINLINK
      "source":
          "https://www.coindesk.com/markets/2023/07/20/chainlinks-link-climbs-as-whales-add-to-holdings-following-protocol-release/",
      "image":
          "https://www.coindesk.com/resizer/ZT-hwhdio-8Y9zW9xF-4jHjWcaU=/1056x701/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/BCYN6CN7QJEHHGUJCJ4G6ASPOA.jpg",
      "title":
          "Chainlink’s LINK Climbs as Whales Add to Holdings Following Protocol Release",
      "published_at": "1689833207",
    },
    {
      //! 1Inch
      "source":
          "https://www.coindesk.com/business/2023/07/17/1inch-token-surges-58-as-daily-trading-volume-spikes-to-20-month-high-investor-moves-37m-to-binance/",
      "image":
          "https://www.coindesk.com/resizer/BFiXM95QcFtgzif2hd_gSyJNctY=/2112x1008/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/WFQAHRPDVBELREVOTP527H6PHM.png",
      "title":
          "1inch Token Surges 58% as Daily Trading Volume Spikes to 20-Month High; Investor Moves \$3.7M to Binance",
      "published_at": "1689574007",
    },
    {
      //! SHIBA INU
      "source":
          "https://coindesk.com/markets/2023/07/13/early-shiba-inu-holder-with-10-of-supply-moves-30m-in-shib-tokens/",
      "image":
          "https://www.coindesk.com/resizer/RUYjGLOomleKn9ESUmTeit5qDt4=/1056x792/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/TQVZOCDFMBBXVCGRJVVFSSOUUU.jpg",
      "title":
          "Early Shiba Inu Holder With 10% of Supply Moves \$30M in SHIB Tokens",
      "published_at": "1689228407",
    },
    {
      //! POLYGON
      "source":
          "https://coindesk.com/tech/2023/07/13/polygon-proposes-token-switch-from-matic-to-pol-for-more-utility/",
      "image":
          "https://www.coindesk.com/resizer/mjNC8nBg35CmCKXPPfEeDxvC7KI=/1056x594/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/DTC6K4F4VJF2RNGVYP7GLNDKLU.png",
      "title":
          "Polygon Proposes Token Switch From MATIC to POL for More Utility",
      "published_at": "1689228407",
    },
    {
      //! BITCOIN / LIGHTNING / UNRELATED
      "source":
          "https://www.coindesk.com/tech/2023/07/17/lightning-network-bitcoin-deposits-now-live-on-binance/",
      "image":
          "https://www.coindesk.com/resizer/sXAl3rAKJgEZAL3ZwQivpTIF2cg=/2112x1410/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/Q4JBWNRU3FDGHI2WBAX63JH2N4.jpg",
      "title": "Lightning Network Bitcoin Deposits Now Live on Binance",
      "published_at": "1689574007",
    },
    {
      //! POLYGON
      "source":
          "https://www.coindesk.com/markets/2023/07/11/matic-surges-10-as-polygons-20-upgrade-draws-closer/",
      "image":
          "https://www.coindesk.com/resizer/aaOe7ymDwpcj_WhpnsegqTiyf1w=/2112x1136/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/UBKNUK7FUFH2NEMCBJPT2SK6ZQ.png",
      "title": "MATIC Surges 10% as Polygon's 2.0 Upgrade Draws Closer",
      "published_at": "1689055607",
    },
    {
      //! ALGORAND
      "source":
          "https://www.coindesk.com/business/2023/07/11/defi-protocol-holding-55-of-algorand-value-to-shut-down/",
      "image":
          "https://www.coindesk.com/resizer/eWCe90gLxgOVDO-DVOJtTFf6-t8=/2112x1410/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/BTT56Y7LCZAW3HQ3ZH6DPZWPDA.jpg",
      "title": "DeFi Protocol Holding 55% of Algorand Value to Shut Down",
      "published_at": "1689055607",
    },
    {
      //! AAVE
      "source":
          "https://www.coindesk.com/business/2023/07/05/aave-holders-vote-on-proposal-for-defi-protocol-to-convert-1600-ether-into-wsteth-and-reth/",
      "image":
          "https://www.coindesk.com/resizer/I__belhp2dyeXgEpwmALLoUuJb0=/2112x1408/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/S4ZLS3XWNFEQ7IE4HLQR6676AA.jpg",
      "title":
          "Aave Holders Vote on Proposal for DeFi Protocol to Convert 1,600 Ether Into wstETH and rETH",
      "published_at": "1688537207",
    },
    {
      //! COMPOUND
      "source":
          "https://www.coindesk.com/business/2023/06/29/comp-token-rises-by-50-in-4-days-amid-flurry-of-whale-activity-on-binance/",
      "image":
          "https://www.coindesk.com/resizer/OgG5GDxks9Z90uKdFPcA3U75RHc=/2112x1008/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/CK7RYWBQUFCYZJMNPJGOCD2ZRQ.png",
      "title":
          "COMP Token Rises by 50% in 4 Days Amid Flurry of Whale Activity on Binance",
      "published_at": "1688018807",
    },
    {
      //! ARBITRUM
      "source":
          "https://www.coindesk.com/business/2023/06/27/blur-arbitrum-lead-altcoin-surge-as-traders-anticipate-bull-run/",
      "image":
          "https://www.coindesk.com/resizer/Z1XxaJmfB5m3EdCnT5N8LgYNoyo=/2112x1414/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/R5MKWTDO2FBTJLKJTQ54MBZCX4.jpg",
      "title":
          "Blur, Arbitrum Lead Altcoin Surge as Traders Anticipate Bull Run",
      "published_at": "1687846007",
    },
    {
      //! BITCOIN
      "source":
          "https://www.coindesk.com/markets/2023/06/22/bitcoin-holdings-in-one-coinbase-custody-wallet-jumped-by-25k-after-blackrock-etf-filing/",
      "image":
          "https://www.coindesk.com/resizer/XEjn1NyXymseIE2ZjU5HzM1uaSU=/2112x1408/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/JPBWLSRAPVCEFJDP46WII5SB4Y.jpg",
      "title":
          "Bitcoin Holdings in One Coinbase Custody Wallet Jumped by 2.5K After BlackRock ETF Filing",
      "published_at": "1687414007",
    },
    {
      //! CARDANO
      "source":
          "https://www.coindesk.com/tech/2023/06/20/latest-cardano-node-upgrade-goes-live-on-mainnet/",
      "image":
          "https://www.coindesk.com/resizer/QYtQQFgf-zEs-Os6dakTiNa2UGY=/2112x1188/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/UWIBTUDOP5F7BBRHCTACIMAYPA.jpg",
      "title": "Latest Cardano Node Upgrade Goes Live on Mainnet",
      "published_at": "1687241207",
    },
    {
      //! SYNTHETIX
      "source":
          "https://www.coindesk.com/business/2023/06/01/synthetix-community-approves-plan-to-nudge-positions-off-soon-to-shut-version-one-of-its-perpetuals-market/",
      "image":
          "https://www.coindesk.com/resizer/EcthAfqPHBE7gV1xjoIB-7aNscw=/2112x1408/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/27IG7LHCOJAMXGXO2CEUNIIQZ4.jpg",
      "title":
          "Synthetix Community Approves Plan to Nudge Positions Off Soon-to-Shut Version One of Its Perpetuals Market",
      "published_at": "1685599607",
    },
    {
      //! MULTICHAIN
      "source":
          "https://www.coindesk.com/business/2023/05/31/crypto-bridging-protocol-multichain-unable-to-contact-ceo-zhaojun/",
      "image":
          "https://www.coindesk.com/resizer/PV-hTF4u9cQ74z1wXH-Q96jYHLY=/1056x792/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/UB4Z66OVIZFX7FJRLYAY5MB2GA.jpg",
      "title":
          "Crypto Bridging Protocol Multichain ‘Unable to Contact’ CEO Zhaojun",
      "published_at": "1685513207",
    },
    {
      //! CARDANO
      "source":
          "https://www.coindesk.com/tech/2023/05/30/cardano-dex-minswap-sees-volume-jump-driven-by-snek-bank-meme-coins/",
      "image":
          "https://www.coindesk.com/resizer/yWkWsHtXy4mR1pwSLyt0bn89KJ0=/2112x1408/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/H6K3AN42UZDMRKIYOP3CTXXN3Q.jpg",
      "title":
          "Cardano DEX Minswap Sees Volume Jump Driven by SNEK, BANK Meme Coins",
      "published_at": "1685426807",
    },
    {
      //! SUSHISWAP
      "source":
          "https://www.coindesk.com/business/2023/05/24/fantom-foundation-removes-24m-multi-from-sushiswap-liquidity-pool/",
      "image":
          "https://www.coindesk.com/resizer/GY70QjaQYlq0JXaB3_TzmhSu0C0=/2112x1584/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/TW5INGCW4ZDTTJOGCOXQR26BB4.jpg",
      "title":
          "Fantom Foundation Removes \$2.4M MULTI from SushiSwap Liquidity Pool",
      "published_at": "1684908407",
    },
    {
      //! BALANCER
      "source":
          "https://www.coindesk.com/business/2023/05/16/balancer-proposes-permissioned-arbitrage-to-rescue-inverse-finances-frozen-crypto/",
      "image":
          "https://www.coindesk.com/resizer/InbTKIFWm_ov7AsxT7g3EDnYHCo=/2112x1188/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/LA2OTMSTTFAKHILJODH46PLR4I.jpg",
      "title":
          "Balancer Might Arbitrage Itself to Rescue Inverse Finance’s Frozen Crypto",
      "published_at": "1684217207",
    },
    {
      //! NO RELATION
      "source":
          "https://www.coindesk.com/business/2023/05/11/polychain-snubs-lucrative-crypto-arbitrage-prepares-to-trade-6m-of-rook-token-on-uniswap/",
      "image":
          "https://www.coindesk.com/resizer/v1d6cWzmEAwn9pW76lfh0E04MaU=/1056x594/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/Y7YJIC55S5CIVDV5U4I3MKXPDE.jpg",
      "title":
          "Polychain Snubs Lucrative Crypto Arbitrage, Prepares to Trade \$6M of ROOK Token on Uniswap",
      "published_at": "1683785207",
    },
    {
      //! 0VIX
      "source":
          "https://www.coindesk.com/business/2023/04/28/defi-protocol-0vix-loses-nearly-2m-in-flash-loan-exploit/",
      "image":
          "https://www.coindesk.com/resizer/OXEyPFhIhLWKz9_g7L8jIQcYTms=/1056x594/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/V42AF25WPBFHBNZBV6YQB4E224.jpg",
      "title": "DeFi Protocol 0VIX Loses Nearly \$2M in Flash-Loan Exploit",
      "published_at": "1683612407",
    },
    {
      //! ALGORAND
      "source":
          "https://www.coindesk.com/business/2023/04/25/algorand-foundation-among-creditors-that-oppose-restructuring-of-trouble-crypto-exchange-hodlnaut/",
      "image":
          "https://www.coindesk.com/resizer/wqdxUUsT3YZEGhr6w2C4gTD1V1k=/2112x1408/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/LV7NHXLGCRAIZFZJKT3OTDRB24.jpg",
      "title":
          "Algorand Foundation Among Creditors Opposing Restructuring of Troubled Crypto Exchange Hodlnaut",
      "published_at": "1682402807",
    },
    {
      //! ETHEREUM
      "source":
          "https://www.coindesk.com/markets/2023/04/17/ethers-strong-price-action-may-continue-until-the-end-of-the-month-coinbase/",
      "image":
          "https://www.coindesk.com/resizer/bbRUORfKB94G7IwXPBOGWRCoL58=/1056x539/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/FJNW3VS6SVHPJOVIW2TYNBFXI4.png",
      "title":
          "Ether’s Strong Price Action May Continue Until End of Month: Coinbase",
      "published_at": "1681711607",
    },
    {
      //! AVALANCHE
      "source":
          "https://www.coindesk.com/business/2023/04/14/avalanche-surges-to-6-month-high-in-daily-active-addresses/",
      "image":
          "https://www.coindesk.com/resizer/e-gtNhVaXpccxB5sqzWax_YO2UU=/2112x1210/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/XG5DA4PCENAEJDK2IZ4QDSYH4E.jpg",
      "title": "Avalanche Surges to 6-Month High in Daily Active Addresses",
      "published_at": "1681452407",
    },
    {
      //! YEARN FINANCE
      "source":
          "https://www.coindesk.com/business/2023/04/13/defi-protocols-aave-yearn-finance-likely-impacted-in-exploit-peckshield/",
      "image":
          "https://www.coindesk.com/resizer/gF8d7CTzkf37Q8jrYMv_RY8QQhQ=/2112x1410/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/GGSGJPQ4IRHMTLJ4ARWKPRILRQ.jpg",
      "title":
          "DeFi Protocol Yearn Finance Impacted in Nearly \$11M Exploit That Occurred Via Aave Version 1",
      "published_at": "1681366007",
    },
    {
      //! UNISWAP
      "source":
          "https://www.coindesk.com/business/2023/04/05/developers-fork-uniswap-v3-protocol-attracts-123m-in-total-value-locked/",
      "image":
          "https://www.coindesk.com/resizer/XmNngNeOmAjx9AAPCT8NKV2X6E0=/2112x1188/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/P2FFRBAUZVD75PQNOSSHWOONEQ.jpg",
      "title":
          "Developers Fork Uniswap V3, Protocol Attracts \$123M in Total Value Locked",
      "published_at": "1680674807",
    },
    {
      //! NO RELATION
      "source":
          "https://www.coindesk.com/markets/2023/04/04/south-korean-traders-are-jumping-on-sxp-icx-tokens/",
      "image":
          "https://www.coindesk.com/resizer/xZdOyLzGDr147IJBEpVAfqbj7kQ=/1056x594/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/3FD7UWWLCVBAFOFXMVHM2SKCAM",
      "title": "South Korean Traders Are Jumping on SXP, ICX Tokens",
      "published_at": "1680674807"
    },
    {
      //! POLKADOT
      "source":
          "https://www.coindesk.com/business/2023/04/04/polkadot-registers-trademark-for-blockchain-communication-platform/",
      "image":
          "https://www.coindesk.com/resizer/JZv5iap8tvqLkGw84wqtN7CTHZs=/1056x594/filters:quality(80):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/coindesk/ZUCIY7NXVJDRTHXICTAKWPYPMI.jpg",
      "title":
          "Polkadot Registers Trademark for Blockchain Communication Platform",
      "published_at": "1680674807"
    },
    {
      //! BITCOIN
      "source":
          "https://decrypt.co/205392/bitcoin-booming-you-earn-more-playing-free-games",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/11/bitcoin-gaming-shutterstock-gID_7.png@webp",
      "title":
          "Bitcoin Is Booming—You Can Earn More by Playing These Free Games",
      "published_at": "1699600007",
    },
    {
      //! ETHEREUM
      "source":
          "https://decrypt.co/205390/ethereum-deflationary-again-why-how-long",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/09/Ethereum-Gas-shutterstock_2299359143-16x9-1-gID_7.jpg@webp",
      "title":
          "Ethereum Has Gone Deflationary Again—Here's Why and What It Means",
      "published_at": "1699513607",
    },
    {
      //! BITCOIN
      "source":
          "https://decrypt.co/205377/a-bitcoin-devs-bot-bucked-brc-20s-now-he-might-share-the-sophon-with-the-world",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/11/plasma-proton-sophon-supercomputer-bitcoin-btc-gID_7.jpg@webp",
      "title":
          "A Bitcoin Dev’s Bot Bucked BRC-20s—Now He Might Share ‘The Sophon’ With the World",
      "published_at": "1699513607",
    },
    {
      //! ETHEREUM
      "source": "https://decrypt.co/205331/ethereum-soars-past-2000",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/11/ethereum-eth-green-background-gID_7.jpg@webp",
      "title": "Ethereum Tops \$2,000 for First Time Since July",
      "published_at": "1699513607",
    },
    {
      //! CARDANO
      "source":
          "https://decrypt.co/204640/xrp-cardano-and-solana-lead-crypto-gains-over-the-week",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2019/10/bitcoin-bulls-price-back-up-pump-gID_7.jpg@webp",
      "title": "XRP, Cardano And Solana Lead Crypto Gains Over the Week",
      "published_at": "1699340807"
    },
    {
      //! AVALANCHE
      "source":
          "https://decrypt.co/204581/ava-labs-employees-report-layoffs-many-people-affected",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2021/03/Avalanche-Sushi-gID_7.jpg@webp",
      "title":
          "Ava Labs Confirms Layoffs, Affecting 12% of Avalanche Studio's Employees",
      "published_at": "1699340807",
    },
    {
      //! DOGECOIN
      "source":
          "https://decrypt.co/204381/dogecoin-sweepstakes-case-heads-to-the-supreme-court",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2022/04/dogecoin-price-trading-gID_7.jpeg@webp",
      "title": "Dogecoin Sweepstakes Case Heads to the Supreme Court",
      "published_at": "1698995207",
    },
    {
      //! UNISWAP
      "source":
          "https://decrypt.co/204120/bitcoin-tops-35k-uniswap-aave-lead-defi-surge",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/06/uniswap-uni-token-defi-decentralized-finance-gID_7.jpg@webp",
      "title":
          "After Bitcoin Tops \$35K, Uniswap and Aave Lead DeFi Token Surge",
      "published_at": "1698908807",
    },
    {
      //! SHIBA INU
      "source":
          "https://decrypt.co/204090/shib-devs-launch-name-service-decentralized-identity-push",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/11/shiba-inu-memecoin-1-gID_7.jpg@webp",
      "title": "SHIB Devs Launch Name Service in Decentralized Identity Push",
      "published_at": "1698908807"
    },
    {
      //! NO RELATION
      "source":
          "https://decrypt.co/203988/safemoon-founders-arrested-doj-indictment-sec-charges",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/11/Shutterstock_2290672573-gID_7.jpg@webp",
      "title":
          "SafeMoon Founders Arrested as DOJ Unseals Indictment, SEC Files Charges",
      "published_at": "1698822407",
    },
    {
      //! BITCOIN
      "source":
          "https://decrypt.co/203801/bitcoin-miner-core-scientific-hits-key-milestone-bankruptcy-process",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2020/06/shutterstock_1071938603-gID_7.jpg@webp",
      "title":
          "Bitcoin Miner Core Scientific Hits Key Milestone in Bankruptcy Process",
      "published_at": "1698736007",
    },
    {
      //! AXIE INFINITY
      "source":
          "https://decrypt.co/203713/crypto-games-gla-xs-ape-mana-sand-gains-bitcoin-etf",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2022/04/metaverse-crypto-nfts-gID_7.jpeg@webp",
      "title": "Gaming Tokens GALA, Axie Infinity, and ApeCoin Post Huge Gains",
      "published_at": "1698649607",
    },
    {
      //! CHAINLINK
      "source":
          "https://decrypt.co/203502/chainlink-jumps-6-while-bitcoin-and-ethereum-hold-steady",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/10/chainlink-coin-link-gID_7.jpg@webp",
      "title": "Chainlink Jumps 6% While Bitcoin and Ethereum Hold Steady",
      "published_at": "1698386807"
    },
    {
      //! DYDX
      "source":
          "https://decrypt.co/203480/new-dydx-chain-denominate-trading-fees-usdc",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/03/dydx-ethereum-cosmos-gID_7.jpg@webp",
      "title": "New dYdX Chain Denominates Trading Fees in USDC",
      "published_at": "1698386807",
    },
    {
      //! ETHEREUM
      "source":
          "https://decrypt.co/205508/ethereum-gaming-tokens-skyrocket-illuvium-ronin-immutable",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/08/gaming-gID_7.jpg@webp",
      "title":
          "Ethereum Gaming Tokens Skyrocket: Illuvium, Ronin, and Immutable Up 50% or More",
      "published_at": "1699631343",
    },
    {
      //! POLYGON
      "source":
          "https://decrypt.co/203226/polygon-launches-new-pol-token-ethereum",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/10/polygon-POL-team-gID_7.jpg@webp",
      "title": "Polygon Deploys New POL Token Contracts on Ethereum",
      "published_at": "1698245343",
    },
    {
      //! DYDX
      "source":
          "https://decrypt.co/202941/dydx-releases-cosmos-based-chain-source-code-ahead-mainnet-launch",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/03/dydx-ethereum-cosmos-gID_7.jpg@webp",
      "title":
          "dYdX Releases Cosmos-Based Chain Source Code Ahead of Mainnet Launch",
      "published_at": "1698158943",
    },
    {
      //! CHAINLINK
      "source":
          "https://decrypt.co/202771/chainlink-leads-crypto-market-rally-soaring-overnight",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2020/04/shutterstock_14246459241-gID_7.jpg@webp",
      "title": "Chainlink Leads Crypto Market Rally, Soaring 8% Overnight",
      "published_at": "1698072543",
    },
    {
      //! ETHEREUM
      "source":
          "https://decrypt.co/202548/vitaliks-biggest-worries-crypto-stagnating-ai-risks-says-ethereum-co-founder",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2018/12/vitalik-gID_7.jpg@webp",
      "title":
          "Vitalik's Biggest Worries? Crypto Stagnating and AI Risks, Says Ethereum Co-Founder",
      "published_at": "1697813343",
    },
    {
      //! MAKER
      "source":
          "https://decrypt.co/202515/maker-annualized-revenue-soars-past-200m-to-new-all-time-high",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2022/05/maker-dao-dai-stablecoin-defi-gID_7.jpg@webp",
      "title":
          "Maker Annualized Revenue Soars Past \$200M to New All-Time High",
      "published_at": "1697813343",
    },
    {
      //! NO RELATION
      "source":
          "https://decrypt.co/202471/sec-dismisses-lawsuit-against-ripple-execs-stunning-capitulation",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2022/10/XRP-shutterstock_1926739472-16x9-1-gID_7.jpg@webp",
      "title":
          "SEC Dismisses Lawsuit Against Ripple Execs in 'Stunning Capitulation'",
      "published_at": "1697813343",
    },
    {
      //! BITCOIN
      "source":
          "https://decrypt.co/202416/bitcoin-etf-could-be-approved-in-time-for-christmas-says-jp-morgan",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/10/Shutterstock_1871051482-gID_7.jpg@webp",
      "title":
          "Bitcoin ETF Could Be Approved in Time for Christmas, Says JP Morgan",
      "published_at": "1697726943",
    },
    {
      //! POLYGON
      "source":
          "https://decrypt.co/202342/polygon-paves-way-for-governance-2-0-with-introduction-of-protocol-council",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/06/polygon-smart-phone-gID_7.jpg@webp",
      "title":
          "Polygon Paves Way for Governance 2.0 with Introduction of Protocol Council",
      "published_at": "1697726943",
    },
    {
      //! SHIBA INU
      "source":
          "https://decrypt.co/202268/can-shiba-inu-break-video-game-speedrun-record",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2021/08/dogecoin-dog-meme-coins-tokens-gID_7.jpg@webp",
      "title": "Can a Shiba Inu Break a Video Game Speedrun Record?",
      "published_at": "1697726943",
    },
    {
      //! BITCOIN
      "source":
          "https://decrypt.co/202165/mike-novogratz-says-a-spot-bitcoin-etf-will-be-approved-in-2023",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2021/09/novogratz-mainnet-gID_7.jpg@webp",
      "title":
          "Mike Novogratz Says a Spot Bitcoin ETF Will Be Approved in 2023",
      "published_at": "1697640543",
    },
    {
      //! ETHEREUM
      "source":
          "https://decrypt.co/201968/line-validators-looking-stake-ethereum-is-getting-shorter-heres-why",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2022/09/ethereum-staking-crypto-gID_7.jpg@webp",
      "title": "Ethereum Staking Is Losing Its Appeal–Here's Why",
      "published_at": "1697554143",
    },
    {
      //! UNISWAP
      "source":
          "https://decrypt.co/201881/ethereum-defi-exchange-uniswap-adds-fees-sparks-controversy",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/06/uniswap-uni-token-defi-decentralized-finance-gID_7.jpg@webp",
      "title": "Ethereum DeFi Exchange Uniswap Adds Fees, Sparks Controversy",
      "published_at": "1697554143",
    },
    {
      //! BITCOIN
      "source":
          "https://decrypt.co/201821/bitcoin-mining-activity-surges-difficulty-soars-new-peak",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/09/bitcoin-btc-mining-hashrate-token-gID_7.jpg@webp",
      "title": "Bitcoin Mining Activity Surges as Difficulty Soars to New Peak",
      "published_at": "1697467743",
    },
    {
      //! UNISWAP
      "source":
          "https://decrypt.co/201782/your-favorite-uniswap-pool-may-soon-include-a-kyc-check",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2021/07/uniswap-voting-governance-gID_7.png@webp",
      "title": "Your Favorite Uniswap Pool May Soon Include a KYC Check",
      "published_at": "1697467743",
    },
    {
      //! DOGECOIN
      "source":
          "https://decrypt.co/201448/you-can-buy-taylor-swift-movie-tickets-bitcoin-dogecoin-shib",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/10/taylor-swift-eras-gID_7.png@webp",
      "title":
          "You Can Buy Taylor Swift Movie Tickets With Bitcoin, Dogecoin, and SHIB",
      "published_at": "1697208543",
    },
    {
      //! UNISWAP
      "source":
          "https://decrypt.co/201327/uniswap-launches-mobile-ethereum-wallet-android",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2022/05/uniswap-gID_7.jpg@webp",
      "title": "Uniswap Launches Mobile Ethereum Wallet on Android",
      "published_at": "1697208543",
    },
    {
      //! ETHEREUM
      "source":
          "https://decrypt.co/201001/ethereum-gas-fees-hits-new-low2023-defi-nft-activity-drops",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/09/Ethereum-Gas-shutterstock_2299359143-16x9-1-gID_7.jpg@webp",
      "title":
          "Ethereum Gas Fees Hit New Low for 2023 as DeFi, NFT Activity Drops",
      "published_at": "1697035743",
    },
    {
      //! ARBITRUM
      "source":
          "https://decrypt.co/200999/lidos-arbitrum-proposal-splits-community-over-grant-size-centralization-concerns",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2019/12/crypto-blockchain-uk-general-election-vote-gID_7.jpg@webp",
      "title":
          "Lido's Arbitrum Proposal Splits Community Over Grant Size, Centralization Concerns",
      "published_at": "1697035743",
    },
    {
      //! NO RELATION
      "source":
          "https://decrypt.co/200933/tamagotchi-bathing-ape-bape-bandai-virtual-pets-streetwear",
      "image":
          "https://img.decrypt.co/insecure/rs:fit:1536:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/10/bape-tamagotchi-gID_7.png@webp",
      "title":
          "BAPE Bets on Virtual Pet Nostalgia With Tamagotchi Streetwear Collab",
      "published_at": "1697035743",
    }
  ];

  for (dynamic newsArticle in staticNews) {
    dynamic formattedArticle = {
      "title": newsArticle["title"],
      "image": newsArticle["image"],
      "source": newsArticle["source"],
      "published_at": DateTime.fromMillisecondsSinceEpoch(
              int.parse(newsArticle["published_at"]) * 1000)
          .toIso8601String(),
      "comments_count": 0,
      "discord_thread": null,
    };

    try {
      await dio.post("https://dash.blocktalk.tv/items/news",
          data: jsonEncode(formattedArticle),
          options: Options(method: "POST", headers: {
            "Authorization": "Bearer voP37TtQy_2aFQI0LOo7Fxv7sG4GxaZM"
          }));
    } catch (_, __) {
      // print(__);
    }

    sleep(const Duration(seconds: 5));
  }
}
