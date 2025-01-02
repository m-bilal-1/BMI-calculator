//Weight conversion
import 'package:flutter/material.dart';
import 'dart:ui';

class WeightConversion extends StatefulWidget {
  const WeightConversion({super.key});

  @override
  State<WeightConversion> createState() => _WeightConversionState();
}

class _WeightConversionState extends State<WeightConversion> {
  final TextEditingController _weightController = TextEditingController();
  String _convertedWeight = "";

  void _convertWeight() {
    double weight = double.tryParse(_weightController.text) ?? 0.0;

    String result = """
    Kilograms: ${weight.toStringAsFixed(2)} kg
    Pounds: ${(weight * 2.20462).toStringAsFixed(2)} lbs
    Grams: ${(weight * 1000).toStringAsFixed(2)} grams
    """;

    setState(() {
      _convertedWeight = result;
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Weight Conversion",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)
                    ),
                    elevation: 5,
                    child: TextField(
                      controller: _weightController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: InputBorder.none,
                        labelText: 'Enter your Weigt in KILOGRAMS',
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
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _convertWeight,
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
                  Text(
                    _convertedWeight,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
