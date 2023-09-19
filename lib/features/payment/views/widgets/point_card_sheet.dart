import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/utils/unicons.dart';
import 'package:lottie/lottie.dart';

class PointCardSheet extends StatefulWidget {
  const PointCardSheet({super.key});

  @override
  State<PointCardSheet> createState() => _PointCardSheetState();
}

class _PointCardSheetState extends State<PointCardSheet> {
  bool onCoped = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(30), right: Radius.circular(30)),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(Gaps.size2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Gaps.size2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('H.D POINT',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold)),
                          Text('적립/사용 할게요!',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w200)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Unicons.svg('fi-rr-cross'),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ],
                ),
                Gaps.v5,
                // paste button
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(Gaps.size2),
                    child: SizedBox(
                      height: 50,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          onCoped
                              ? Lottie.asset(
                                  'assets/lotties/lottie_success.json',
                                  width: 50,
                                  repeat: false)
                              : GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(const ClipboardData(
                                        text: '8710 4101 4035 3231'));
                                    setState(() {
                                      onCoped = true;
                                      Future.delayed(
                                          const Duration(milliseconds: 1500),
                                          () {
                                        setState(() {
                                          onCoped = false;
                                        });
                                      });
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Unicons.svg('fi-rr-copy')),
                                      Gaps.h1,
                                      const Text('복사하기')
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                SvgPicture.string(
                    Barcode.code128().toSvg('8710 4101 4035 3231', width: 330)),
                Gaps.v3,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
