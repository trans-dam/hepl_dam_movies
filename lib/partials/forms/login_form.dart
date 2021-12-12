import 'dart:core';

import 'package:Movies/partials/dialogs/alert_dialog.dart';
import 'package:Movies/screens/home_screen.dart';
import 'package:Movies/styles/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String _email;
  late String _password;

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _formFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalSpacer),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Se connecter",
              style: kTitle1Style,
            ),
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
                    key: _formFieldKey,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'L’adresse mail est obligatoire.';
                      } else if (!EmailValidator.validate(_email)) {
                        return 'Le format de l’email n’est pas valide';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      _email = text;
                      print(text);
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      isDense: true,
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.mail,
                        color: kMainTextColor,
                      ),
                      hintText: 'Votre email..',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: kMainTextColor,
                      ),
                    ),
                  ),
                  Divider(
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
                      print(text);
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
                      hintText: 'Votre mot de passe...',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: kMainTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  if (_formFieldKey.currentState!.validate()) {
                    _auth.sendPasswordResetEmail(email: _email).then((value) {
                      MyAlertDialog("Réinitialisation du mot de passe",
                          "Un mail a été envoyé avec succès à l’adresse ${_email}");
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("J’ai oublie mon mot de passe"),
                  ],
                )),
            GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Traitement des données...')),
                  );
                  try {
                    await _auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    print(e.toString());
                    if (e.code == "user-not-found") {
                      _auth
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((user) {
                        user.user!.sendEmailVerification();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Oups ! ${e.toString()}")),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Oups ! ${e.toString()}")),
                    );
                  }
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalSpacer,
                    vertical: kVerticalSpacer / 2),
                margin: const EdgeInsets.only(top: kVerticalSpacer),
                decoration: BoxDecoration(
                    borderRadius: kBorderRadiusItem,
                    boxShadow: kBoxShadowItem,
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Me connecter",
                      style: kTitleSection.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
