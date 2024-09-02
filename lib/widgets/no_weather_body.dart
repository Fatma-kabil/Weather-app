import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/weather-unknown-1 (1).png',
            height: 80,
            width: 80,
          ),
          const Text(
            'There is no weather 😔 start',
            style: TextStyle(fontSize: 28),
          ),
          const Text('searching now 🔎 ', style: TextStyle(fontSize: 28))
        ],
      ),
    );
  }
}
