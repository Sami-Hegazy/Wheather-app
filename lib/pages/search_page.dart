import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whether_app/models/wheather_model.dart';
import 'package:whether_app/providers/wheather_provider.dart';
import 'package:whether_app/services/wheather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            onChanged: (data) {
              cityName = data;
            },
            onFieldSubmitted: (data) async {
              cityName = data;
              WheatherService service = WheatherService();
              WheatherModel wheather =
                  await service.getWheather(cityName: cityName!);
              Provider.of<WheatherProvider>(context, listen: false)
                  .wheatherData = wheather;
              Provider.of<WheatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter City Name',
              label: const Text('city search'),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WheatherService service = WheatherService();
                    WheatherModel wheather =
                        await service.getWheather(cityName: cityName!);
                    Provider.of<WheatherProvider>(context, listen: false)
                        .wheatherData = wheather;
                    Provider.of<WheatherProvider>(context, listen: false)
                        .cityName = cityName;

                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
