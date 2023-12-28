import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

// ignore: must_be_immutable
class AmenitiesWidget extends StatelessWidget {
  String name;
  AmenitiesWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    Icon getAmenityIcon() {
      switch (name) {
        case 'wifi':
          return const Icon(Ionicons.wifi);
        case 'shower':
          return const Icon(Ionicons.color_fill_outline);
        case 'Wi-Fi':
          return const Icon(Ionicons.wifi);
        case 'Parking':
          return const Icon(Ionicons.car_outline);
           case 'wifi':
          return const Icon(Ionicons.wifi);
        default:
          return const Icon(Icons.abc); // or some default icon
      }
    }

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: getAmenityIcon(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            )),
      ],
    );
  }
}
