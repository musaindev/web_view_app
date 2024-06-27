import 'package:flutter/material.dart';
import 'package:web_view/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getNavigation();

    super.initState();
  }

  Future<void> getNavigation () async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Container(
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
              text: "WebView",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Colors.yellow[400]),
              children: [
                TextSpan(
                  text: "App",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: Colors.white),
                )
              ]),
        ),
      ),
    );
  }
}
