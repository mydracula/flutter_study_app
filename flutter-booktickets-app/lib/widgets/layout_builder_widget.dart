import 'package:flutter/material.dart';

class LayoutBuilderWidget extends StatelessWidget {
  final bool? isColored;
  final int sections;
  final double width;
  final double height;
  const LayoutBuilderWidget(
      {super.key,
      this.isColored,
      required this.sections,
      this.width = 3,
      this.height = 1});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Flex(
            mainAxisSize: MainAxisSize.max,
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              constraints.constrainWidth() ~/ sections,
              (index) => SizedBox(
                width: width,
                height: height,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: isColored == null
                            ? Colors.white
                            : Colors.grey.shade300)),
              ),
            ));
      },
    );
  }
}
