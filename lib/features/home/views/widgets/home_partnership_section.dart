import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/home/models/partnership_model.dart';
import 'package:hodoo_point/features/home/views/widgets/home_section_container.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePartnershipSection extends StatelessWidget {
  const HomePartnershipSection({super.key, required this.partnershipModels});
  final List<PartnershipModel> partnershipModels;

  void _launchApp(PartnershipModel partnership) async {
    bool isLaunched = false;

    if (Platform.isAndroid) {
      isLaunched = await DeviceApps.openApp(partnership.androidAppId!);
    } else if (Platform.isIOS) {
      isLaunched = await launchUrl(partnership.iosUrlScheme!,
          mode: LaunchMode.externalApplication);
    }

    if (!isLaunched) {
      StoreRedirect.redirect(
          androidAppId: partnership.androidAppId!,
          iOSAppId: partnership.iosBundleId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeSectionContainer(
        title: '제휴사',
        child: Column(
          children: [
            for (var partnership in partnershipModels)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Gaps.size2, vertical: Gaps.size1),
                child: GestureDetector(
                  onTap: () async {
                    if (partnership.isApp) {
                      _launchApp(partnership);
                    } else if (partnership.siteUrl != null) {
                      await launchUrl(partnership.siteUrl!);
                    }
                  },
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            width: 80,
                            height: 80,
                            imageUrl: partnership.imageUrl,
                          ),
                        ),
                        Gaps.h2,
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: Gaps.size1),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(partnership.title,
                                    style: const TextStyle(fontSize: 14)),
                                Text(
                                  '${partnership.name} ',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                for (var tag in partnership.tags ?? [])
                                  Text(
                                    '#$tag',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[700]!),
                                  ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}
