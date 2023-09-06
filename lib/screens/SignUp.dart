import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({ Key? key }) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 350,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Image.asset('assets/images/salineq_logo.png')
              ),
              Container(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
              ),
              Container(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    backgroundColor: const Color.fromARGB(255, 43, 108, 79),
                  ),
                  onPressed: () {}, 
                  child: const Text('CONFIRM',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 10, color: Colors.lightBlue)
                ),
                onPressed: () {}, 
                child: const Text('Already have an account?')
              )
            ],
          )
      ),
    );
  }
}