import 'package:flutter/material.dart';

import '../../../helper/helper_index.dart';
import '../compontents/BottomDrawerDestinations.dart';

const double kFlingVelocity = 2.0;
const kAnimationDuration = Duration(milliseconds: 300);
final mobileMailNavKey = GlobalKey<NavigatorState>();

final navigationDestinations = <Destination>[
  Destination(
    name: 'Inbox',
    icon: Utils.assets('images/10043.png'),
    index: 0,
  ),
  Destination(
    name: 'Starred',
    icon: Utils.assets('images/10043.png'),
    index: 1,
  ),
  Destination(
    name: 'Sent',
    icon: Utils.assets('images/10043.png'),
    index: 2,
  ),
  Destination(
    name: 'Trash',
    icon: Utils.assets('images/10043.png'),
    index: 3,
  ),
  Destination(
    name: 'Spam',
    icon: Utils.assets('images/10043.png'),
    index: 4,
  ),
  Destination(
    name: 'Drafts',
    icon: Utils.assets('images/10043.png'),
    index: 5,
  ),
];

final folders = <String, String>{
  'Receipts': Utils.assets('images/10043.png'),
  'Pine Elementary': Utils.assets('images/10043.png'),
  'Taxes': Utils.assets('images/10043.png'),
  'Vacation': Utils.assets('images/10043.png'),
  'Mortgage': Utils.assets('images/10043.png'),
  'Freelance': Utils.assets('images/10043.png'),
};
