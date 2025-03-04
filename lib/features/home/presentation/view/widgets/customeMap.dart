// import 'package:flutter/material.dart';
// import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
//
// class CustomeMap extends StatelessWidget {
//   const CustomeMap({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.only(top: screenSize.height * 0.03), // Responsive margin
//       height: screenSize.height * 0.4, // Responsive height
//       child: FlutterLocationPicker(
//         selectLocationButtonStyle: ButtonStyle(
//           backgroundColor: WidgetStatePropertyAll(Colors.white), // Corrected here
//         ),
//         selectLocationButtonText: 'حدد موقعك الان',
//         initPosition: LatLong(30.4625, 31.183899), // Initial position on map
//         selectLocationButtonLeadingIcon: const Icon(Icons.check),
//         initZoom: 11,
//         minZoomLevel: 5,
//         maxZoomLevel: 16,
//         trackMyPosition: true,
//         onError: (e) => print(e), // Error handling
//         onPicked: (pickedData) {
//           // Print picked data to console
//           print('Address: ${pickedData.address}');
//           print('Country: ${pickedData.addressData['country']}');
//         },
//       ),
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trasportation/features/login/data/datasource.dart';

class CustomeMap extends StatefulWidget {
  const CustomeMap({super.key});

  @override
  State<CustomeMap> createState() => _CustomeMapState();
}

class _CustomeMapState extends State<CustomeMap> {
  LatLong? currentLocation;
  // DataSource dataSource=DataSource();

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  // Function to check and request location permission
  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle permission denied
        return;
      }
    }

    // After permission granted, get the current location
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLocation = LatLong(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: screenSize.height * 0.03), // Responsive margin
      height: screenSize.height * 0.4, // Responsive height
      child: FlutterLocationPicker(
        selectLocationButtonStyle: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        selectLocationButtonText: 'حدد موقعك الان',
        initPosition: currentLocation ?? LatLong(30.4625, 35.189), // Fallback to default position
        selectLocationButtonLeadingIcon: const Icon(Icons.check),
        initZoom: 11,
        minZoomLevel: 5,
        maxZoomLevel: 16,
        trackMyPosition: true, // Track user's position on the map
        onError: (e) => print(e), // Error handling
        onPicked: (pickedData) {
          // Print picked data to console
          print('Address: ${pickedData.address}');
          print('Country: ${pickedData.addressData['country']}');
          print('Country: ${pickedData.latLong.latitude}');
          },
      ),
    );
  }
}
