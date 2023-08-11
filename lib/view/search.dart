import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:the_internet_folks/constants.dart';
import 'package:the_internet_folks/view/event.dart';
import 'package:the_internet_folks/widgets/event_card.dart';

import '../view_model/response_view_model.dart';

class Search extends StatefulWidget {
  final String viewName;

  const Search({
    Key? key,
    required this.viewName,
  }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            "Search",
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: titleColor,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search,
                      color: themeColor,
                    ),
                    const VerticalDivider(
                      thickness: 1.2,
                      color: themeColor,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                          border: InputBorder.none,
                          hintText: "Type Event Name",
                          hintStyle: const TextStyle(
                              fontFamily: fontFamily,
                              color: Color.fromARGB(203, 158, 158, 158)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Consumer<ResponseViewModel>(
                builder: (context, value, child) {
                  return ListView.builder(itemBuilder: (context, index) {
                    return EventCard(
                      callback: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Event(viewName: 'Event', id: index)));
                      },
                      date_time: value
                          .response.content!.dataList![index].date_time
                          .toString(),
                      venue:
                          "${value.response.content!.dataList![index].venue_city} $dot ${value.response.content!.dataList![index].venue_country}",
                      eventName: value
                          .response.content!.dataList![index].venue_name
                          .toString(),
                      imageUrl: value
                          .response.content!.dataList![index].banner_image
                          .toString(),
                    );
                  });
                },
              ),
            ),
          ],
        ));
  }
}
