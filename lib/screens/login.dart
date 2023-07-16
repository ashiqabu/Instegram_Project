import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_project/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final usenamecntrl = TextEditingController();

  final passwordcntrl = TextEditingController();

  bool isDataMatched = true;

  final _formkey = GlobalKey<FormState>();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 200,
                  height: 100,
                  child: Image.asset('assets/images/insta1.png')),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Value is Empty';
                  } else {
                    return null;
                  }
                },
                controller: usenamecntrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('username')),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Value is Empty';
                  } else {
                    return null;
                  }
                },
                controller: passwordcntrl,
                obscureText: obscure,
                decoration: InputDecoration(
                    suffixIcon: obscure
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                obscure = false;
                              });
                            },
                            icon: const Icon(Icons.lock_outline))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                obscure = true;
                              });
                            },
                            icon: const Icon(Icons.lock_open_outlined)),
                    border: const OutlineInputBorder(),
                    label: const Text('Password')),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: !isDataMatched,
                        child: const Text(
                          'Username Password does Not Match',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            checklogin(context);
                          } else {
                            stdout.write('Data Empty');
                          }

                          //checklogin(context);
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('login'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void checklogin(BuildContext ctx) async {
    final username = usenamecntrl.text;
    final password = passwordcntrl.text;
    if (username == password) {
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.blueGrey,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 3),
          content: Text(errormassage1)));

      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool('SAVE_KEY_NAME', true);

      // ignore: use_build_context_synchronously
      Navigator.of(ctx).push(MaterialPageRoute(
        builder: (ctx) => const ScreenHome(),
      ));
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 3),
          content: Text(_errormassage)));
    }
  }
}

const _errormassage = 'Username Password does Not Match';
const errormassage1 = 'Succsessfully Login';
