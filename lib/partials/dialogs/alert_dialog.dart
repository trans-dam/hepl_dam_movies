import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String description;

  const MyAlertDialog(this.title, this.description, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
