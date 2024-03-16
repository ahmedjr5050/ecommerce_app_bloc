import 'package:app2/features/splash_screen/onbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToSplashScreen();
  }

  void navigateToSplashScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.greenAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Animate(
                      effects: [
                        // SlideEffect(duration: 2.seconds),

                        // FadeEffect(duration: 2.seconds),
                        // ScaleEffect(duration: 500.ms),
                        MoveEffect(duration: 1.seconds),
                      ],
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.local_grocery_store,
                          color: Colors.black,
                          size: 50.0,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10.0)),
                    Animate(
                      effects: [
                        SlideEffect(duration: 2.seconds),
                        // BoxShadowEffect(
                        //   begin: BoxShadowEffect.neutralValue,
                        //   curve: Curves.bounceIn,
                        //   duration: 2.seconds,
                        // ),
                        FadeEffect(duration: 2.seconds),
                        // ScaleEffect(duration: 500.ms),
                        // MoveEffect(duration: 1000.ms),
                      ],
                      child: Text(
                        "Market",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            fontFamily: GoogleFonts.acme().fontFamily,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
