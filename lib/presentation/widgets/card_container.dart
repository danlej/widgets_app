import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget content;
  final Widget action;

  const CardContainer({super.key, required this.content, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 3,
        child: Stack(
          children: [
            content,
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0)),
                ),
                child: action,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
