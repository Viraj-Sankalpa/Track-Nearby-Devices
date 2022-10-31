import 'package:blu/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'nearby_interface.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class RegistationScreen extends StatefulWidget {
  const RegistationScreen({super.key});

  @override
  State<RegistationScreen> createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistationScreen> {
  final _auth = FirebaseAuth.instance;
  // Firestore _firestore = Firestore.instance;
  var _firestore = FirebaseFirestore.instance;

  bool showSpinner = false;
  late String email;
  late String password;
  late String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/bg1.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "user name"),
                  textAlign: TextAlign.center,
                  onChanged: ((value) {
                    userName = value;
                  }),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Email"),
                  textAlign: TextAlign.center,
                  onChanged: ((value) {
                    email = value;
                  }),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Password"),
                  // keyboardType: TextInputType.emailAddress,
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.center,
                  onChanged: ((value) {
                    password = value;
                  }),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  colour: Colors.red,
                  title: 'Register',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (newUser != null) {
                        _firestore.collection('users').doc(email).set({
                          'username': userName,
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NearbyInterface()));
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
