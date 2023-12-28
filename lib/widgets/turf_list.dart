import 'package:flutter/material.dart';

class TurfListCard extends StatelessWidget {
  String asset;
  String name;
  TurfListCard({super.key, required this.asset, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
     width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow:const [BoxShadow(
          color: Colors.black12,
          blurRadius: 10
        )] 
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          children: [
            SizedBox(
              height: 180,
              child: Image.asset(
                asset,
                fit: BoxFit.cover,
              ),
            ),
            const Row(
            
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("data"),
                Text("data")
              ],
            )
          ],
        ),
      ),
    );
  }
}
