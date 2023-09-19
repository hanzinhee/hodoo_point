import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/utils/root_navigation.dart';

class ShoppingBuyOptionSheet extends StatefulWidget {
  const ShoppingBuyOptionSheet({super.key});

  @override
  State<ShoppingBuyOptionSheet> createState() => _ShoppingBuyOptionSheetState();
}

class _ShoppingBuyOptionSheetState extends State<ShoppingBuyOptionSheet> {
  final boxHeight = 50.0;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final List<String> _options = [];

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  // 드롭다운 생성.
  void _createOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = _optionDropdown();
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  // 드롭다운 해제.
  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // 드롭다운.
  OverlayEntry _optionDropdown() {
    return OverlayEntry(
      maintainState: true,
      builder: (dialogContext) => Positioned(
        width: MediaQuery.of(context).size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(0, boxHeight + Gaps.size1),
          child: Material(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: Gaps.size2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5 -
                      boxHeight -
                      Gaps.size5,
                ),
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.all(Gaps.size2),
                  shrinkWrap: true,
                  children: [
                    for (int i = 0; i < 10; i++) ...[
                      InkWell(
                        onTap: () {
                          setState(() {
                            ScaffoldMessenger.of(RootNavigation.context)
                                .showSnackBar(
                              SnackBar(
                                content: Text('이미 선택된 옵션입니다.'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                            if (_options.contains('옵션 $i')) {}
                            _options.add('옵션 $i');
                          });
                          _removeOverlay();
                        },
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  'https://picsum.photos/100/100/?option=$i',
                              width: 50,
                            ),
                            Gaps.h2,
                            Text('옵션 $i')
                          ],
                        ),
                      ),
                      if (i < 10 - 1) Divider()
                    ]
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.symmetric(vertical: Gaps.size2),
      color: Colors.white,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (_overlayEntry == null) {
                _createOverlay();
              } else {
                _removeOverlay();
              }
            },
            child: CompositedTransformTarget(
              link: _layerLink,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: Gaps.size2),
                height: boxHeight,
                margin: const EdgeInsets.symmetric(horizontal: Gaps.size2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueGrey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '옵션선택',
                      style: TextStyle(color: Colors.blueGrey[800]),
                    ),
                    const Icon(Icons.expand_more, color: Colors.blueGrey)
                  ],
                ),
              ),
            ),
          ),
          Gaps.v2,
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: Gaps.size2),
              controller: ScrollController(),
              children: [
                for (int i = 0; i < _options.length; i++) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Gaps.size2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_options[i]),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _options.removeAt(i);
                            });
                          },
                          icon: const Icon(Icons.close),
                        )
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          Gaps.v2,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Gaps.size2),
            child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: const Text('바로구매')),
          )
        ],
      ),
    );
  }
}
