library fk_toggle;

import 'package:flutter/material.dart';

typedef OnSelected = void Function(int idx, FkToggle instance);

class FkToggle extends StatefulWidget {
  const FkToggle(
      {Key? key,
        required this.width,
        required this.height,
        required this.size,
        this.cornerRadius = 10,
        this.backgroundColor = Colors.black26,
        this.selectedColor = Colors.blue,
        this.disabledElementColor = Colors.black54,
        this.enabledElementColor = Colors.white,
        this.fontSize = 16,
        this.icons,
        this.labels,
        this.onSelected})
      : assert(size >= 2),
        assert(width > 0),
        assert(height > 0),
        assert(cornerRadius > 0),
        super(key: key);

  /// width of a part of toggle switch
  final double width;
  final double height;

  /// required size >= 2
  final int size;
  final double cornerRadius;
  final Color backgroundColor;
  final Color selectedColor;
  final Color disabledElementColor;
  final Color enabledElementColor;
  final int fontSize;
  final List<Icon>? icons;
  final List<String>? labels;
  final OnSelected? onSelected;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<FkToggle> {
  // late final double _width;
  late final Widget _selectedSwitch;
  late final BorderRadius _roundedRadius;

  double _leftMargin = 0.0;
  int _selectedIndex = 0;

  // AnimationController slideAnimation =

  @override
  void initState() {
    super.initState();
    _roundedRadius = BorderRadius.all(Radius.circular(widget.cornerRadius));
    _selectedSwitch = Material(
      color: widget.selectedColor,
      borderRadius: _roundedRadius,
      child: InkWell(
        onTap: () {},
        borderRadius: _roundedRadius,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: _roundedRadius,
      color: widget.backgroundColor,
      child: InkWell(
        highlightColor: Colors.white54,
        borderRadius: _roundedRadius,
        radius: 50,
        onTap: () {},
        onTapDown: (TapDownDetails details) {
          final int index = details.localPosition.dx ~/ widget.width;
          setState(() {
            _selectedIndex = index;
            _leftMargin = (index * (widget.width));
          });
          if (widget.onSelected != null) {
            widget.onSelected!(index, widget);
          }
          debugPrint('tapDown');
        },
        child: SizedBox(
          width: widget.width * widget.size,
          height: widget.height,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: _leftMargin),
                child: _selectedSwitch,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildElements()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildElements() {
    final List<Widget> list = [];
    widget.labels?.asMap().forEach((idx, label) {
      final text = Expanded(
          flex: 1,
          child: Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: _selectedIndex == idx
                      ? widget.enabledElementColor
                      : widget.disabledElementColor)));
      list.add(text);
    });
    return list;
  }
}
