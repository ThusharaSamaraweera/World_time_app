import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag; // url for flag icon
  late String locationEndpoint; // location url for api endpoint

  WorldTime(
      {required this.location,
      required this.flag,
      required this.locationEndpoint});

  Future<void> getTime() async {
    try {
      var url = 'http://worldtimeapi.org/api/timezone/$locationEndpoint';

      // make request
      var response = await http.get(Uri.parse(url));
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String hours = data['utc_offset'].substring(1, 3);
      String min = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(hours), minutes: int.parse(min)));

      time = DateFormat.jm().format(now);
    } catch (error) {
      time = 'Failed getting date and time';
    }
  }
}
