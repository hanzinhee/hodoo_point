import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:intl/intl.dart';
import 'package:just_toast/toast/show_toast.dart';

class ShoppingBuyOptionSheet extends StatefulWidget {
  const ShoppingBuyOptionSheet({super.key});

  @override
  State<ShoppingBuyOptionSheet> createState() => _ShoppingBuyOptionSheetState();
}

class _ShoppingBuyOptionSheetState extends State<ShoppingBuyOptionSheet> {
  final boxHeight = 40.0;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final List<(String name, int amount, int price)> _options = [];

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
    final maxHeight = MediaQuery.of(context).size.height * 0.5 -
        boxHeight -
        (MediaQuery.of(context).padding.bottom != 0
            ? MediaQuery.of(context).padding.bottom
            : Gaps.size2) -
        Gaps.size2;

    return OverlayEntry(
      builder: (context) => Align(
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(0, boxHeight + 4),
          child: ConstrainedBox(
            // 폴더블 폰 대응
            // BottomSheet > _BottomSheetDefaultsM3 constrants 참조
            constraints: const BoxConstraints(maxWidth: 640),
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: Gaps.size2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 3,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: maxHeight,
                  ),
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.all(Gaps.size2),
                    shrinkWrap: true,
                    children: [
                      for (int i = 0; i < 10; i++) ...[
                        InkWell(
                          onTap: () {
                            // 중복 제거
                            if (_options
                                .map((e) => e.$1)
                                .toList()
                                .contains('옵션 $i')) {
                              showToast(
                                  context: context, text: '이미 선택된 옵션입니다.');
                              return;
                            }

                            setState(() {
                              _options.add(('옵션 $i', 1, 20000));
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
                              Text('옵션 $i'),
                              const Spacer(),
                              Text(
                                NumberFormat(',###').format(20000),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        if (i < 10 - 1)
                          const Divider(
                            color: Colors.black12,
                          )
                      ]
                    ],
                  ),
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
      child: SafeArea(
        minimum: const EdgeInsets.only(bottom: Gaps.size2),
        child: Column(
          children: [
            Gaps.v3,
            Expanded(
              child: ListView(
                physics: ClampingScrollPhysics(),
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
                        padding:
                            const EdgeInsets.symmetric(horizontal: Gaps.size2),
                        height: boxHeight,
                        margin:
                            const EdgeInsets.symmetric(horizontal: Gaps.size2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black26, width: 0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '옵션선택',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.expand_more, color: Colors.grey[800])
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gaps.v2,
                  if (_options.isNotEmpty)
                    Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: Gaps.size2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: Gaps.size2, vertical: Gaps.size2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black26, width: 0.5),
                      ),
                      child: Column(
                        children: [
                          for (int i = 0; i < _options.length; i++) ...[
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _options[i].$1,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _options.removeAt(i);
                                        });
                                      },
                                      child: Icon(Icons.do_not_disturb_on,
                                          size: 16, color: Colors.grey[400]),
                                    )
                                  ],
                                ),
                                Gaps.v1,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          if (_options[i].$2 == 1) return;
                                          setState(() {
                                            _options[i] = (
                                              _options[i].$1,
                                              _options[i].$2 - 1,
                                              _options[i].$3
                                            );
                                          });
                                        },
                                        child: const Icon(Icons.remove)),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 40,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Gaps.size1),
                                      child: Text('${_options[i].$2}',
                                          style: const TextStyle(fontSize: 16)),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _options[i] = (
                                              _options[i].$1,
                                              _options[i].$2 + 1,
                                              _options[i].$3
                                            );
                                          });
                                        },
                                        child: const Icon(Icons.add)),
                                    const Spacer(),
                                    Text(
                                      NumberFormat(',###').format(
                                          _options[i].$2 * _options[i].$3),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            if (i < _options.length - 1)
                              const Divider(
                                color: Colors.black12,
                              )
                          ],
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Gaps.v2,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: Gaps.size2),
              child: Row(
                children: [
                  Text('총 수량 ', style: const TextStyle(fontSize: 16)),
                  Text(
                    _options
                        .fold<int>(
                            0,
                            (previousValue, element) =>
                                previousValue + element.$2)
                        .toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent),
                  ),
                  Text('개', style: const TextStyle(fontSize: 16)),
                  const Spacer(),
                  Text('총 금액 ', style: const TextStyle(fontSize: 16)),
                  Text(
                    NumberFormat(',###').format(_options.fold<int>(
                        0,
                        (previousValue, element) =>
                            previousValue + element.$2 * element.$3)),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent),
                  ),
                  Text('원', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Gaps.v2,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Gaps.size2),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child:
                    FilledButton(onPressed: () {}, child: const Text('바로구매')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
