import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
  }) : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String restultText = '';
    if (result >= 30) {
      restultText = 'Obese';
    } else if (result >= 25 && result < 30) {
      restultText = 'Overweight';
    } else if (result >= 18.5 && result < 25) {
      restultText = 'Normal';
    } else {
      restultText = 'Thin';
    }

    return restultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votre resultat'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'Gender: ${isMale ? 'Homme' : 'Femme'}',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(
                'Result: ${result.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(
                'Healthness: $resultPhrase',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(
                'Age: $age',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ]),
      )),
    );
  }
}
