import 'package:Movies/styles/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email;
  late String _password;

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Se connecter",
          style: kTitle1Style,
        ),
        SizedBox(
          height: kVerticalSpacer * 3,
        ),
        Container(
          margin: const EdgeInsets.only(
              left: kHorizontalSpace,
              right: kHorizontalSpace,
              bottom: kVerticalSpacer),
          padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalSpace, vertical: kHorizontalSpace),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: kBorderRadiusItem,
            boxShadow: kBoxShadowItem,
          ),
          child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  _email = text;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  isDense: true,
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.email,
                    color: kMainTextColor,
                  ),
                  hintText: 'Entrez votre email...',
                  hintStyle: TextStyle(
                    fontSize: 17,
                    color: kMainTextColor,
                  ),
                ),
              ),
              Divider(
                color: kMainTextColor,
                height: 30,
              ),
              TextField(
                onChanged: (text) {
                  _password = text;
                },
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  isDense: true,
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.password,
                    color: kMainTextColor,
                  ),
                  hintText: 'Entrez votre mot de passe...',
                  hintStyle: TextStyle(
                    fontSize: 17,
                    color: kMainTextColor,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: kHorizontalSpace),
          padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalSpace, vertical: kVerticalSpacer / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: kBorderRadiusItem,
            boxShadow: kBoxShadowItem,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTapDown: (tapdetails) {
                  try {
                    _auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomeScreen()));
                  } catch (err) {
                    print(err);
                  }
                },
                child: const Text(
                  "Se connecter",
                  style: TextStyle(color: kMainTextColor),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
