import 'package:flutter/material.dart';
import 'Addition/constants.dart';

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  String selectedGender = 'laki-laki';
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0.0;

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;

    if (height > 0 && weight > 0) {
      double heightInMeters = height / 100;
      double bmi;

      if (selectedGender == 'laki-laki') {
        // BMI calculation for males
        bmi = weight / (heightInMeters * heightInMeters);
      } else {
        // BMI calculation for females
        bmi = weight / (heightInMeters * heightInMeters) * 1.08;
      }

      setState(() {
        bmiResult = bmi;
      });
    } else {
      setState(() {
        bmiResult = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: primaryButtonColor,
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Navigate back to the home page when the back button is pressed
          Navigator.pop(context);
          return false; // Return false to prevent default back behavior
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DropdownButton(
                value: selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'laki-laki',
                    child: Text('Laki-laki'),
                  ),
                  DropdownMenuItem(
                    value: 'perempuan',
                    child: Text('Perempuan'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Tinggi (cm)'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Berat (kg)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  calculateBMI();
                },
                child: Text('Hitung BMI'),
              ),
              SizedBox(height: 20),
              Text(
                'BMI: ${bmiResult.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
