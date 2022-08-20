import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(locationEndpoint: 'Asia/Colombo', location: 'Colombo',flag: 'srilanka.jpg'),
    WorldTime(locationEndpoint: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(locationEndpoint: 'Europe/Berlin', location: 'Berlin', flag: 'greece.png'),
    WorldTime(locationEndpoint: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(locationEndpoint: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(locationEndpoint: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(locationEndpoint: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(locationEndpoint: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(locationEndpoint: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();

    // navigate to home
    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/countries/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
