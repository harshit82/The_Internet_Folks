import 'package:flutter/material.dart';
import 'package:the_internet_folks/constants.dart';

class BookButton extends StatelessWidget {
  final VoidCallback callback;
  const BookButton({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        height: 60,
        decoration: const BoxDecoration(
          color: themeColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "BOOK NOW",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontFamily,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 5),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
