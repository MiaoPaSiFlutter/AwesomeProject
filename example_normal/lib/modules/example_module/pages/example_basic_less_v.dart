/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 11:15:38
 * @LastEditors: TT
 * @LastEditTime: 2023-05-17 15:07:21
 */

import 'package:flutter/foundation.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';
import '../compontents/example_list_widget.dart';
import '../models/image_model.dart';
import '../models/tu_chong_model.dart';

class ExampleBasiclessV extends CommonLessV {
  ExampleBasiclessV({super.key});
  @override
  String? createAppBarTitleStr() {
    HzyNormalItemModel itemModel = currentGetArguments();
    return itemModel.leftMsg;
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = ExampleListWidget(
      list: kIsWeb
          ? [
              TuChongItem.fromJson(
                {
                  "post_id": 123025576,
                  "type": "multi-photo",
                  "url": "https://tuchong.com/12772247/123025576/",
                  "site_id": "12772247",
                  "author_id": "12772247",
                  "published_at": "2023-04-28 10:15:30",
                  "passed_time": "04月28日",
                  "excerpt":
                      "📸「广州东山口拍照打卡」文艺范的东山口，在这里🏛️西式风格建筑与广式烟火气息并不冲突，反而意外适配，滋生出独特的韵味\n\n🤔里面有充满艺术氛围☕️小咖啡店、买手店、独立工作室、潮牌店等\n🤭里面也是各个街拍网红的打卡地，经常也看到新人们👩‍❤️‍👨的幸福感弥漫在东山口的空气里～\n\n❣️如果你是一个喜欢摄影拍照的人，那么这里不要错过它！在这里，你可以尽情地发挥想象力，留下属于自己的独特视角和创意☺️\n\n📸不要错过每一个细节，...",
                  "favorites": 420,
                  "comments": 319,
                  "rewardable": true,
                  "parent_comments": "318",
                  "rewards": "2",
                  "views": 11500,
                  "collected": false,
                  "shares": 310,
                  "recommend": true,
                  "delete": false,
                  "update": false,
                  "content":
                      "📸「广州东山口拍照打卡」文艺范的东山口，在这里🏛️西式风格建筑与广式烟火气息并不冲突，反而意外适配，滋生出独特的韵味\n\n🤔里面有充满艺术氛围☕️小咖啡店、买手店、独立工作室、潮牌店等\n🤭里面也是各个街拍网红的打卡地，经常也看到新人们👩‍❤️‍👨的幸福感弥漫在东山口的空气里～\n\n❣️如果你是一个喜欢摄影拍照的人，那么这里不要错过它！在这里，你可以尽情地发挥想象力，留下属于自己的独特视角和创意☺️\n\n📸不要错过每一个细节，在这个充满艺术气息和浪漫情怀的地方，每个角落都值得被记\n录下来。",
                  "title": "温暖治愈的东山口",
                  "image_count": 10,
                  "images": [
                    {
                      "img_id": 770324761,
                      "img_id_str": "770324761",
                      "user_id": 12772247,
                      "title": "260AF02E-480B-4294-9FB8-C07FF1B3AAD3/L0/001",
                      "excerpt": "",
                      "width": 2704,
                      "height": 3605,
                      "description": ""
                    },
                    {
                      "img_id": 1233467470,
                      "img_id_str": "1233467470",
                      "user_id": 12772247,
                      "title": "C7501BF4-AD63-48A6-8422-B554754957B5/L0/001",
                      "excerpt": "",
                      "width": 4224,
                      "height": 7509,
                      "description": ""
                    },
                    {
                      "img_id": 1097546025,
                      "img_id_str": "1097546025",
                      "user_id": 12772247,
                      "title": "3B41CE60-A8A0-4C7E-AB40-3BC5E699D772/L0/001",
                      "excerpt": "",
                      "width": 4218,
                      "height": 7498,
                      "description": ""
                    },
                    {
                      "img_id": 809580849,
                      "img_id_str": "809580849",
                      "user_id": 12772247,
                      "title": "330959ED-88CC-4D2C-975E-40EF8C3C75AC/L0/001",
                      "excerpt": "",
                      "width": 4445,
                      "height": 7902,
                      "description": ""
                    },
                    {
                      "img_id": 982792479,
                      "img_id_str": "982792479",
                      "user_id": 12772247,
                      "title": "4887C8C7-144B-401B-942F-9C7DE3DE07D6/L0/001",
                      "excerpt": "",
                      "width": 4329,
                      "height": 7696,
                      "description": ""
                    },
                    {
                      "img_id": 996489511,
                      "img_id_str": "996489511",
                      "user_id": 12772247,
                      "title": "98E940F0-938A-4F1C-BEDD-876170533A7F/L0/001",
                      "excerpt": "",
                      "width": 4473,
                      "height": 7952,
                      "description": ""
                    },
                    {
                      "img_id": 759118410,
                      "img_id_str": "759118410",
                      "user_id": 12772247,
                      "title": "1B9E0CD5-F766-45F9-973A-4847BAC683AA/L0/001",
                      "excerpt": "",
                      "width": 4473,
                      "height": 7952,
                      "description": ""
                    },
                    {
                      "img_id": 1170880958,
                      "img_id_str": "1170880958",
                      "user_id": 12772247,
                      "title": "074D628F-E704-4B9E-BEBA-2069FFF03F35/L0/001",
                      "excerpt": "",
                      "width": 4347,
                      "height": 7728,
                      "description": ""
                    },
                    {
                      "img_id": 969619879,
                      "img_id_str": "969619879",
                      "user_id": 12772247,
                      "title": "B80E4C74-73D4-4115-A12F-4AB2C252CB7F/L0/001",
                      "excerpt": "",
                      "width": 3663,
                      "height": 6512,
                      "description": ""
                    },
                    {
                      "img_id": 879245647,
                      "img_id_str": "879245647",
                      "user_id": 12772247,
                      "title": "CF8276E7-41A4-4798-87EC-7A36A4D9C51D/L0/001",
                      "excerpt": "",
                      "width": 4473,
                      "height": 7952,
                      "description": ""
                    }
                  ],
                  "title_image": null,
                  "tags": [
                    "发现世界的美",
                    "静物美学",
                    "2023春天摄影大赛",
                    "瓜分奖金·四月摄影挑战赛",
                    "仲量联行-向光而为-创意摄影大赛",
                    "“五一假日出游”摄影小赛",
                    "OPPO超影像大赛",
                    "荣耀手机影像计划",
                    "2023小米徕卡影像大赛",
                    "沐光之城",
                    "赛道5-驭光",
                    "5-组照",
                    "辞条2：瞬间"
                  ],
                  "event_tags": [
                    "发现世界的美",
                    "静物美学",
                    "2023春天摄影大赛",
                    "瓜分奖金·四月摄影挑战赛",
                    "仲量联行-向光而为-创意摄影大赛",
                    "“五一假日出游”摄影小赛",
                    "OPPO超影像大赛",
                    "荣耀手机影像计划",
                    "2023小米徕卡影像大赛"
                  ],
                  "favorite_list_prefix": [],
                  "reward_list_prefix": [],
                  "comment_list_prefix": [],
                  "data_type": "post",
                  "created_at": "",
                  "sites": [],
                  "site": {
                    "site_id": "12772247",
                    "type": "user",
                    "name": "HQ汤圆",
                    "domain": "",
                    "description": "资深旅行摄影师",
                    "followers": 216023,
                    "url": "https://tuchong.com/12772247/",
                    "icon":
                        "http://p9-tc-sign.byteimg.com/tuchong-avatar/ll_12772247_8~tplv-5iz1hipi7z-image.jpeg?x-expires=1684224547&x-signature=bCS7fqCBNX4woTgZ2NnnX%2B8jtzQ%3D",
                    "is_bind_everphoto": true,
                    "has_everphoto_note": true,
                    "videos": 10,
                    "verified": true,
                    "verifications": 1,
                    "verification_list": [
                      {
                        "verification_type": 13,
                        "verification_reason": "资深旅行摄影师"
                      }
                    ],
                    "is_following": false
                  },
                  "recom_type": "热门",
                  "rqt_id": "4e9922ff58f827aa013fcc02fc6de5c2",
                  "is_favorite": false,
                  "last_read": true
                },
              ),
              TuChongItem.fromJson({
                "post_id": 119046540,
                "type": "multi-photo",
                "url": "https://tuchong.com/11072157/119046540/",
                "site_id": "11072157",
                "author_id": "11072157",
                "published_at": "2022-11-29 14:51:26",
                "passed_time": "2022年11月29日",
                "excerpt":
                    "我托夕阳寄讯，为你捎来清佳冬景「#秋天色彩大赏」 「#我的年度摄影作品」 「#冬天生活碎片」 「#一张照片形容我的今天」",
                "favorites": 2214,
                "comments": 492,
                "rewardable": true,
                "parent_comments": "466",
                "rewards": "14",
                "views": 126230,
                "collected": false,
                "shares": 252,
                "recommend": true,
                "delete": false,
                "update": false,
                "content":
                    "我托夕阳寄讯，为你捎来清佳冬景#秋天色彩大赏 #我的年度摄影作品 #冬天生活碎片 #一张照片形容我的今天",
                "title": "清雅之冬",
                "image_count": 12,
                "images": [
                  {
                    "img_id": 989213791,
                    "img_id_str": "989213791",
                    "user_id": 11072157,
                    "title": "2404723",
                    "excerpt": "",
                    "width": 4096,
                    "height": 4096,
                    "description": ""
                  },
                  {
                    "img_id": 1219572675,
                    "img_id_str": "1219572675",
                    "user_id": 11072157,
                    "title": "2404731",
                    "excerpt": "",
                    "width": 6123,
                    "height": 4082,
                    "description": ""
                  },
                  {
                    "img_id": 868037704,
                    "img_id_str": "868037704",
                    "user_id": 11072157,
                    "title": "2404729",
                    "excerpt": "",
                    "width": 5477,
                    "height": 3651,
                    "description": ""
                  },
                  {
                    "img_id": 781530068,
                    "img_id_str": "781530068",
                    "user_id": 11072157,
                    "title": "2404727",
                    "excerpt": "",
                    "width": 6123,
                    "height": 4082,
                    "description": ""
                  },
                  {
                    "img_id": 1307456803,
                    "img_id_str": "1307456803",
                    "user_id": 11072157,
                    "title": "2404699",
                    "excerpt": "",
                    "width": 6123,
                    "height": 3448,
                    "description": ""
                  },
                  {
                    "img_id": 908670095,
                    "img_id_str": "908670095",
                    "user_id": 11072157,
                    "title": "2404728",
                    "excerpt": "",
                    "width": 6123,
                    "height": 3441,
                    "description": ""
                  },
                  {
                    "img_id": 911160354,
                    "img_id_str": "911160354",
                    "user_id": 11072157,
                    "title": "2404730",
                    "excerpt": "",
                    "width": 6123,
                    "height": 3441,
                    "description": ""
                  },
                  {
                    "img_id": 950744180,
                    "img_id_str": "950744180",
                    "user_id": 11072157,
                    "title": "2404732",
                    "excerpt": "",
                    "width": 6123,
                    "height": 4082,
                    "description": ""
                  },
                  {
                    "img_id": 939537630,
                    "img_id_str": "939537630",
                    "user_id": 11072157,
                    "title": "2404725",
                    "excerpt": "",
                    "width": 6123,
                    "height": 4082,
                    "description": ""
                  },
                  {
                    "img_id": 961164395,
                    "img_id_str": "961164395",
                    "user_id": 11072157,
                    "title": "2404697",
                    "excerpt": "",
                    "width": 6123,
                    "height": 4082,
                    "description": ""
                  },
                  {
                    "img_id": 1069429810,
                    "img_id_str": "1069429810",
                    "user_id": 11072157,
                    "title": "2404724",
                    "excerpt": "",
                    "width": 6123,
                    "height": 4082,
                    "description": ""
                  },
                  {
                    "img_id": 686633840,
                    "img_id_str": "686633840",
                    "user_id": 11072157,
                    "title": "2404736",
                    "excerpt": "",
                    "width": 6123,
                    "height": 3843,
                    "description": ""
                  }
                ],
                "title_image": null,
                "tags": [
                  "壮游山海·自然风光摄影赛",
                  "平凡的诗意·小镇生活影像日记",
                  "我镜头下的家乡",
                  "2022秋天摄影大赛",
                  "银盐之魅·胶片摄影赛",
                  "故宫以东·寻迹东城之美",
                  "第五届进博会影像征集",
                  "图虫2022摄影大赏·年度作者与作品评选",
                  "十分秋色不止于湖",
                  "当下好时节-冬日篇",
                  "“屏选美人”人像摄影大赛",
                  "“摄影之诗·我要上图虫精选”征集",
                  "摄影项目作品征集｜图虫青年摄影师扶持计划",
                  "2022第六届神牛闪光灯摄影大赛",
                  "大美房山，花式畅游",
                  "瓜分奖金·四月摄影挑战赛",
                  "大众影像组",
                  "房山四季风光",
                  "2022Godox-静物摄影",
                  "冬日篇-节气限定组",
                  "大众图片专区",
                  "火烛一花精品摄影",
                  "山东摄影家俱乐部",
                  "富士Fujifilm圈子"
                ],
                "event_tags": [
                  "壮游山海·自然风光摄影赛",
                  "平凡的诗意·小镇生活影像日记",
                  "我镜头下的家乡",
                  "2022秋天摄影大赛",
                  "银盐之魅·胶片摄影赛",
                  "故宫以东·寻迹东城之美",
                  "第五届进博会影像征集",
                  "图虫2022摄影大赏·年度作者与作品评选",
                  "十分秋色不止于湖",
                  "当下好时节-冬日篇",
                  "“屏选美人”人像摄影大赛",
                  "“摄影之诗·我要上图虫精选”征集",
                  "摄影项目作品征集｜图虫青年摄影师扶持计划",
                  "2022第六届神牛闪光灯摄影大赛",
                  "大美房山，花式畅游",
                  "瓜分奖金·四月摄影挑战赛",
                  "火烛一花精品摄影",
                  "山东摄影家俱乐部",
                  "富士Fujifilm圈子"
                ],
                "favorite_list_prefix": [],
                "reward_list_prefix": [],
                "comment_list_prefix": [],
                "data_type": "post",
                "created_at": "",
                "sites": [],
                "site": {
                  "site_id": "11072157",
                  "type": "user",
                  "name": "瑞涵0219",
                  "domain": "",
                  "description": "心美一切皆美  情深万象皆深",
                  "followers": 23956,
                  "url": "https://tuchong.com/11072157/",
                  "icon":
                      "http://p9-tc-sign.byteimg.com/tuchong-avatar/ll_11072157_36~tplv-5iz1hipi7z-image.jpeg?x-expires=1684224547&x-signature=kXaE%2BV72Ou7DOXslin%2BcyoWDyTw%3D",
                  "is_bind_everphoto": false,
                  "has_everphoto_note": true,
                  "videos": 1,
                  "verified": false,
                  "verifications": 0,
                  "verification_list": [],
                  "is_following": false
                },
                "recom_type": "热门",
                "rqt_id": "4e9922ff58f827aa013fcc02fc6de5c2",
                "is_favorite": false
              }),
              TuChongItem.fromJson(
                {
                  "post_id": 122826462,
                  "type": "multi-photo",
                  "url": "https://tuchong.com/4344430/122826462/",
                  "site_id": "4344430",
                  "author_id": "4344430",
                  "published_at": "2023-04-19 21:15:02",
                  "passed_time": "04月19日",
                  "excerpt":
                      "每一条路延伸的方向大抵均是春的彼岸，每一个走在这些路上的人估摸着心里都住着个野人，与春争盎然，与风比自在。不似孤独患者，确是人间真我。「#春日赏花图鉴」 「#拍一组春日氛围感写真」 「#2023拍照不要停」 「#一起拍春天」 「#我的旅行影像日记」 「#感知春天来临的瞬间」 「#一张照片形容我的今天」 「#壁纸」 \n拍摄地点：福建武夷山九曲溪漫游道",
                  "favorites": 791,
                  "comments": 525,
                  "rewardable": true,
                  "parent_comments": "267",
                  "rewards": "0",
                  "views": 37436,
                  "collected": false,
                  "shares": 232,
                  "recommend": true,
                  "delete": false,
                  "update": false,
                  "content":
                      "每一条路延伸的方向大抵均是春的彼岸，每一个走在这些路上的人估摸着心里都住着个野人，与春争盎然，与风比自在。不似孤独患者，确是人间真我。#春日赏花图鉴 #拍一组春日氛围感写真 #2023拍照不要停 #一起拍春天 #我的旅行影像日记 #感知春天来临的瞬间 #一张照片形容我的今天 #壁纸 \n拍摄地点：福建武夷山九曲溪漫游道",
                  "title": "春绿（一）",
                  "image_count": 12,
                  "images": [
                    {
                      "img_id": 926758898,
                      "img_id_str": "926758898",
                      "user_id": 4344430,
                      "title": "749DA468-A915-42A9-8715-3E14C559009F/L0/001",
                      "excerpt": "",
                      "width": 2250,
                      "height": 3000,
                      "description": ""
                    },
                    {
                      "img_id": 686307497,
                      "img_id_str": "686307497",
                      "user_id": 4344430,
                      "title": "44095849-2ABA-4FC0-84FA-179C4EE903A3/L0/001",
                      "excerpt": "",
                      "width": 3024,
                      "height": 4032,
                      "description": ""
                    },
                    {
                      "img_id": 1139685553,
                      "img_id_str": "1139685553",
                      "user_id": 4344430,
                      "title": "A492DD30-6A19-4D23-8BB9-7EFD62DC9B10/L0/001",
                      "excerpt": "",
                      "width": 3024,
                      "height": 4032,
                      "description": ""
                    },
                    {
                      "img_id": 994719998,
                      "img_id_str": "994719998",
                      "user_id": 4344430,
                      "title": "D5187C92-B138-4EFA-AD04-D385C12BA86A/L0/001",
                      "excerpt": "",
                      "width": 3024,
                      "height": 4032,
                      "description": ""
                    },
                    {
                      "img_id": 891959658,
                      "img_id_str": "891959658",
                      "user_id": 4344430,
                      "title": "31422BEC-006E-4C0B-9093-84482AEA7508/L0/001",
                      "excerpt": "",
                      "width": 3024,
                      "height": 4032,
                      "description": ""
                    },
                    {
                      "img_id": 1116027120,
                      "img_id_str": "1116027120",
                      "user_id": 4344430,
                      "title": "52310911-60D6-48D6-AEF4-505756C35D9F/L0/001",
                      "excerpt": "",
                      "width": 3024,
                      "height": 4032,
                      "description": ""
                    },
                    {
                      "img_id": 968243598,
                      "img_id_str": "968243598",
                      "user_id": 4344430,
                      "title": "114AC7A4-4641-46A5-AC19-FE8A9A249B52/L0/001",
                      "excerpt": "",
                      "width": 2712,
                      "height": 3616,
                      "description": ""
                    },
                    {
                      "img_id": 775895223,
                      "img_id_str": "775895223",
                      "user_id": 4344430,
                      "title": "A4B853F8-6C03-4E25-96E2-65E3979CDDEB/L0/001",
                      "excerpt": "",
                      "width": 3024,
                      "height": 4032,
                      "description": ""
                    },
                    {
                      "img_id": 1162361294,
                      "img_id_str": "1162361294",
                      "user_id": 4344430,
                      "title": "AE773E3D-F676-4910-A471-0C9AF9B4E388/L0/001",
                      "excerpt": "",
                      "width": 3024,
                      "height": 4032,
                      "description": ""
                    },
                    {
                      "img_id": 717502764,
                      "img_id_str": "717502764",
                      "user_id": 4344430,
                      "title": "63FD68C2-92B6-479D-87AA-11D797A3BE65/L0/001",
                      "excerpt": "",
                      "width": 3024,
                      "height": 4032,
                      "description": ""
                    },
                    {
                      "img_id": 1018444095,
                      "img_id_str": "1018444095",
                      "user_id": 4344430,
                      "title": "D1B9229B-B807-4FBE-9826-BB8D3A786E9C/L0/001",
                      "excerpt": "",
                      "width": 3024,
                      "height": 4032,
                      "description": ""
                    },
                    {
                      "img_id": 945109174,
                      "img_id_str": "945109174",
                      "user_id": 4344430,
                      "title": "BCE7F62B-AFA5-4145-920B-C1FFFA1A2A35/L0/001",
                      "excerpt": "",
                      "width": 3024,
                      "height": 4032,
                      "description": ""
                    }
                  ],
                  "title_image": null,
                  "tags": [
                    "一拍就出彩-春日漫游记",
                    "2023小米徕卡影像大赛",
                    "“摄影之诗·我要上图虫精选”征集",
                    "摄影项目作品征集｜图虫青年摄影师扶持计划",
                    "2023春天摄影大赛",
                    "春日捕捉行动｜图虫X抖音",
                    "瓜分奖金·四月摄影挑战赛",
                    "仲量联行-向光而为-创意摄影大赛",
                    "动静皆风尚",
                    "OPPO超影像大赛",
                    "荣耀手机影像计划",
                    "热带雨林",
                    "武夷山国家公园",
                    "世界自然遗产",
                    "绿水青山",
                    "天然氧吧",
                    "户外运动",
                    "绿野仙踪",
                    "春天",
                    "绿意盎然",
                    "生机勃勃",
                    "图虫厦门摄影联盟",
                    "图虫旅行摄影圈子",
                    "晒晒旅行打卡照"
                  ],
                  "event_tags": [
                    "一拍就出彩-春日漫游记",
                    "2023小米徕卡影像大赛",
                    "“摄影之诗·我要上图虫精选”征集",
                    "摄影项目作品征集｜图虫青年摄影师扶持计划",
                    "2023春天摄影大赛",
                    "春日捕捉行动｜图虫X抖音",
                    "瓜分奖金·四月摄影挑战赛",
                    "仲量联行-向光而为-创意摄影大赛",
                    "动静皆风尚",
                    "OPPO超影像大赛",
                    "荣耀手机影像计划",
                    "图虫厦门摄影联盟",
                    "图虫旅行摄影圈子",
                    "晒晒旅行打卡照"
                  ],
                  "favorite_list_prefix": [],
                  "reward_list_prefix": [],
                  "comment_list_prefix": [],
                  "data_type": "post",
                  "created_at": "",
                  "sites": [],
                  "site": {
                    "site_id": "4344430",
                    "type": "user",
                    "name": "茶小二plus",
                    "domain": "",
                    "description": "资深旅行摄影师",
                    "followers": 72524,
                    "url": "https://tuchong.com/4344430/",
                    "icon":
                        "http://p3-tc-sign.byteimg.com/tuchong-avatar/ll_4344430_5~tplv-5iz1hipi7z-image.jpeg?x-expires=1684224547&x-signature=7YvT8J3iXeAyV37I955H3FJhl%2Bc%3D",
                    "is_bind_everphoto": true,
                    "has_everphoto_note": true,
                    "videos": 41,
                    "verified": true,
                    "verifications": 1,
                    "verification_list": [
                      {
                        "verification_type": 13,
                        "verification_reason": "资深旅行摄影师"
                      }
                    ],
                    "is_following": false
                  },
                  "recom_type": "热门",
                  "rqt_id": "4e9922ff58f827aa013fcc02fc6de5c2",
                  "is_favorite": false
                },
              ),
            ]
          : [
              ImageModel(
                id: 51,
                title: "赛博朋克风格奇幻少女 集",
                url:
                    "https://pic.netbian.com/uploads/allimg/210423/224716-1619189236e4d9.jpg",
              ),
              ImageModel(
                id: 51,
                title: "3D女孩 辫子 绿色 荧光4",
                url:
                    "https://pic.netbian.com/uploads/allimg/220107/233004-1641569404ec45.jpg",
              ),
              ImageModel(
                id: 51,
                title: "江南烧酒4k动漫壁纸",
                url:
                    "https://pic.netbian.com/uploads/allimg/180803/084010-15332568107994.jpg",
              ),
            ],
    );
    return body;
  }
}
