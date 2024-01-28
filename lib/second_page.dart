import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double bmi = 0.0;
  String bmiCategory = '';

  TextEditingController weightInput = TextEditingController();
  TextEditingController heightInput = TextEditingController();

  void calculateBMI() {
    double weight = double.tryParse(weightInput.text) ?? 0.0;
    double height = double.tryParse(heightInput.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      setState(() {
        bmi = weight / ((height / 100) * (height / 100));
        determineBMICategory();
      });
    }
  }

  void determineBMICategory() {
    if (bmi < 18.5) {
      bmiCategory = 'Underweight';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      bmiCategory = 'Normal';
    } else if (bmi >= 25 && bmi <= 29.9) {
      bmiCategory = 'Overweight';
    } else {
      bmiCategory = 'Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextFormField(
              controller: weightInput,
              decoration: InputDecoration(
                hintText: 'Weight (kg)',
              ),
            ),
          ),
          Center(
            child: TextFormField(
              controller: heightInput,
              decoration: InputDecoration(
                hintText: 'Height (cm)',
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                calculateBMI();
              },
              child: Container(
                height: 50,
                width: 150,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "BMI Calculator",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'BMI: ${bmi.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 10),
          Text(
            'Category: $bmiCategory',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}