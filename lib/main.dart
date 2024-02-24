import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:core';

void main() {
  runApp(const MyApp());
}

var weightcontroller = TextEditingController();
var feetcontroller = TextEditingController();
var inchcontroller = TextEditingController();
var resultext = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcutate your BMI(SI standard)"),
        backgroundColor: Colors.amber.shade200,
        centerTitle: true,
        elevation: 15,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Colors.black87,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BMI",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: weightcontroller,
              decoration: InputDecoration(
                label: Text("Enter your weight in kilograms(kgs)."),
                prefixIcon: Icon(Icons.line_weight_sharp),
              ),
            ),
            TextField(
              controller: feetcontroller,
              decoration: InputDecoration(
                label: Text("Enter your height in feet."),
                prefixIcon: Icon(Icons.height_outlined),
              ),
            ),
            TextField(
              controller: inchcontroller,
              decoration: InputDecoration(
                label: Text("Enter your height in inch."),
                prefixIcon: Icon(Icons.height_rounded),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (weightcontroller.text.toString() != '' &&
                    feetcontroller.text.toString() != '' &&
                    inchcontroller.text.toString() != '') {
                  var weight = int.parse(weightcontroller.text.toString());
                  var feet = int.parse(feetcontroller.text.toString());
                  var inch = int.parse(inchcontroller.text.toString());
                  var tinch = 12 * feet + inch;
                  var bmi = weight / pow(tinch / 39.37, 2);
                  setState(() {
                    resultext = "Your BMI   is ${bmi.toStringAsFixed(2)}. ";
                  });
                } else {
                  setState(() {
                    resultext = 'Input the required value';
                  });
                }
              },
              child: Text("Calculate"),
              style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStatePropertyAll(Colors.orangeAccent),
                padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              resultext,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
