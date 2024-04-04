import 'package:flutter/material.dart';
import 'package:bmicalculator/first_page.dart';

class SecondPage extends StatefulWidget {
  final double bmi;
  final String bmiCategory;
  final String adv;
  final String pic;

  SecondPage({required this.bmi, required this.bmiCategory, required this.adv, required this.pic});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1d1e33),
          title: Center(
            child: Text(
              'BMI CALCULATOR',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff0a0e21),
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  'Your Result',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff1d1e33),
                  ),
                  height: 460,
                  width: 340,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.bmiCategory,
                        style: TextStyle(color: Colors.green, fontSize: 24),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        '${widget.bmi.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 150, // Adjust width as needed
                        height: 150, // Adjust height as needed
                        child: Image.asset(
                          widget.pic, // Use the pic variable passed from the first page
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      Text(
                        widget.adv,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => firstpage()),
                    );
                  },
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    minimumSize: Size(double.infinity, 64),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
