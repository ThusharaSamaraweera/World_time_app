import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    // create instance from worldTime
    WorldTime instance = WorldTime(
        location: 'colombo',
        flag: 'Srilanka.png',
        locationEndpoint: 'Asia/Colombo'
    );
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(time),
      ),
    );
  }
}
