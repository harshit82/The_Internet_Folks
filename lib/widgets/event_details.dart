import 'package:flutter/material.dart';
import '../constants.dart';

class EventDetails extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String designation;

  const EventDetails({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.designation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 9,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: imageUrl == ""
                    ? Image.asset(
                        companyLogo,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(imageUrl),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name == "" ? "Name" : name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: fontFamily,
                  ),
                ),
                Text(
                  designation == "" ? "Designation" : designation,
                  style: TextStyle(
                    fontFamily: fontFamily,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
