import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:the_internet_folks/constants.dart';
import 'package:the_internet_folks/widgets/event_card.dart';

import '../view_model/response_view_model.dart';

class Home extends StatefulWidget {
  final String viewName;
  const Home({
    Key? key,
    required this.viewName,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Events",
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: titleColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/search');
                  },
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ResponseViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return ListView.builder(
                itemCount: value.response.content!.dataList!.length,
                itemBuilder: (context, index) {
                  return EventCard(
                    callback: () {
                      // TODO: Send the index of the card to identify in the list

                      Navigator.of(context).pushNamed('/event');
                    },
                    date_time: value
                        .response.content!.dataList![index].date_time
                        .toString(),
                    eventName: value
                        .response.content!.dataList![index].venue_name
                        .toString(),
                    venue:
                        "${value.response.content!.dataList?[index].venue_city} $dot ${value.response.content!.dataList?[index].venue_country}",
                    imageUrl: value
                        .response.content!.dataList![index].banner_image
                        .toString(),
                  );
                });
          },
        ),
      ),
    );
  }
}
