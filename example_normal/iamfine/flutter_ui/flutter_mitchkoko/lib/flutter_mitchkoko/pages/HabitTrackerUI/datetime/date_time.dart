// return todays date formatted as yyyymmdd
// ignore_for_file: unused_local_variable

String todaysDateFormatted() {
  // today
  var now = DateTime.now();

  // // 30秒前の時刻
  // final DateTime thirtySecondsAgo = now.add(const Duration(seconds: 30) * -1);
  // // 30分前の時刻
  // final DateTime thirtyMinutesAgo = now.add(const Duration(minutes: 30) * -1);
  // // 5時間前の時刻
  // final DateTime fiveHoursAgo = now.add(const Duration(hours: 30) * -1);
  // // 30日前の時刻
  // final DateTime thirtyDaysAgo = now.add(const Duration(days: 30) * -1);

  var dateTimeObject = now;
  // year in the format yyyy
  String year = dateTimeObject.year.toString();

  // month in the format mm
  String month = dateTimeObject.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  // day in the format dd
  String day = dateTimeObject.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  // final format
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}

// convert string yyyymmdd to DateTime object
DateTime createDateTimeObject(String yyyymmdd) {
  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int mm = int.parse(yyyymmdd.substring(4, 6));
  int dd = int.parse(yyyymmdd.substring(6, 8));

  DateTime dateTimeObject = DateTime(yyyy, mm, dd);
  return dateTimeObject;
}

// convert DateTime object to string yyyymmdd
String convertDateTimeToString(DateTime dateTime) {
  // year in the format yyyy
  String year = dateTime.year.toString();

  // month in the format mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  // day in the format dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  // final format
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
