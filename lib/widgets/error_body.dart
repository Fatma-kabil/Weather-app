import 'package:flutter/material.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes the position of the shadow
            ),
          ],
        ),
        height: 100,
        width: 300,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (Icon(
              Icons.error,
              color: Colors.red,
            )),
            Text(
              'Opps there was an error',
              style: TextStyle(fontSize: 23, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
