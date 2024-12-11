import 'package:intl/intl.dart';
class MyDateUtils{
  static String ?formateTaskDate(DateTime date){
    var formatter= DateFormat('yyyy MMM dd' );
    return formatter.format(date);
  }

  static DateTime dateOnly (DateTime input){

    return DateTime(
      input.year,
      input.month,
      input.day,
    );
  }

}