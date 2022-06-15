import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 180;
  int weight = 55;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    genderBox(context, 'male'),
                    const SizedBox(
                      width: 15,
                    ),
                    genderBox(context, 'female'),
                  ],
                )),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            heightVal.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            "CM",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Slider(
                        min: 50,
                        max: 220,
                        value: heightVal,
                        onChanged: (newValue) =>
                            setState(() => heightVal = newValue),
                      )
                    ],
                  ),
                )),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    ageWeidhtBox(context, 'weight'),
                    const SizedBox(
                      width: 15,
                    ),
                    ageWeidhtBox(context, 'age'),
                  ],
                )),
          ),
          Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                onPressed: () {
                  var result = weight / pow(heightVal / 100, 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                              result: result, isMale: isMale, age: age)));
                },
                child: const Text(
                  "Calculer",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ))
        ]),
      ),
    );
  }

  Expanded genderBox(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isMale = type == 'male' ? true : false),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(height: 15),
              Text(
                type == 'male' ? 'Homme' : 'Femme',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded ageWeidhtBox(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'Age --' : 'Weight --',
                  onPressed: () =>
                      setState(() => type == 'age' ? age-- : weight--),
                  // ignore: sort_child_properties_last
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'Age ++' : 'Weight ++',
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  // ignore: sort_child_properties_last
                  child: const Icon(Icons.add),
                  mini: true,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
