import 'package:flutter/material.dart';
import 'countermodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Opretter en ChangeNotifierProvider, der giver CounterModel til MyApp og dens underordnede widgets.
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Provider Example')),
        body: Center(child: CounterText()),
        floatingActionButton: IncrementButton(),
      ),
    );
  }
}

// CounterText er en StatelessWidget, der viser den aktuelle tællerværdi.
class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Henter CounterModel fra Provider for at få adgang til tællerværdien.
    final counterModel = Provider.of<CounterModel>(context);
    // Viser tællerværdien som en tekst.
    return Text('Counter: ${counterModel.count}');
  }
}

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Når knappen trykkes, kaldes increment-metoden i CounterModel for at øge tælleren.
      onPressed: () {
        Provider.of<CounterModel>(context, listen: false).increment();
      },
      child: Text('Increment'),
    );
  }
}
