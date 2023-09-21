import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class LoopBanner extends StatefulWidget {
  const LoopBanner({
    super.key,
    required this.urls,
    this.viewportFraction = 1.0,
    this.margin = const EdgeInsets.symmetric(horizontal: Gaps.size2),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.indicatorMargin = const EdgeInsets.all(Gaps.size1),
  });

  final List<String> urls;
  final double viewportFraction;
  final EdgeInsets margin;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets indicatorMargin;

  @override
  State<LoopBanner> createState() => _LoopBannerState();
}

class _LoopBannerState extends State<LoopBanner> {
  late PageController controller;
  late int currentPage;
  late Timer timer;

  @override
  void initState() {
    controller = PageController(
        initialPage: widget.urls.length * 1000,
        viewportFraction: widget.viewportFraction);
    currentPage = widget.urls.length * 2;

    controller.addListener(() {
      if (controller.page! <= 1) {
        controller.jumpToPage(widget.urls.length * 2 + 1);
      }

      int roundPage = controller.page!.round();
      if (currentPage != roundPage) {
        stopAutoScroll();
        autoScroll();
        setState(() {
          currentPage = roundPage;
        });
      }
    });
    autoScroll();
    super.initState();
  }

  void autoScroll() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      // Fixed  positions.isNotEmpty, 'PageController.page cannot be accessed before a PageView is built with it.',
      if (controller.positions.isEmpty) return;
      controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutQuint);
    });
  }

  void stopAutoScroll() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final viewportFractionRightOffset = EdgeInsets.only(
          right: constraints.maxWidth * (1 - widget.viewportFraction) / 2);
      return Stack(
        children: [
          PageView.builder(
              clipBehavior: Clip.none,
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () async {
                    final Uri launchUri = Uri(
                      scheme: 'https',
                      path: 'pub.dev',
                    );
                    await launchUrl(launchUri, mode: LaunchMode.inAppWebView);
                  },
                  child: Container(
                    margin: widget.margin,
                    child: ClipRRect(
                      borderRadius: widget.borderRadius,
                      child: CachedNetworkImage(
                        color: [
                          Colors.blue,
                          Colors.deepOrange,
                          Colors.amber,
                          Colors.green,
                          Colors.deepPurple,
                        ][index % widget.urls.length]
                            .withOpacity(0.7),
                        colorBlendMode: BlendMode.srcATop,
                        imageUrl: widget.urls[index % widget.urls.length],
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[200]!,
                          highlightColor: Colors.grey[50]!,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              }),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: widget.indicatorMargin +
                  widget.margin +
                  viewportFractionRightOffset,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${currentPage % widget.urls.length} / ${widget.urls.length}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      timer.isActive ? stopAutoScroll() : autoScroll();
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        timer.isActive ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
