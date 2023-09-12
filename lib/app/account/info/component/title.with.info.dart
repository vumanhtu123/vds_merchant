import 'package:flutter/material.dart';

class TitleWithInfo extends StatelessWidget {
  final String title;
  final String info;
  const TitleWithInfo({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(color: Color(0xFF9A9CAD)),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(info, style: const TextStyle()),
              ),
            )
          ],
        ),
        const Divider(
          height: 22,
          thickness: 1,
          color: Color(0xFFF6F7FB),
        )
      ],
    );
  }
}
