import 'package:fk_toggle/fk_toggle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        scaffoldBackgroundColor: const Color(0xfff5f5f5),
        primarySwatch: Colors.blue,
      ),
      home: const FkToggleSample(),
    );
  }
}

class FkToggleSample extends StatelessWidget {
  const FkToggleSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnSelected selected = ((index, instance) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Select $index, toggle ${instance.labels[index]}')));
    });

    final toggles = [
      FkToggle(
          width: 50,
          height: 30,
          labels: const ['1', '2'],
          onSelected: selected
      ),
      FkToggle(
          width: 100,
          height: 50,
          labels: const ['one', 'two'],
          fontSize: 24,
          cornerRadius: 4,
          onSelected: selected),
      FkToggle(
          width: 50,
          height: 30,
          labels: const ['1', '2', '3', '4', '5'],
          onSelected: selected),
      FkToggle(
          width: 60,
          height: 50,
          labels: const ['ON', 'OFF'],
          cornerRadius: 30,
          onSelected: selected),
      FkToggle(
          width: 60,
          height: 40,
          icons: const [
            Icon(Icons.add_reaction),
            Icon(Icons.add_reaction_outlined)
          ],
          labels: const ['', ''],
          onSelected: selected),
      FkToggle(
          width: 120,
          height: 50,
          labels: const ['Orange', 'White'],
          selectedColor: Colors.orange,
          backgroundColor: Colors.white,
          onSelected: selected),
      FkToggle(
          width: 100,
          height: 50,
          icons: const [
            Icon(Icons.add_reaction),
          ],
          labels: const ['', 'smile'],
          onSelected: selected),
      FkToggle(
          width: 120,
          height: 50,
          selectedColor: Colors.red,
          backgroundColor: Colors.white,
          enabledElementColor: Colors.yellow,
          disabledElementColor: Colors.grey,
          icons: const [
            Icon(Icons.sentiment_satisfied_alt),
            Icon(Icons.emoji_emotions),
          ],
          labels: const ['Smile', 'Good'],
          onSelected: selected),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Sample Toggle Switches')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: toggles
              .map((e) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: e,
          ))
              .toList(),
        ),
      ),
    );
  }
}
