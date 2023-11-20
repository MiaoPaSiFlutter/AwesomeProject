import '../colors/colors_helper.dart';
import '../utils.dart';

List<Map> categoryItems = [
  {
    "label": "igtv",
    "title": "igtv".toUpperCase(),
    "svgPath": Utils.assets("icons/igtv.svg"),
    "isIGTV": true,
  },
  {
    "label": "trends",
    "title": "trends".toUpperCase(),
    "svgPath": Utils.assets("icons/trends.svg"),
    "color": ColorHelper.hex("#515BD4"),
  },
  {
    "label": "travel",
    "title": "travel".toUpperCase(),
    "svgPath": Utils.assets("icons/travel.svg"),
    "color": ColorHelper.hex("#8134AF"),
  },
  {
    "label": "fitness",
    "title": "fitness".toUpperCase(),
    "svgPath": Utils.assets("icons/fitness.svg"),
    "color": ColorHelper.hex("#DD2A7B"),
  },
];
