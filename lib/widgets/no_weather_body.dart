import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 16, top: 16)),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
