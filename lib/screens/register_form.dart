import 'dart:core';

import 'package:movies/models/error_firebase_auth.dart';
import 'package:movies/partials/buttons/button.dart';
import 'package:movies/partials/headers/app_name.dart';
import 'package:movies/partials/headers/app_slogan.dart';
import 'package:movies/screens/home.dart';
import 'package:movies/screens/login_form.dart';
import 'package:movies/styles/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late String _email;
  late String _password;

  final _auth = FirebaseAuth.instance;
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalSpacer),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppName(),
                const AppSlogan(),
                Container(
                  margin: const EdgeInsets.only(top: kVerticalSpacer * 3),
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalSpacer, vertical: kVerticalSpacer),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: kBorderRadiusItem,
                      boxShadow: kBoxShadowItem),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Le nom d’utilisateur est obligatoire';
                          }
                          return null;
                        },
                        onChanged: (text) {},
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          isDense: true,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            color: kMainTextColor,
                          ),
                          hintText: 'Nom d’utilisateur',
                          hintStyle: TextStyle(
                            fontSize: 17,
                            color: kMainTextColor,
                          ),
                        ),
                      ),
                      const Divider(
                        color: kMainTextColor,
                        height: kVerticalSpacer * 2,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'L’adresse mail est obligatoire.';
                          } else if (!EmailValidator.validate(_email)) {
                            return 'Le format de l’email n’est pas valide.';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          _email = text;
                          if (kDebugMode) {
                            print(text);
                          }
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          isDense: true,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.mail,
                            color: kMainTextColor,
                          ),
                          hintText: 'Votre email',
                          hintStyle: TextStyle(
                            fontSize: 17,
                            color: kMainTextColor,
                          ),
                        ),
                      ),
                      const Divider(
                        color: kMainTextColor,
                        height: kVerticalSpacer * 2,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Le mot de passe est obligatoire.';
                          }
                          if (value.length < 9) {
                            return 'Le mot de passe doit être supérieur à 9 caractères';
                          }
                          return null;
                        },
                        obscureText: true,
                        onChanged: (text) {
                          if (kDebugMode) {
                            print(text);
                          }
                          _password = text;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          isDense: true,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.password,
                            color: kMainTextColor,
                          ),
                          hintText: 'Votre mot de passe',
                          hintStyle: TextStyle(
                            fontSize: 17,
                            color: kMainTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) => const LoginForm()));
                      },
                      child: const Text("Se connecter"),
                    ),
                  ],
                ),
                Button("S’enregistrer", () async {
                  if (_loginFormKey.currentState!.validate()) {
                    try {
                      // TODO register username
                      await _auth
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Bonjour ${_auth.currentUser!.email}')),
                        );
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                              errors[e.code]!,
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.redAccent),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Oups ! ${e.toString()}")),
                      );
                    }
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
