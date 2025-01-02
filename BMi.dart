//BMI
import 'package:bmi_calculator/BMI%20calculators.dart';
import 'package:bmi_calculator/Height_conversion.dart';
import 'package:bmi_calculator/Weight_Conversion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'Info_Page.dart';

class BMI_Screen extends StatefulWidget {
  const BMI_Screen({super.key});

  @override
  State<BMI_Screen> createState() => _BMI_ScreenState();
}

class _BMI_ScreenState extends State<BMI_Screen> {
  var weightController = TextEditingController();
  var inchController = TextEditingController();
  var feetController = TextEditingController();

  var Results = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Stack(
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
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Container(
                  height: 45,
                  color: Colors.black,
                ),
                Container(
                  color: Colors.black,
                  child: TabBar(
                    isScrollable: false,
                    labelColor: Colors.purple,
                    unselectedLabelColor: Colors.white54,
                    indicatorColor: Colors.purple,
                    tabs: [
                      Tab(
                        icon: Image.asset(
                          'assets/taskbar_photo/info.png',
                          width: 24,
                          height: 24,
                        ),
                        text: "Home",
                      ),
                      Tab(
                        icon: Image.asset(
                          'assets/taskbar_photo/body-mass-index.png',
                          width: 24,
                          height: 24,
                        ),
                        text: "BMI conversion",
                      ),
                      Tab(
                        icon: Image.asset(
                          'assets/taskbar_photo/height.png',
                          width: 24,
                          height: 24,
                        ),
                        text: "Height conversion",
                      ),
                      Tab(
                        icon: Image.asset(
                          'assets/taskbar_photo/business.png',
                          width: 24,
                          height: 24,
                        ),
                        text: "Weight conversion",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Info_Page(),
                      BMI_calculator(),
                      HeightConversion(),
                      WeightConversion(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
