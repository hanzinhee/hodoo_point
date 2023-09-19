import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';

class ShoppingBuyOptionSheet extends StatefulWidget {
  const ShoppingBuyOptionSheet({super.key});

  @override
  State<ShoppingBuyOptionSheet> createState() => _ShoppingBuyOptionSheetState();
}

class _ShoppingBuyOptionSheetState extends State<ShoppingBuyOptionSheet> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  // 드롭다운 생성.
  void _createOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = _customDropdown();
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  // 드롭다운 해제.
  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // 드롭다운.
  OverlayEntry _customDropdown() {
    return OverlayEntry(
      maintainState: true,
      builder: (context) => CompositedTransformFollower(
        link: _layerLink,
        offset: const Offset(0, 60),
        child: Material(
          color: Colors.white,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text('d'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Gaps.size2),
      height: 500,
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        controller: ScrollController(),
        children: [
          InkWell(
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
                height: 60,
                padding: const EdgeInsets.all(Gaps.size2),
                decoration: BoxDecoration(color: Colors.grey),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('옵션선택'), Icon(Icons.expand_more)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
