import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_internet_folks/constants.dart';
import 'package:the_internet_folks/view_model/response_view_model.dart';
import 'package:the_internet_folks/widgets/book_now_button.dart';
import 'package:the_internet_folks/widgets/event_details.dart';

class Event extends StatefulWidget {
  final String viewName;
  final int id;

  const Event({Key? key, required this.viewName, required this.id})
      : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    final responseViewModel = context
        .watch<ResponseViewModel>()
        .response
        .content!
        .dataList?[widget.id];

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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      NetworkImage(responseViewModel!.banner_image.toString()),
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
                  responseViewModel.title!,
                  maxLines: 2,
                  style: const TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 30,
                    fontWeight: fontWeight,
                  ),
                ),
                const SizedBox(height: 10),
                EventDetails(
                    imageUrl: responseViewModel.organizer_icon.toString(),
                    name: responseViewModel.organizer_name.toString(),
                    designation: "Organizer"),
                const SizedBox(height: 10),
                EventDetails(
                  imageUrl: calendarIcon,
                  name: responseViewModel.date_time!,
                  designation: "dt",
                ),
                const SizedBox(height: 10),
                EventDetails(
                  imageUrl: locationIcon,
                  name: responseViewModel.venue_name.toString(),
                  designation:
                      "${responseViewModel.venue_city} ${responseViewModel.venue_country}",
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
                Expanded(
                  child: Text(responseViewModel.description.toString()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
