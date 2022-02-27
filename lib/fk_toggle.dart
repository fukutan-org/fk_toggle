library fk_toggle;

import 'package:flutter/material.dart';

typedef OnSelected = void Function(int idx, FkToggle instance);

class FkToggle extends StatefulWidget {
  const FkToggle({
    Key? key,
    required this.width,
    required this.height,
    required this.labels,
    this.cornerRadius = 10,
    this.backgroundColor = Colors.black26,
    this.selectedColor = Colors.blue,
    this.disabledElementColor = Colors.black54,
    this.enabledElementColor = Colors.white,
    this.fontSize = 16.0,
    this.icons,
    this.onSelected
  }):   assert(labels.length >= 2),
        assert(width > 0),
        assert(height > 0),
        assert(cornerRadius > 0),
        super(key: key);

  ///
  /// Width of a toggle button length, warning: this is not full length!!<br>
  /// example, width is 50.0 and labels are [1,2] that results of below.<br>
  ///   [  1 (50.0) ][  2 (50.0) ]<br>
  /// So makes a full length 100.0 size toggle buttons include 2 label texts.<br>
  ///
  final double width;

  ///
  /// Height of toggle buttons.
  ///
  final double height;

  ///
  /// Required toggle button texts. Allow empty text.<br>
  /// FkToggle(<br>
  ///   <t>width: 50,<br>
  ///   height: 30,<br>
  ///   labels: const ['1', '2', '', '', '3', '4']<br>
  /// )<br>
  ///<br>
  ///   Result [1][2][][][3][4], So Some toggles has empty text.<br>
  ///   For example case of wants to set icons in empty label buttons.<br>
  ///
  final List<String> labels;

  ///
  /// Typical 10 to 20, Recommended 5 to 30.
  ///
  final double cornerRadius;

  ///
  /// unselected toggle color
  ///
  final Color backgroundColor;

  ///
  /// selected toggle color
  ///
  final Color selectedColor;

  ///
  /// unselected label color
  ///
  final Color disabledElementColor;

  ///
  /// selected label color
  ///
  final Color enabledElementColor;

  ///
  /// font size of labels
  ///
  final double fontSize;

  ///
  /// Allow null value in lists,You can set an icon for any Toggl
  ///
  final List<Icon?>? icons;

  ///
  /// provide toggle change event, Provide index and instance
  ///
  final OnSelected? onSelected;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<FkToggle> {
  late final Widget _selectedSwitch;
  late final BorderRadius _roundedRadius;

  double _leftMargin = 0.0;
  int _selectedIndex = 0;

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
          width: widget.width * widget.labels.length,
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
                      children: _buildLabels()
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLabels() {
    final List<Widget> list = [];
    widget.labels.asMap().forEach((idx, label) {
      final child = Expanded(
        flex: 1,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
                fontSize: widget.fontSize,
                color: _selectedIndex == idx
                    ? widget.enabledElementColor
                    : widget.disabledElementColor),
            children: [
              TextSpan(text: label),
              WidgetSpan(child: _tryGet(widget.icons, idx) ?? const SizedBox())
            ]
          ),
        )
      );
      list.add(child);
    });
    return list;
  }

  Icon? _tryGet(List<Icon?>? icons, int idx) {
    if (icons != null && idx < icons.length) {
      return icons[idx];
    }
    return null;
  }
}
