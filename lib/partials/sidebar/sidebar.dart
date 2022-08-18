import 'package:Movies/models/data_item.dart';
import 'package:Movies/partials/avatar.dart';
import 'package:Movies/partials/sidebar/menu_item.dart';
import 'package:Movies/screens/login_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../styles/constants.dart';

class SidebarScreen extends StatefulWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  _SidebarScreenState createState() => _SidebarScreenState();
}

class _SidebarScreenState extends State<SidebarScreen> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(34)),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 34),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Avatar(),
                      const SizedBox(
                        width: kHorizontalSpacer,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Daniel Schreurs"),
                          Text(
                            "HEPL - DAM",
                            style: fontStyleLegend,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: kVerticalSpacer * 2,
                  )
                ],
              ),
              MyMenuItem(menuItemsData[0]),
              MyMenuItem(menuItemsData[1]),
              MyMenuItem(menuItemsData[2]),
              Spacer(),
              Row(
                children: [
                  const Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      _signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginForm()));
                    },
                    child: const Text(
                      "Je me déconnecte!",
                      style: fontStyleLegend,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
