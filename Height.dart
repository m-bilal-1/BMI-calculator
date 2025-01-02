//Height conversion
import 'package:flutter/material.dart';
import 'dart:ui';

class HeightConversion extends StatefulWidget {
  const HeightConversion({super.key});

  @override
  State<HeightConversion> createState() => _HeightConversionState();
}

class _HeightConversionState extends State<HeightConversion> {
  final TextEditingController feetController = TextEditingController();
  final TextEditingController inchesController = TextEditingController();
  final TextEditingController heightInchesController = TextEditingController();

  double? heightInCm;
  double? heightInFeet;
  double? heightInInches;

  void calculateHeight() {
    setState(() {
      if (heightInchesController.text.isNotEmpty) {
        heightInInches = double.tryParse(heightInchesController.text);
      } else {
        double feet = double.tryParse(feetController.text) ?? 0;
        double inches = double.tryParse(inchesController.text) ?? 0;
        heightInInches = (feet * 12) + inches;
      }

      if (heightInInches != null) {
        heightInCm = heightInInches! * 2.54;
        heightInFeet = heightInInches! / 12;
      }
    });
  }


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
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 150,),
                Text(
                  "Height Conversion",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)
                  ),
                  elevation: 5,
                  child: TextField(
                    controller: feetController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      border: InputBorder.none,
                      labelText: 'Enter your height in FEET',
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.0), // Add padding for better alignment
                        child: Image.asset(
                          'assets/height.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,



                  ),
                ),
                SizedBox(height: 20,),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)
                  ),
                  elevation: 5,
                  child: TextField(
                    controller: inchesController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      border: InputBorder.none,
                      labelText: 'Enter your height in Inches',
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.0), // Add padding for better alignment
                        child: Image.asset(
                          'assets/taskbar_photo/business.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,



                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: calculateHeight,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  ),
                  child: Text(
                    "Convert",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                if (heightInInches != null && heightInCm != null && heightInFeet != null)
                  Column(
                    children: [
                      Text(
                        "Height in Inches: ${heightInInches!.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Height in Centimeters: ${heightInCm!.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

