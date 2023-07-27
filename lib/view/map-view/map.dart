import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Maplocation extends StatefulWidget {
  const Maplocation({super.key});

  @override
  State<Maplocation> createState() => _MaplocationState();
}

class _MaplocationState extends State<Maplocation> {
  var _isGettingLocation = false;
  double? lat = 0;
  double? lng = 0;
  

  void _getcurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _isGettingLocation = true;
    });
    locationData = await location.getLocation();

    setState(() {
      _isGettingLocation = false;
    lat = locationData.latitude;
    lng = locationData.longitude;
    });
  }

  @override
  void initState() {
    _getcurrentLocation();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                ),
              ),
              child:  FlutterMap(
                options: MapOptions(
                 
                  center: LatLng(32.4279,  53.6880),
                  zoom: 10,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                          width: 100.0,
                          height: 100.0,
                          point: LatLng(lat as double, lng as double),
                          builder: (ctx) => const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.back();
            },
            label:  Text('back to main page'.tr)),
      ),
    );
  }
}
