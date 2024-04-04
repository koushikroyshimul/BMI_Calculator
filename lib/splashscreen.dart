import 'package:bmicalculator/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const firstpage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.pink],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image(image: AssetImage('assets/BMI.png'),height: 160,width: 160,)
              ),
              Center(
                  child: Text('BMI CALCULATOR',style: TextStyle(color: Colors.white, fontSize: 35),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
