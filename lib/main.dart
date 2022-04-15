import 'package:flutter/material.dart';
import 'package:geolocator_location/views/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Geolocation ile Konum Elde Etme'),
        ),
        body: const HomePage(),
      ),
    );
  }
}
