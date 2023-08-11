import 'package:flutter/material.dart';

import 'package:the_internet_folks/constants.dart';

class EventCard extends StatelessWidget {
  final VoidCallback callback;
  final String date_time;
  final String venue;
  final String eventName;
  final String imageUrl;

  const EventCard({
    Key? key,
    required this.callback,
    required this.date_time,
    required this.venue,
    required this.eventName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: callback,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.10),
                blurRadius: 8.0,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: imageUrl == ""
                          ? Image.asset(
                              sampleImage,
                              fit: BoxFit.fill,
                            )
                          : Image.network(imageUrl),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date_time,
                        style: const TextStyle(
                          color: themeColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        eventName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.black87,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: Color.fromRGBO(116, 118, 136, 100),
                          ),
                          Text(
                            venue,
                            style: const TextStyle(
                                color: Color.fromRGBO(116, 118, 136, 100)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
