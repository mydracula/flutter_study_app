import 'package:app/utils/app_layout.dart';
import 'package:flutter/material.dart';

class TicketTabs extends StatelessWidget {
  final String firstTable;
  final String secondTable;

  const TicketTabs(
      {super.key, required this.firstTable, required this.secondTable});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return FittedBox(
        child: Container(
            padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F6FD),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Container(
                  width: size.width * .44,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(50)),
                  ),
                  child: Center(
                    child: Text(firstTable),
                  ),
                ),
                Container(
                  width: size.width * .44,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(50)),
                  ),
                  child: Center(
                    child: Text(secondTable),
                  ),
                )
              ],
            )));
  }
}
