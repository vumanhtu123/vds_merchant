import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vds/asset/Image.asset.dart';

class CountDown extends StatefulWidget {
  final Duration time;
  final Function onEndCountdown;
  const CountDown(
      {super.key, required this.time, required this.onEndCountdown});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late Timer _timer;
  int secondCountDown = 0;

  @override
  void initState() {
    secondCountDown = widget.time.inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          secondCountDown--;
        });
      }
      if (secondCountDown == 0) {
        widget.onEndCountdown();
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: secondCountDown);
    var minutes = duration.inMinutes;
    var seconds = duration.inSeconds - minutes * 60;
    return Container(
        decoration: BoxDecoration(
            color: const Color(0xFFA1AEDB),
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(ImageAsset.iconClock),
            const SizedBox(
              width: 6,
            ),
            Text(
              "${'$minutes'.padLeft(2, '0')} : ${'$seconds'.padLeft(2, '0')}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ));
  }
}
