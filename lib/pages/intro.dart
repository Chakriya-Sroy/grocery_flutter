import 'package:flutter/material.dart';

import 'home.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          //logo
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Image.asset('lib/images/avocado.png'),
          ),
          //text
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'We deliver groceries at your doorstep',
              style:TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          //get started
          GestureDetector(
            onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return const HomePage();
            })),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(24),
              child: Text('Get Started',style: TextStyle(color: Colors.white),),
            ),
          )
        ]),
      ),
    );
  }
}