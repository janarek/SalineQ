import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          width: 1.5  ,
                          color: Color.fromARGB(255, 43, 108, 79),
                        )
                      ),
                      onPressed: () {}, 
                      child: const Text('LOGIN',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        backgroundColor: const Color.fromARGB(255, 43, 108, 79),
                      ),
                      onPressed: () {}, 
                      child: const Text('SIGN UP',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
