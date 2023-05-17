import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whether_app/models/wheather_model.dart';
import 'package:whether_app/providers/wheather_provider.dart';

class HomePage extends StatelessWidget {
  WheatherModel? wheatherData;
  @override
  Widget build(BuildContext context) {
    wheatherData = Provider.of<WheatherProvider>(context).wheatherData;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'search_page');
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: wheatherData == null
            ? noDataWidget()
            : dataWidget(context, wheatherData!));
  }
}

Widget noDataWidget() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.blue,
          Colors.blue[300]!,
          //Colors.blue[100]!,
          Colors.orange[300]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'There is no Wheather yet 🙁',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            'Start your search Now 🔎',
            style: TextStyle(fontSize: 14, color: Colors.yellow),
          ),
        ],
      ),
    ),
  );
}

Widget dataWidget(BuildContext context, WheatherModel wheatherData) {
  //split string date
  String str = wheatherData.date;
  var arr = str.split(' ');

  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          wheatherData.getThemeColor(),
          wheatherData.getThemeColor()[300]!,
          wheatherData.getThemeColor()[100]!,
          //Colors.blue,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    alignment: Alignment.center,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(flex: 6),
        Text(
          Provider.of<WheatherProvider>(context).cityName ?? 'Null',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text('Updated at : ${arr[1]}',
            style: const TextStyle(fontSize: 16, color: Colors.black54)),
        const Spacer(flex: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(wheatherData.getImage()),
            Text(
              '${wheatherData.temp.toInt()}',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text(
                  'MaxTemp :  ${wheatherData.maxTemp.toInt()}',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(
                  'MinTemp : ${wheatherData.minTemp.toInt()}',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
        const Spacer(flex: 1),
        Text(
          wheatherData.weatherStateName,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const Spacer(flex: 10),
      ],
    ),
  );
}
