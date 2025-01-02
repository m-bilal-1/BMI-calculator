/information page
  import 'package:flutter/material.dart';
import 'dart:ui';

class Info_Page extends StatefulWidget {
  const Info_Page({super.key});

  @override
  State<Info_Page> createState() => _Info_PageState();
}

class _Info_PageState extends State<Info_Page> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(color: Colors.black,width: 0.5),
                image: DecorationImage(
                  image: AssetImage('assets/bmi_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'BMI Information',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Introduction Text
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'What is BMI?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'BMI (Body Mass Index) is a measure of body fat based on your weight and height. It helps to determine whether you are underweight, normal weight, overweight, or obese. BMI is an easy way to assess whether a person is in a healthy weight range.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),

            // BMI Categories with Images
            _buildBMICategory('Underweight', '> 18.5', 'assets/info_photo/underweight2.jpg'),
            _buildBMICategory('Normal weight', ' 18.0 =< BMI => 25', 'assets/info_photo/healthy.jpeg'),
            _buildBMICategory('Over weight', ' < 25 ', 'assets/info_photo/underweight1.jpg'),
            _buildBMICategory('Obese', '<<<25', 'assets/info_photo/obese.jpeg'),
            SizedBox(height: 40),

              Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tips for Maintaining a Healthy BMI:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '1. Eat a balanced diet rich in fruits, vegetables, and whole grains.\n'
                    '2. Exercise regularly to stay active and maintain a healthy weight.\n'
                    '3. Avoid sugary drinks and excess junk food.\n'
                    '4. Stay hydrated and aim for 7-9 hours of sleep each night.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 40),

            // Conclusion Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Conclusion:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Maintaining a healthy BMI is important for overall health. It can reduce the risk of developing conditions like heart disease, diabetes, and hypertension. If your BMI falls outside the normal range, it is important to talk to a healthcare provider for personalized advice.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildBMICategory(String category, String range,final String imagePath) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.black,width: 1)
          ),
          child: Column(
            children: [
              Container(

                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      imagePath,
                      ),fit: BoxFit.fill,
                    
                  )
                      ,borderRadius: BorderRadius.circular(10,),
                  border: Border.all(color: Colors.black,width: 1.5)
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '$category: $range',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
