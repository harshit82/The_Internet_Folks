import 'package:flutter/material.dart';
import 'package:the_internet_folks/constants.dart';
import 'package:the_internet_folks/widgets/event_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                  onPressed: () {},
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            EventCard(
              callback: () {},
              date: '20',
              eventName: 'party',
              time: '10',
              venue: 'san',
              imageUrl: '',
            ),
          ],
        ),
      ),
    );
  }
}
