
import 'package:fk_toggle/fk_toggle.dart';
import 'package:flutter/material.dart';

class FkToggleSample extends StatelessWidget {
  const FkToggleSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final OnSelected selected = ((index, instance) =>
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Select $index, toggle ${instance.labels?[index]}'))));

    final toggles = [
      FkToggle(width: 80, height: 80, size: 2, labels: const ['1', '2'], onSelected: selected),
      FkToggle(width: 120, height: 80, size: 2, labels: const ['one', 'two'], onSelected: selected),
      FkToggle(width: 240, height: 80, size: 5, labels: const ['1', '2', '3', '4', '5'], onSelected: selected),
      FkToggle(width: 160, height: 120, size: 2, labels: const ['ON', 'OFF'], onSelected: selected),
      FkToggle(width: 120, height: 80, size: 2,
          icons: const [Icon(Icons.add_reaction), Icon(Icons.add_reaction_outlined)], onSelected: selected),
      FkToggle(width: 150, height: 80, size: 2, labels: const ['Orange', 'White'],
          selectedColor: Colors.orange, backgroundColor: Colors.white, onSelected: selected),
      FkToggle(width: 100, height: 80, size: 2, labels: const ['', '2'], onSelected: selected),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Sample Toggle Switches')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: toggles.map((e) =>
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [e],
              )
          ).toList(),
        ),
      ),
    );
  }
}
