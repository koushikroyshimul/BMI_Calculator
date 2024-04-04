import 'package:bmicalculator/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  int height = 150;
  int weight = 50;
  int age = 20;

  double bmi = 0.0;
  String bmiCategory = '';
  String adv = '';
  String pic ='';

  void calculateBMI() {
    double heightInMeters = height / 100; // Convert height to meters
    bmi = weight / (heightInMeters * heightInMeters); // Update class-level bmi variable
    determineBMICategory();
    advice();
    image();
    navigateToSecondPage(); // Navigate to second page with updated bmi and bmiCategory
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

  void advice() {
    if (bmi < 18.5) {
      adv = 'Focus on nutrient-dense foods and consult with a healthcare professional for personalized guidance';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      adv = 'Maintain a balanced diet and incorporate regular exercise for overall well-being.';
    } else if (bmi >= 25 && bmi <= 29.9) {
      adv = 'Implement a sustainable lifestyle change with emphasis on portion control and increased physical activity';
    } else {
      adv = 'Seek professional medical support to develop a comprehensive weight management plan tailored to your needs';
    }
  }
  
  void image(){
    if (bmi < 18.5) {
      pic = 'assets/underweight.png';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      pic = 'assets/normal.png';
    } else if (bmi >= 25 && bmi <= 29.9) {
      pic = 'assets/fat.png';
    } else {
      pic = 'assets/obesity.png';
    }
  }
  
  void navigateToSecondPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(bmi: bmi, bmiCategory: bmiCategory, adv: adv, pic:pic),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1d1e33),
          title: Center(
            child: Text('BMI CALCULATOR',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff0a0e21),
          ),
          child: Column(
            children: [
              SizedBox(height: 5,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff1d1e33),
                      ),
                      height: 160,
                      width: 160,
                      child: Column(
                        children: [
                          Center(
                            child: Icon(
                              Icons.male,
                              color: Colors.white,
                              size: 100,
                            ),
                          ),
                          Text(
                            'Male',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, top: 15, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff1d1e33),
                      ),
                      height: 160,
                      width: 160,
                      child: Column(
                        children: [
                          Center(
                            child: Icon(Icons.female,
                              color: Colors.white,
                              size: 100,
                            ),
                          ),
                          Text('Female', style: TextStyle(color: Colors.white, fontSize: 24),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff1d1e33),
                ),
                height: 210,
                width: 340,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Center(child: Text("HEIGHT", style: TextStyle(color: Colors.white, fontSize: 30),)),
                    SizedBox(height: 0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: TextStyle(color: Colors.white, fontSize: 47),),
                        Text('cm', style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 02,),
                    Container(
                      child: Slider(
                        max: 300,
                        min: 0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.toInt().round();
                          });
                        },
                        value: height.toDouble(),
                        activeColor: Colors.white, // Set active color
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 15, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff1d1e33),
                      ),
                      height: 160,
                      width: 160,
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Text('Weight', style: TextStyle(color: Colors.white, fontSize: 26)),
                          SizedBox(height: 1,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                ),
                              ),
                              Text('kg', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 30,),
                              CircleAvatar(
                                child: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 15, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff1d1e33),
                      ),
                      height: 160,
                      width: 160,
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Text('Age', style: TextStyle(color: Colors.white, fontSize: 26)),
                          SizedBox(height: 1,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                age.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                ),
                              ),
                              Text('years', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 30,),
                              CircleAvatar(
                                child: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: calculateBMI, // Call calculateBMI function here
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  minimumSize: Size(double.infinity,62),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
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
