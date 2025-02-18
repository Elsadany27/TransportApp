import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class CustomeMap extends StatelessWidget {
  const CustomeMap({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: screenSize.height * 0.03), // Responsive margin
      height: screenSize.height * 0.4, // Responsive height
      child: FlutterLocationPicker(
        selectLocationButtonStyle: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white), // Corrected here
        ),
        selectLocationButtonText: 'حدد موقعك الان',
        initPosition: LatLong(30.4625, 31.183899), // Initial position on map
        selectLocationButtonLeadingIcon: const Icon(Icons.check),
        initZoom: 11,
        minZoomLevel: 5,
        maxZoomLevel: 16,
        trackMyPosition: true,
        onError: (e) => print(e), // Error handling
        onPicked: (pickedData) {
          // Print picked data to console
          print('Address: ${pickedData.address}');
          print('Country: ${pickedData.addressData['country']}');
        },
      ),
    );
  }
}
