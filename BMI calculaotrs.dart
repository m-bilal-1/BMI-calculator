//BMI calute page
import 'package:flutter/material.dart';
import 'dart:ui';
class BMI_calculator extends StatefulWidget {
  const BMI_calculator({super.key});

  @override
  State<BMI_calculator> createState() => _BMI_calculatorState();
}

class _BMI_calculatorState extends State<BMI_calculator> {
  var weightController = TextEditingController();
  var inchController = TextEditingController();
  var feetController = TextEditingController();

  var Results = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/download (1).jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Calculate BMI',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildInputField(
                    controller: weightController,
                    label: "Enter your weight in Kilograms",
                    imagePath: ('assets/weighing-machine.png'),
                  ),
                  SizedBox(height: 20),
                  _buildInputField(
                    controller: feetController,
                    label: "Enter your height in feet",
                    imagePath: ('assets/height.png'),
                  ),
                  SizedBox(height: 20),
                  _buildInputField(
                    controller: inchController,
                    label: "Enter your height in inches",
                    imagePath: ('assets/height.png'),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _calculateBMI,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.deepPurpleAccent,
                      elevation: 5,
                    ),
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    Results,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String imagePath, // Pass the image path
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          border: InputBorder.none,
          labelText: label,
          prefixIcon: Padding(
            padding: EdgeInsets.all(8.0), // Add padding for better alignment
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  void _calculateBMI() {
    var weight = weightController.text.toString();
    var feet = feetController.text.toString();
    var inch = inchController.text.toString();

    if (weight != '' && feet != '' && inch != '') {
      var iWt = int.parse(weight);
      var iFt = int.parse(feet);
      var iInch = int.parse(inch);

      var tInch = (iFt * 12) + iInch;
      var tCm = tInch * 2.54;
      var tMeter = tCm / 100;

      var bmi = iWt / (tMeter * tMeter);

      var message = '';
      if (bmi > 25) {
        message = 'You are overweight';
      } else if (bmi < 18) {
        message = 'You are underweight';
      } else {
        message = 'You are normal weight';
      }

      setState(() {
        Results = '$message\nYour BMI is ${bmi.toStringAsFixed(2)}!';
      });
    } else {
      setState(() {
        Results = "Kindly complete all required fields.";
      });
    }
  }
}
