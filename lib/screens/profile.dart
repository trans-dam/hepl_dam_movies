import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../styles/constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _name = "Ton nom d’utilisateur";
  String _bio = "Quelques mots sur toi...";

  File? _image;

  @override
  void initState() {
    super.initState();
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kCardPopupBackgroundColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(34),
                ),
                boxShadow: kBoxShadowItem,
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 32, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              maxWidth: 40,
                              maxHeight: 24,
                            ),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.arrow_back,
                                  color: kMainTextColor,
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "Mon profil",
                            style: kCalloutLabelStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Mettez votre profil à jour!'),
                                      content: Column(
                                        children: [
                                          TextField(
                                            onChanged: (newValue) {
                                              setState(() {
                                                _name = newValue;
                                              });
                                            },
                                            controller: TextEditingController(
                                                text: _name),
                                          ),
                                          TextField(
                                            onChanged: (newValue) {
                                              setState(() {
                                                _bio = newValue;
                                              });
                                            },
                                            controller: TextEditingController(
                                                text: _bio),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Mettre à jour!'))
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: kBoxShadowItem),
                              child: Icon(
                                Platform.isAndroid
                                    ? Icons.edit
                                    : CupertinoIcons.pencil,
                                color: kMainTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kHorizontalSpacer),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: getImage,
                            child: Container(
                              child: CircleAvatar(
                                backgroundColor: kMainBackgroundColor,
                                child: _image == null
                                    ? const Icon(
                                        Icons.download,
                                        color: kMainTextColor,
                                      )
                                    : ClipOval(
                                        child: Image.file(
                                          _image!,
                                          fit: BoxFit.cover,
                                          width: 84,
                                          height: 84,
                                        ),
                                      ),
                                radius: 30,
                              ),
                              height: 84,
                              width: 84,
                              decoration: BoxDecoration(
                                  gradient: const RadialGradient(
                                      colors: kGradientColors),
                                  borderRadius: BorderRadius.circular(42),
                                  border: Border.all(
                                      color: kSecondColor, width: kBorderWith)),
                            ),
                          ),
                          const SizedBox(
                            width: kHorizontalSpacer,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _name,
                                style: kBodyLabelStyle,
                              ),
                              const SizedBox(
                                height: kVerticalSpacer/3,
                              ),
                              Text(
                                _bio,
                                style: kBodyLabelStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: kVerticalSpacer,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
