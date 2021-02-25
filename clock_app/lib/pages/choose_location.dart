import 'package:clock_app/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instannce = locations[index];
    await instannce.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location' : instannce.location,
      'flag' : instannce.flag,
      'time' : instannce.time,
      'isDaytime' : instannce.isDaytime
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    onTap: () {
                        updateTime(index);
                    },
                    title: Text(locations[index].location),
                  ),
                );
              }
            ),
      ),
    );
  }
}
