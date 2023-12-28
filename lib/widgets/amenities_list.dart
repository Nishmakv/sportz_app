import 'package:flutter/material.dart';
import 'package:sportz_app/widgets/amenities_widget.dart';

// ignore: must_be_immutable
class AmenitiesListCard extends StatefulWidget {
  List amenities;
   AmenitiesListCard({super.key,required this.amenities});

  @override
  State<AmenitiesListCard> createState() => _AmenitiesListCardState();
}

class _AmenitiesListCardState extends State<AmenitiesListCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return AmenitiesWidget(
                       name: widget.amenities[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 15,
                  );
                },
                itemCount: widget.amenities.length),
          ),
        ],
      ),
    );
  }
}
