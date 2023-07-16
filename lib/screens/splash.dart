import 'package:flutter/material.dart';
import 'package:instagram_project/screens/home.dart';
import 'package:instagram_project/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSpalsh extends StatefulWidget {
  const ScreenSpalsh({super.key});

  @override
  State<ScreenSpalsh> createState() => _ScreenSpalshState();
}

class _ScreenSpalshState extends State<ScreenSpalsh> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 300,
          child: Image.asset(
            'assets/images/insta.png',
            height: 250,
          ),
        ),
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    final userLoggedIn = sharedPrefs.getBool('SAVE_KEY_NAME');

    await Future.delayed(const Duration(seconds: 1 ));

    if (userLoggedIn == null || userLoggedIn == false) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const ScreenLogin()));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const ScreenHome()));
    }
  }
}
