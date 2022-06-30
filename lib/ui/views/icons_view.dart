import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets/cards/whirte_card.dart';
import 'package:admin_dashboard/ui/shared/widgets/labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Icons",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                  title: 'sports_esports',
                  width: 150,
                  child: Center(
                    child: Icon(Icons.sports_esports),
                  )),
              WhiteCard(
                  title: 'sports_score',
                  width: 150,
                  child: Center(
                    child: Icon(Icons.sports_score),
                  )),
              WhiteCard(
                  title: 'sports_soccer',
                  width: 150,
                  child: Center(
                    child: Icon(Icons.sports_soccer),
                  )),
              WhiteCard(
                  title: 'speaker_notes',
                  width: 150,
                  child: Center(
                    child: Icon(Icons.speaker_notes),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
