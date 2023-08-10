import 'package:flutter/material.dart';
import 'package:the_internet_folks/constants.dart';
import 'package:the_internet_folks/widgets/book_now_button.dart';
import 'package:the_internet_folks/widgets/event_details.dart';

class Event extends StatelessWidget {
  final String eventName;

  const Event({
    Key? key,
    required this.eventName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BookButton(
        callback: () {},
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark),
            ),
          ],
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(sampleImage), // Replace with network image
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          title: const Text(
            "Event Details",
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName == "" ? eventName : "Event Details",
                  maxLines: 2,
                  style: const TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 30,
                    fontWeight: fontWeight,
                  ),
                ),
                const SizedBox(height: 10),
                const EventDetails(
                    imageUrl: "",
                    name: "The Internet Folks",
                    designation: "Organizer"),
                const SizedBox(height: 10),
                const EventDetails(
                  imageUrl: calendarIcon,
                  name: "Date and Time",
                  designation: "dt",
                ),
                const SizedBox(height: 10),
                const EventDetails(
                  imageUrl: locationIcon,
                  name: "Location",
                  designation: "Address",
                ),
                const SizedBox(height: 10),
                const Text(
                  "About Event",
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                const Expanded(
                  child: Text(lorem),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
