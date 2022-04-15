import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_location/controller/geolocator_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final geolocatorController = Get.put(
      GeolocatorController()); // Get paketi ile geolocatorController nesnesi oluşturduk.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                getLocation();
                print(
                    'x: ${geolocatorController.currentLocation!.latitude} , y: ${geolocatorController.currentLocation!.longitude}');
              },
              child: Text('Konumu Al'),
            ),
            ElevatedButton(
              onPressed: () {
                getLocation();
                print(
                    'x: ${geolocatorController.currentLocation!.latitude} , y: ${geolocatorController.currentLocation!.longitude}');
              },
              child: Text('Konumu Göster'),
            ),
          ],
        ),
      ),
    );
  }

  getLocation() {
    // butonda çağrılacak fonksiyonu oluşturduk.
    Geolocator.requestPermission().then((value) {
      if (Platform.isIOS) {
        // eğer ios ise  bu işlemleri yapıyoruz.
        if (value != LocationPermission.whileInUse) {
          return;
        } else {
          geolocatorController.permissionOK();
        }
      } else {
        // eğer android ise bu işlemleri yapıyoruz.
        if (value != LocationPermission.always) {
          return;
        } else {
          geolocatorController.permissionOK();
        }
      }
    });
  }
}
