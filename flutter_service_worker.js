'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "8a762ec15172bf60e9e2ee300f639720",
"index.html": "940e354e0ee440c402ac69e9c4d96a48",
"/": "940e354e0ee440c402ac69e9c4d96a48",
"main.dart.js": "31ec0b244a183887401c596333f6ae8f",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "ec475297e87041b362723267ae60b9f0",
"assets/AssetManifest.json": "b052c05f8dc24798c08eebbc939e24b8",
"assets/NOTICES": "294341b83213571b9adbea6e39348bff",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "9563c362d6abd06e09322817b5bae51a",
"assets/packages/hzy_common_module/assets/common_nav.png": "9e73b3f21e48982cc8cebeed0473b60d",
"assets/packages/hzy_common_module/assets/dark_common_nav.png": "277e4283d884d86f1efd4db458cb3d7c",
"assets/packages/hzy_common_module/assets/image_failed.jpg": "dfe8dd807e09431646087324a89e9002",
"assets/packages/hzy_common_module/assets/image_error.png": "a6c287abd9a7c494f4ac2e82e7d19393",
"assets/packages/hzy_common_module/assets/img_record.png": "2c06b9082a6989b03d8ccf7f0ea2d1c9",
"assets/packages/hzy_common_module/assets/loadingg.gif": "bededa114f249499561f3a1275a547bd",
"assets/packages/hzy_common_module/assets/qyg_shop_icon_display.png": "56cff51e28d7e10f12f605aa281986d4",
"assets/packages/hzy_common_module/assets/qyg_shop_icon_hide.png": "bc8a2bf2f7790ee16cae9a839896bafd",
"assets/packages/hzy_common_module/assets/qyg_shop_icon_delete.png": "90f2e8c7f5296a7b696411fbf4c04503",
"assets/packages/loading_more_list/assets/empty.jpeg": "52a69bab9f87bcf0052d8e55ea314977",
"assets/packages/scrollerview_demo/assets/app_loading_logo.gif": "c7561002355cf3dee4113e80ae396bad",
"assets/packages/scrollerview_demo/assets/man.png": "4567b8387d95698c6eab21fced849a66",
"assets/packages/scrollerview_demo/assets/467141054.jpg": "4f4d61411d64218b30972613b2b17e6a",
"assets/packages/scrollerview_demo/assets/banner3.webp": "d9019a2193a6589cafffd0117fd0c646",
"assets/packages/extended_sliver_demo/assets/flutter_candies_logo.png": "be4d473295d5af30e6af6cdcac3799bb",
"assets/packages/extended_sliver_demo/assets/cypridina.jpeg": "f1392001a557dcd3c5b30a2d860b16f9",
"assets/packages/animation_demo/assets/maomi1.jpg": "0002eff902e27f457170c95b4bb69c12",
"assets/packages/animation_demo/assets/maomi2.jpg": "2ce0a543cf0365417f4cca50ce0153c1",
"assets/packages/animation_demo/assets/maomi3.jpg": "8992581166d0b8f05e9d442e6bd0506f",
"assets/packages/animation_demo/assets/banner3.webp": "d9019a2193a6589cafffd0117fd0c646",
"assets/packages/common_demo/assets/banner5.jpeg": "1f81f9f1fe7b9be0e02fbd625a20410f",
"assets/packages/common_demo/assets/banner1.webp": "c1e467c5bbc35ee7983dc57441f90c38",
"assets/packages/common_demo/assets/app_icon.png": "11da9c35a3bb45ca4c7e6d66c7dc9955",
"assets/packages/common_demo/assets/wx.png": "379ed8a9da94e66f26ee39ef5fb14d35",
"assets/packages/common_demo/assets/tianyi.png": "c20c21ab288bdba5f0ba4fc5178cd9be",
"assets/packages/common_demo/assets/welcome_bg.jpeg": "10edecb36557fac12c504b2e59f5feac",
"assets/packages/common_demo/assets/banner4.webp": "1a59bc16fc646244bf5c33767f2a3382",
"assets/packages/common_demo/assets/qq.png": "a47a180279e51e4d2d6a7ab82db9a961",
"assets/packages/common_demo/assets/LiquidSwipe.webp": "354292a7059ba0f63c3193df264df522",
"assets/packages/common_demo/assets/banner2.webp": "c5413eedfc17e40db7139104445b11fc",
"assets/packages/common_demo/assets/banner3.webp": "d9019a2193a6589cafffd0117fd0c646",
"assets/packages/common_demo/assets/banner6.jpeg": "9ace1a9cd9cd41b88049a1180c917653",
"assets/packages/demo_jingdong/assets/images/guide/app_guide_2.png": "9485b8f5a58c66cdabcbfe99b7251a7c",
"assets/packages/demo_jingdong/assets/images/guide/app_guide_3.png": "4ff7dcba3f86a3e8442d003b7885be66",
"assets/packages/demo_jingdong/assets/images/guide/app_guide_1.png": "248485dc2201f7e17ee73f85db61c0dc",
"assets/packages/demo_jingdong/assets/images/guide/design_skateboards.webp": "d2a7838f442c95c41a21df9ea3fda379",
"assets/packages/demo_jingdong/assets/images/guide/samurai.jpg": "810a3fab749458c42efe8c5a82a9c75f",
"assets/packages/demo_jingdong/assets/images/guide/reject.jpg": "4483c6af822f538921d2873ce034002c",
"assets/packages/demo_jingdong/assets/images/guide/greatwave.jpg": "61470cbd5c4e119c7ae0fde176c31c2d",
"assets/packages/demo_jingdong/assets/images/home/sss_aso_category_btn_Normal.png": "0e0191f5c88baa0da9ef2d90a5d8b1d8",
"assets/packages/demo_jingdong/assets/images/home/sss_aso_category_btn_black_Normal.png": "d1049995fd1a6ad620ef671f0628042b",
"assets/packages/demo_jingdong/assets/images/discover/jdfa_see_light_Normal.png": "cf1804dc6649317754f10eabbbfcda83",
"assets/packages/demo_jingdong/assets/images/discover/jdfa_comm_light_Normal.png": "37aa8c074ef25e9ca3a467114816ec87",
"assets/packages/demo_jingdong/assets/images/discover/jdfa_like_light_Normal.png": "c4f601b38b3862dc8c7dfdc330590903",
"assets/packages/demo_jingdong/assets/images/loading/app_loading_logo.gif": "d9d3dd1d4c1a36a721841c1dc0ee3e8a",
"assets/packages/demo_jingdong/assets/images/product/more_black_Normal.png": "69a3318d7bfc18f181369b5db54ff6dc",
"assets/packages/demo_jingdong/assets/images/product/more_white_Normal.png": "ef396c98fa3fa9fb28be69532ba9e4b9",
"assets/packages/demo_jingdong/assets/images/product/share_white_Normal.png": "4d6467e7b906c22b84c09afd31dc1aed",
"assets/packages/demo_jingdong/assets/images/product/back_gray_Normal.png": "29b927d965eadc2f34496ded4ef38611",
"assets/packages/demo_jingdong/assets/images/product/back_white_Normal.png": "b7354c475657a150d950095c2aa24153",
"assets/packages/demo_jingdong/assets/images/product/share_gray_Normal.png": "edac31d7255c830c6f2fd0dd92de4f64",
"assets/packages/demo_jingdong/assets/images/news/%25E5%2585%25B3%25E6%25B3%25A8ICON-%25E9%25BB%2591_Normal.png": "86349da03ba4a82166ec52360eb5171d",
"assets/packages/demo_jingdong/assets/images/login/WJLogin_Wechat.png": "dae7b15d94dffa4e1ad8e2cf3878517e",
"assets/packages/demo_jingdong/assets/images/login/checked.png": "976ce736a40bcd831d89815245780c8c",
"assets/packages/demo_jingdong/assets/images/login/WJLogin_QQ.png": "43d1bc8663fd6a742a90e21e0e8e46e4",
"assets/packages/demo_jingdong/assets/images/login/qyg_shop_icon_display.png": "56cff51e28d7e10f12f605aa281986d4",
"assets/packages/demo_jingdong/assets/images/login/unchecked.png": "a398940bb4cc555b9ddf9396251137a3",
"assets/packages/demo_jingdong/assets/images/login/qyg_shop_icon_hide.png": "bc8a2bf2f7790ee16cae9a839896bafd",
"assets/packages/demo_jingdong/assets/images/login/qyg_shop_icon_delete.png": "90f2e8c7f5296a7b696411fbf4c04503",
"assets/packages/demo_jingdong/assets/images/store/icon_success.png": "ea99d3a18826591ec793d98c48ebf4d2",
"assets/packages/demo_jingdong/assets/images/store/icon_wait.png": "e90c802bd84492c6c8c82d9fb5b1c5e3",
"assets/packages/demo_jingdong/assets/images/store/icon_failure.png": "7dde3afede0f1be0c158fd76e258b1f9",
"assets/packages/demo_jingdong/assets/images/store/icon_zj.png": "d548a93d3c6513742990b8f512661796",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/IMG_0200.JPG": "145799842e17ad8ec3a6ecb34512ce32",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pmid/142/queryPanamaFloor.json": "63b0da0ceb5a1857e2dd45d821554ba0",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/700/categoryFeeds_1.json": "6032e9ea70328ec56aadddf4b4b96ad2",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/700/categoryFeeds_3.json": "1129be227713767bf3ddd8052e0e322d",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/700/categoryFeeds_2.json": "41ec3fdac8d2e6ab48d22210c948f0c7",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/700/categoryHome.json": "0298a37523b2d1e86fd1a81d4a49b71d",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/700/categoryFeeds_5.json": "8a6cdb76f9a46268fd318e80285bddaf",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/700/categoryFeeds_4.json": "e333316ef232fa2ccd99ff738260530e",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/1761/categoryFeeds_1.json": "2ab4b6860f3004a0ed850717d94b8c81",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/1761/categoryFeeds_3.json": "54ff7c28eaad6af99ccc2de75bb360fa",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/1761/categoryFeeds_2.json": "09c27dbc60176d17ebfb41d2621b9e51",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/1761/categoryHome.json": "948e1ad7d203b08b82c02d7448f86a88",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/1761/categoryFeeds_5.json": "8a6cdb76f9a46268fd318e80285bddaf",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/1761/categoryFeeds_4.json": "fe19283fc031c44b19c2d9c3241b1658",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/234/categoryFeeds_1.json": "a454d1c63ae8c845827f4877a2bf4bb0",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/234/categoryFeeds_3.json": "5c4727b829513f9b9eb4b7e8bf5720cd",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/234/categoryFeeds_2.json": "daff080773ef10fd36d384079732d6bf",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/234/categoryHome.json": "b2f47f984a114cb57b11755bc1c4be30",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/234/categoryFeeds_5.json": "8a6cdb76f9a46268fd318e80285bddaf",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/234/categoryFeeds_4.json": "8963a91b54a765f089569097a5586a54",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryFeeds_7.json": "08c8f8810bf5fd5c67ab9f86352e44c2",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryFeeds_6.json": "17ac9325192bd55de1caf49434aa3d9d",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryFeeds_1.json": "e5932eeabe5aa57212e4d20d04a80806",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryFeeds_10.json": "ee29e9b60c9918c243387b8f54c1982e",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryFeeds_3.json": "3bf2a776ced4fd383824b65b310fb009",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryFeeds_2.json": "80ef54fcfdd611e6ae21317b3da1729c",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryHome.json": "1195ea0664c620619c355b4955f76e11",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryFeeds_11.json": "37a0fb8cad3082313de7d565034596d0",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryFeeds_5.json": "19c1abe7bb81cb2c1e273401f8dc7341",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryFeeds_9.json": "b5dd2d1aedee666b40ef2cd96a95a9ba",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryFeeds_8.json": "e09e8dd4aa39cdfcfcf6d8eadc81cfa7",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/248/categoryFeeds_4.json": "3f25cd35e21093fc8f2d561c708e9ef4",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/246/categoryFeeds_1.json": "964fd228939a1c3c19c755214c0d9791",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/246/categoryFeeds_3.json": "5b9479231678cc1aa17a82eef54e3b8b",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/246/categoryFeeds_2.json": "808033da6dd59798d7a1aecbfc141534",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/246/categoryHome.json": "ebfa4f4594b9e57eff0ab49fdaa8e75d",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/246/categoryFeeds_5.json": "8a6cdb76f9a46268fd318e80285bddaf",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/246/categoryFeeds_4.json": "ab325cdf5133e96d3c6f78dc1fdff897",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/237/categoryFeeds_1.json": "e5ee03e05a7fd18c00594da8ebbd74dd",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/237/categoryFeeds_3.json": "6d8a2b7002e6a2c6b9b526c26b8c56d4",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/237/categoryFeeds_2.json": "453ac3879d5159f896f354260883fd17",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/237/categoryHome.json": "b69f03ce77388e1434f8be99a3702ebf",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/237/categoryFeeds_5.json": "17b0aa01b18332afe1e25921106b1653",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/237/categoryFeeds_4.json": "a987d1351b95ad07ef3d85b975a938c6",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/2230/categoryFeeds_1.json": "e5ee03e05a7fd18c00594da8ebbd74dd",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/2230/categoryFeeds_3.json": "6d8a2b7002e6a2c6b9b526c26b8c56d4",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/2230/categoryFeeds_2.json": "453ac3879d5159f896f354260883fd17",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/2230/categoryHome.json": "b82a52d53a7ebf59a482d6e13148dfc5",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/2230/categoryFeeds_5.json": "17b0aa01b18332afe1e25921106b1653",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/category/pcid/2230/categoryFeeds_4.json": "a987d1351b95ad07ef3d85b975a938c6",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/welcomeHome.json": "fd954d167bdfe4ace263fca74b814116",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/uniformRecommend.json": "ee856e65a278d4011e8c4e2612dd9e04",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/hours/hours_home.json": "40092bb4ee23cc68b85ac6f2173408be",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/hours/hours_feeds.json": "0a91c5062bdd6badc606d320601d2dca",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/home/searchBoxWord.json": "d7d251852dad108ddaded212529ac9c0",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/category/getCmsPromotionsListByCatelogyID.json": "1f3fdf1fa2367ca09c0e5fee67683d6c",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/category/cid/300015294/result_1.json": "7702acdf1cc29c259d13944195730af8",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/category/cid/0/result_1.json": "a80a65ff13b23eded7a07695884541a6",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/category/cid/300014703/result_1.json": "25cb98d67ba303e22bf9cf1b465bf1c3",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/category/cid/300015359/result_1.json": "93d7b494d7755941ced0a7f00a69b71d",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/category/entranceCatalog.json": "00ee002ba40a6a245913e3b8821eecf7",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/allOrder/result_6.json": "d5838e90d99eaf8b0178337b2da84d40",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/allOrder/result_1.json": "00304cf7b5ec9f6899c480e5bc8e6a9a",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/allOrder/result_2.json": "777e7aecf25e5d68b441397f8c52f994",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/allOrder/result_3.json": "836ca2ee46323a09b804d257b974e6d3",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/allOrder/result_4.json": "2d5970cd72615bda198bbd081e90a456",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/allOrder/result_5.json": "eb8707855f9aad2b01b95f2153966393",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/wait4PaymentOrder/result_1.json": "d781c66c3ddd30b0ca5f67cb95b084b1",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/wait4PaymentOrder/result_2.json": "d781c66c3ddd30b0ca5f67cb95b084b1",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/wait4PaymentOrder/result_3.json": "830218876c8d23e9b05f2edf8e7c30f5",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/cancleOrder/result_1.json": "1391dc1ab4043dc70d537cd0f6253b74",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/cancleOrder/result_2.json": "3a98befb873b7b04d47e436262d754a4",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/cancleOrder/result_3.json": "acb698c6159205758a46d891822ff154",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/completedOrder/result_1.json": "3077e933b8ca517ddfcebe68061495a9",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/completedOrder/result_2.json": "4b20a9c0aec7b5523513e5f0a35130a5",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/completedOrder/result_3.json": "c6970419589dc5d1affc5c1755ff8ee7",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/newPurchaseWareCheck.json": "224ef9c03f2832d9dce2206ced855897",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/wait4DeliveryOrder/result_1.json": "b0816cf486f3e1f760551d4185107ec9",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/wait4DeliveryOrder/result_2.json": "b0816cf486f3e1f760551d4185107ec9",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/wait4DeliveryOrder/result_3.json": "b53c22f7db8455f5f992600aab0f5e2d",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/order/allOrdersFunctionNewList.json": "5e148562acbb0cf4491bfc7f251248f4",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/browseHistory/result_1.json": "a592b733f00b1ecf7d72946814539b19",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/browseHistory/result_2.json": "69046e718c787c63748ba8ce91d622af",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/browseHistory/result_3.json": "fd7484b19f65d1a4b0f50d97f0b83e78",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/browseHistory/result_4.json": "b2380c1cca03bb6c88211dd4eda57b48",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/browseHistory/result_5.json": "53e8479eb2d84e64dfc845d84d6363b0",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/generalFunctionInfo.json": "b1cd771202341251f23228f41024bd7b",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/newUserInfo.json": "698fa185920c7be7cf85aa9484ee9d83",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/myjdSetBusiness.json": "7ed78c7f6b9d6ab2a8cab5b2beaa63c4",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/recommend/categoryFeeds_1.json": "a454d1c63ae8c845827f4877a2bf4bb0",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/recommend/categoryFeeds_3.json": "5c4727b829513f9b9eb4b7e8bf5720cd",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/recommend/categoryFeeds_2.json": "daff080773ef10fd36d384079732d6bf",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/recommend/categoryFeeds_5.json": "8a6cdb76f9a46268fd318e80285bddaf",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/recommend/categoryFeeds_4.json": "8963a91b54a765f089569097a5586a54",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/moreActivityInfo.json": "0cb790e0953446782f59ae81041be638",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/favorite/result_1.json": "57b50dce7919c0fe45099befc0c39711",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/favorite/result_2.json": "e8561db711e016bff3b3e653c0bafa55",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/favorite/result_3.json": "c065cb4760e66a7025d9962d0b9984a7",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/address/addAddressPage.json": "235ffc76f66b29519cee19803c1441ca",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/address/getAddressByPin.json": "21ae97999a4f0267b739fab1c85f6062",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/person/personinfoBusiness.json": "d2ef01a94dc1e22ba315acb3f62d0967",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/discovery/jdDiscoveryFloorWithList.json": "921ffe702a82d597a4a2a7a28d77181d",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/discovery/follow/followV2EnterMainPage.json": "ca95d1ecddf3fece78a14ab04f68774f",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/discovery/feedStream/ugc_IndexFeedStream.json": "ef53c34a9629bfe63a8ff0e1e0b6a863",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/cart/confirmOrder/getAddressByPin.json": "0221e68d850b2c1d5803dfce45ead91b",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/cart/confirmOrder/currentOrder.json": "418e12637205524b28323482ae75d26b",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/cart/uniformRecommend/result_1.json": "0eb3160f0206c7b3f46c52b3f5f4c3f9",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/cart/uniformRecommend/result_2.json": "ab9951cb9f5c2c3a013ef71787612877",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/cart/uniformRecommend/result_3.json": "818c5405b759cf8332d1341cb4fa233f",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/cart/cart.json": "0a73d485bebe8b6a88bd8240166a7b80",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/discFollow/discFollowNextContent/result_1.json": "d2fc57cfe6884fadde27e17f07d8bead",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/discFollow/discFollowNextContent/result_2.json": "4e5bb54e5a6a6335d4ece107f2ca520b",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/discFollow/discFollowNextContent/result_3.json": "2508556818d54d08ae82ac4e4af5ad54",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/discFollow/discFollowEnterMainPage.json": "bceeee5e3e943561fe2ae641f68c01ce",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getNewsTrendsTabHomeInfo.json": "b41fa0af56f37f771547ebc3316f452f",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabHomeInfo.json": "d0614a361b1922a22a02b23beb3e03a8",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getRecommendNewFeedsList/result_1.json": "4a635654904fa468406150118fbfd319",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getRecommendNewFeedsList/result_2.json": "9eb05dece88c4cd46f5137f17074bfc7",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getRecommendNewFeedsList/result_3.json": "dd646cdf32b0f5b047852180eacefee4",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/95/result_1.json": "eeb3de76e8bcc4d38978727af3f01788",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/95/result_2.json": "82665c4b9090e64d2f52f7e4b539c776",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/95/result_3.json": "8864432aabbfc21db5829332c7cfa21d",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/95/result_4.json": "9e0c24b0ec1ce3303eb230b36d5bc9db",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/95/result_5.json": "023e3f10232bdc8890b48b25bdabc6d1",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/20/result_1.json": "06358c5c6b9a76af109a161429dd1e34",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/20/qryH5BabelFloors.json": "1f02680200c32e20d3a9b2bb8e5dcf7f",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/9/result_1.json": "e7b157d887ad603e7d42df49048b7881",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/9/result_2.json": "59fc06897d69603b8fe625ce789cc5b5",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/9/result_3.json": "8e359b46b3944396f2f8d0a1c195653d",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/9/result_4.json": "1514fa426647d4a4521f575a05cdf538",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/9/result_5.json": "0a2e98aa17f3f3c13730ac377dca8b36",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/7/result_1.json": "83429f57da51941765568a6d7d654e85",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/1/result_6.json": "b4309045a80f28eb38ace18b2ddc3a95",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/1/result_7.json": "8babe56bd076f4da0e288980ab4b8ea1",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/1/result_1.json": "9013d23a4cc887d31ac5519b2449ce14",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/1/result_2.json": "c3d400489d184275f69226f833066a73",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/1/result_3.json": "4632fdc245996226cb761ed435fe7cb1",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/1/result_4.json": "13eadeb4ebd609c7979cee4f8468789a",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/1/result_5.json": "71ac3f89c91a08f5acf91f8f5dc6d6e0",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/19/result_1.json": "428d28480b3d0af450f785ddb7a47307",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/19/result_2.json": "8c46288f12fc77e38c931a92796b3ac0",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/19/result_3.json": "b0ecd7daa1c92e10dc7e4f9dbe21aa96",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/19/result_4.json": "3f07991d3dca7213edc1b2d6675aca4e",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/19/result_5.json": "9bbc3c8c8c08b6b419176ca4d8748c79",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/22/result_6.json": "e3a565fa06c1a1ebda940b9664ad962a",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/22/result_7.json": "bc658205d82e59bd2734efdd8db73673",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/22/result_1.json": "5be26783e154d4ca4dc1661c84f5af60",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/22/result_2.json": "46a0613e698dbd34e8728cc0c8bfba20",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/22/result_3.json": "7f759c687e48c8674f7c9d0129695c3a",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/22/result_4.json": "5210b1725f1caa8a72937081ab39ee13",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getTabProductsList/22/result_5.json": "6324caaec52df7d446e8e8327a9dc484",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getNewsTrendsTabDetails/result_1.json": "55a282526cad2c3d0166a841fc50bdb2",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getNewsTrendsTabDetails/result_2.json": "487e8824ec8685507ff30786fa7801aa",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getNewsTrendsTabDetails/result_3.json": "9fe7b3b16abe2a6d9e70bb42cebe0d77",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getNewsTrendsTabDetails/result_4.json": "4d40286d986b6cb7e828128f5b7d96c3",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/tab/xinpin/getNewsTrendsTabDetails/result_5.json": "65315a332ce4a3cbc71d3fac18eb4c96",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/product/shopId/19769/sku/44096580396/asynInteface.json": "b793ace9375e15371bdcbb987345c641",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/product/shopId/19769/sku/44096580396/obtainGrowingInfo.json": "4ce695c194c6f27c2a523c637c37009b",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/product/shopId/19769/sku/44096580396/getLegoWareDetailComment.json": "4beabab34c651ee9578081216826e5b2",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/product/shopId/19769/sku/44096580396/wareBusiness.json": "f9f6701de42400e6a0937319b5b9ed03",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/product/shopId/19769/sku/44096580396/uniformRecommend.json": "b43be2644a929acb366bfef685ad87c9",
"assets/packages/demo_jingdong/assets/json/mock-data/functionId/@new/product/shopId/19769/sku/44096580396/queryTemplates.json": "2d35f7c06061f46c8ed34f1acfd3bc83",
"assets/packages/demo_jingdong/assets/lottiefiles/camptravel.zip": "19d29890b1dc0b67745b343bf8629066",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash.zip": "fec0b2a86b47c50b858df4f4fe1c1c4e",
"assets/packages/demo_jingdong/assets/lottiefiles/bird-flying.json": "b520420853131232650cc7f73c8753f8",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_10.png": "9b253f47f9581a8a0d93b8b3cfec7ff7",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_1.png": "4fe4c68db2009c9d64545689315dd700",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_0.png": "5d139c563e48135e782c653dd4602b37",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_11.png": "b15c9bf5188319dc79a567f097b536b9",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_13.png": "b2fdcccc4f26fe1ad64b3bed23fa845e",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_2.png": "3ef7b9542420f731641d8d9e12a9ed58",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_3.png": "1f2e123049a5b3857f29e2a2e2266edc",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_12.png": "da5bcd30af823f4e859d6691cd5ce634",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_16.png": "5f4536d502a039ebef9cccc182f254cb",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_7.png": "1791328c252221cafcca7d860d55647e",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_6.png": "f85d879859c169cf99076dab48f07674",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_17.png": "83a813845510a110f93a02d7549ef744",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_15.png": "6fb18d1af669a59251983ebda76ab4b2",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_4.png": "b5632c9ca7c31670836908d2f27c6434",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_5.png": "3d46602bbe6e0ae2c9917cc9133f71dd",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_14.png": "a6886dc2df38ad786cf4a58a4bc5aee1",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_19.jpg": "ead9e7de79e4d2d297ba5ffe69db150a",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_8.png": "a98fe10174d75d759651a26c2cee3f95",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_9.png": "16ae481bf9f515b130a38c50ee134a0a",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/images/img_18.png": "0fa63a743c7fd93089fe15f46f4fe461",
"assets/packages/demo_jingdong/assets/lottiefiles/mdb_splash/data.json": "6478a19a9f2c149c9a23d08a8a0b5ca9",
"assets/packages/demo_jingdong/assets/lottiefiles/angel.zip": "7a275062db48fe882d1cbba4ed40da04",
"assets/packages/demo_jingdong/assets/lottiefiles/ball_&_map.zip": "0749719b093d0cec7b378ccc6d3ea9eb",
"assets/packages/flutter_update_dialog/assets/update_ic_close.png": "cef2924be0e145da7ab1eba16043decc",
"assets/packages/flutter_update_dialog/assets/update_bg_app_top.png": "55c14a0a8dc55c20f5eb49443c248348",
"assets/packages/canvas_demo/assets/banner5.jpeg": "1f81f9f1fe7b9be0e02fbd625a20410f",
"assets/packages/canvas_demo/assets/banner1.webp": "c1e467c5bbc35ee7983dc57441f90c38",
"assets/packages/canvas_demo/assets/maomi2.jpg": "2ce0a543cf0365417f4cca50ce0153c1",
"assets/packages/canvas_demo/assets/audio_waveform.png": "7cea360cf7588f9abb7a9011119e3eb6",
"assets/packages/canvas_demo/assets/welcome_bg.jpeg": "10edecb36557fac12c504b2e59f5feac",
"assets/packages/canvas_demo/assets/banner4.webp": "1a59bc16fc646244bf5c33767f2a3382",
"assets/packages/canvas_demo/assets/banner2.webp": "c5413eedfc17e40db7139104445b11fc",
"assets/packages/canvas_demo/assets/bg_snow.png": "64ef35d5b1dd20740fc7779da7d6bc74",
"assets/packages/canvas_demo/assets/banner3.webp": "d9019a2193a6589cafffd0117fd0c646",
"assets/packages/canvas_demo/assets/banner6.jpeg": "9ace1a9cd9cd41b88049a1180c917653",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "9728c1213922d421eb5792d5a52363e7",
"assets/fonts/MaterialIcons-Regular.otf": "e048d1e3d60a327c640e9664c7b35042",
"assets/assets/images/ic_launch.png": "4ba77a6017955d78790ebfdff75ea3ae",
"assets/assets/images/example/lol_vn.png": "11de582b93008ede39c47749ed237e2d",
"assets/assets/images/example/lol_ys.png": "320f239b20580d4d0e6905770f5ea7a9",
"assets/assets/images/example/lol_ey.png": "a2095a52e3db5c7d3fd6e663d5144aa1",
"assets/assets/images/example/hytop.png": "87265bb617013d0fd0a293d586277cc1",
"assets/assets/images/example/lol_jie.png": "d73309267b0feca78389fe86eccc471a",
"assets/assets/images/example/lol_ak.png": "211b5dc093fa0381554f1465b66a1a1d",
"assets/assets/images/tabbar/icon_fw_nor.png": "cfa096472f01c321fef7106dd34b3d09",
"assets/assets/images/tabbar/icon_my_pre.png": "c8d84d4a0193391aa60e56698cf07cda",
"assets/assets/images/tabbar/icon_wt_pre.png": "e544b362a6ade603c342fe2d33fc728b",
"assets/assets/images/tabbar/icon_wt_nor.png": "1eb3c87271d6137349dbc92561db3c6a",
"assets/assets/images/tabbar/icon_my_nor.png": "6b171503b20c05c2c483e1d50c188c9f",
"assets/assets/images/tabbar/icon_fw_pre.png": "ac56223c11e312a05a85f40bb75f1b1d",
"assets/assets/images/my/dark_common_nav_big.png": "e4e08a3425d671f065f62de80635e932",
"assets/assets/images/my/common_nav_big.png": "91fa7435fa97268424a31a523a9dba0b",
"assets/assets/images/my/yhq.png": "6eddb0156025aa64a0af807bee2724c6",
"assets/assets/images/my/img_bg.png": "2dee547d90c165e8e176f077d39e71dc",
"assets/assets/images/my/dd.png": "1251c8124f3aec725c97b3884c8a272f",
"assets/assets/markdown/m_tree.png": "e5ecb69cd3e812c2a0bda6c2df27dd3f",
"assets/assets/markdown/README.md": "8ab69eb900466d0e8cbda7bb77e78381",
"assets/assets/markdown/e_tree.png": "c1c63aeeb3b362c461d616a78792a116",
"assets/assets/markdown/syllabus.md": "fb16d94ffe3d5c7105ad6dc6b68a942d",
"assets/assets/markdown/p_tree.png": "d60e6a9e3bb1ae92f94f4a5ca3350dbf",
"assets/assets/markdown/basicView.md": "a7c1e145b0e9135821bbb1c47910005f",
"assets/assets/markdown/basic_ms.jpeg": "1ff1a8b9429a11e1481aba71ffc1777a",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
