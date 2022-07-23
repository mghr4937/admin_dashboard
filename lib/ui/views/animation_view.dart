import 'package:admin_dashboard/ui/shared/widgets/ball.dart';
import 'package:flutter/material.dart';
import '/ui/shared/widgets/cards/whirte_card.dart';
import '/ui/shared/widgets/labels/custom_labels.dart';

class AnimationView extends StatefulWidget {
  const AnimationView({Key? key}) : super(key: key);

  @override
  State<AnimationView> createState() => _AnimationViewState();
}

class _AnimationViewState extends State<AnimationView> with TickerProviderStateMixin {
  late Animation<double> ballAnimation;
  late AnimationController ballController;

  @override
  void initState() {
    super.initState();

    ballController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 400,
        ));
    ballAnimation = Tween(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(parent: ballController, curve: Curves.easeIn),
    );
  }

  onTap() {
    if (ballController.isCompleted) {
      ballController.reverse();
    } else if (ballController.status == AnimationStatus.forward) {
      ballController.reverse();
    } else if (ballController.status == AnimationStatus.reverse) {
      ballController.forward();
    } else if (ballController.isDismissed) {
      ballController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Animation View",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          WhiteCard(
            child: Container(
              height: 300,
              child: GestureDetector(
                onTap: onTap,
                child: Center(
                  child: Stack(
                    children: [
                      buildField(),
                      buildBallAnimation(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildBallAnimation() {
    return AnimatedBuilder(
      animation: ballAnimation,
      builder: ((context, child) {
        return Positioned(
          bottom: ballAnimation.value,
          right: 0.0,
          left: 0.0,
          child: child!,
        );
      }),
      child: Ball(),
    );
  }

  Widget buildField() {
    return Container(
      height: 200,
      width: 200,
      color: Colors.lightGreen[600],
    );
  }
}
