import 'package:Movies/cards/single_actor_picture.dart';
import 'package:flutter/material.dart';

import '../models/actor.dart';
import '../styles/constants.dart';


class ActorCard extends StatelessWidget {

  const ActorCard({Key? key, required this.actor, required this.spacer}) : super(key: key);

  final Actor actor;
  final double spacer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: kBoxShadowItem, color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: 154,
      margin: EdgeInsets.only(left: spacer, right: kHorizontalSpacer, bottom: kVerticalSpacer),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleActorPicture(
                profilePath:
                    actor.profilePath.isEmpty
                        ? ""
                        : actor.profilePath),
            const SizedBox(
              height: kVerticalSpacer / 2,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalSpacer / 2),
              child: Column(
                children: [
                  SizedBox(
                    width: 154,
                    child: Text(
                      actor.name,
                      softWrap: true,
                      maxLines: 2,
                      style: kCardTitleStyle.apply(color: kMainTextColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 154,
                    child: Text(
                      actor.character,
                      softWrap: true,
                      maxLines: 2,
                      style: kCardTitleStyle.apply(fontWeightDelta: -100),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
