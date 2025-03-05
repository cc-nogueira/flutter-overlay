import 'package:flutter/material.dart';

import 'page_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 80.0),
        child: SizedBox(
          width: 250,
          child: ListView(
            children: [
              for (final (idx, text) in items.indexed)
                PageItem(
                  bgColor: colors[idx % colors.length],
                  index: idx + 1,
                  text: text,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

const List<Color> colors = <Color>[
  Colors.lightBlue,
  Colors.yellow,
  Colors.lightGreen,
  Colors.orange,
  Colors.lightBlueAccent,
  Colors.yellowAccent,
  Colors.lightGreenAccent,
  Colors.orangeAccent,
];

const List<String> items = <String>[
  'First child',
  'Second child',
  'Third child',
  'Fourth child',
  'Fifth child',
  'Sixth child',
  'Seventh child',
  'Eighth child',
  'Ninth child',
];
