import 'package:flutter/material.dart';
import 'package:the_internet_folks/constants.dart';
import 'package:the_internet_folks/widgets/event_card.dart';

class Search extends StatefulWidget {
  const Search({super.key});

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
            onPressed: () {},
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
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type Event Name",
                          hintStyle: TextStyle(
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
              child: ListView(
                children: [
                  EventCard(
                    callback: () {},
                    date: "",
                    time: "",
                    venue: "",
                    eventName: "",
                    imageUrl: '',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
