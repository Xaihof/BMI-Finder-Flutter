import 'dart:math';

import 'package:bmi_finder/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variables.
  var weightTextController = TextEditingController();
  var heightFeetTextController = TextEditingController();
  var heightInchesTextController = TextEditingController();
  var result = "Enter Values to Calculate";
  var message = "Find Your BMI";
  var color = Colors.black;
  var colorTwo = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(message,
                style: TextStyle(
                    color: color, fontSize: 21, fontWeight: FontWeight.bold)),
            Card(
              margin: EdgeInsets.all(7.0),
              child: SizedBox(
                width: 350,
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        result,
                        style: TextStyle(
                            color: color,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: weightTextController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.line_weight),
                            label: Text("Weight"),
                            helperText: "(Kgs)",
                            border: OutlineInputBorder()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 140,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: heightFeetTextController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.height),
                                  label: Text("Height"),
                                  helperText: "(Feet)",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: heightInchesTextController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.height),
                                  label: Text("Height"),
                                  helperText: "(Inches)",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
                          onPressed: () {
                            // Variables
                            var weight = weightTextController.text;
                            var heightFeet = heightFeetTextController.text;
                            var heightInches = heightInchesTextController.text;

                            if (weight != "" &&
                                heightFeet != "" &&
                                heightInches != "") {
                              var weightInt = int.parse(weight);
                              var heightFeetInt = int.parse(heightFeet);
                              var heightInchesInt = int.parse(heightInches);
                              var totalIches =
                                  (heightFeetInt * 12) + heightInchesInt;
                              var totalCentiMeters = totalIches * 2.54;
                              var totalMeters = totalCentiMeters / 100;
                              var bmi = weightInt / pow(totalMeters, 2);

                              if (bmi > 25) {
                                message = "You are Overweight!";
                                color = Colors.red;
                                colorTwo = Colors.red;
                              } else if (bmi < 18) {
                                message = "You are Underweight!";
                                color = Colors.red;
                                colorTwo = Colors.red;
                              } else {
                                message = "You are Healthy!";
                                color = Colors.green;
                                colorTwo = Colors.green;
                              }

                              setState(() {
                                result =
                                    "Your BMI is: ${bmi.toStringAsFixed(3)}";
                              });
                            } else {
                              setState(() {
                                result = "Please, Fill Form Properly";
                              });
                            }
                          },
                          child: Text("Calculate"))
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
