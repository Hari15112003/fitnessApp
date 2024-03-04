import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';

class LatestActivityRow extends StatelessWidget {
  final String image;
  final String name;
  final int calories;
  const LatestActivityRow(
      {super.key,
      required this.image,
      required this.name,
      required this.calories});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                image.toString(),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toString(),
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Calories burnt:  $calories",
                  style: TextStyle(
                    color: TColor.gray,
                    fontSize: 13,
                  ),
                ),
              ],
            )),
            // IconButton(
            //     onPressed: () {},
            //     icon: Image.asset(
            //       "assets/img/sub_menu.png",
            //       width: 12,
            //       height: 12,
            //       fit: BoxFit.contain,
            //     ))
          ],
        ));
  }
}
